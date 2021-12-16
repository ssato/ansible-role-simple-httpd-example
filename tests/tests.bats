#! /usr/bin/bats
#
# Requirements:
#   - bats: https://github.com/sstephenson/bats
#
function setup () {
    export INVENTORY=${1:-hosts.yml}
    cd $BATS_TEST_DIRNAME
}

function check_results () {
    [[ ${status} -eq 0 ]] || {
        cat << EOM
output:
${output}
EOM
        exit ${status}
    }
}

function skip_if_user_is_not_root () {
    idu=$(id -u)
    [[ ${idu} == "0" ]] || skip "Running user is Not root."
}

@test "Lint all yaml files" {
    run yamllint --strict .
    check_results
}

@test "Check styles of all playbook files" {
    for yml in prepare.yml converge.yml verify.yml
    do
        run ansible-lint ${yml}
    done
    check_results
}

@test "Test applying the role" {
    skip_if_user_is_not_root

    run ansible-playbook -v -i ${INVENTORY} prepare.yml
    check_results

    run ansible-playbook -v -i ${INVENTORY} converge.yml
    check_results

    run ansible-playbook -v -i ${INVENTORY} verify.yml
    check_results
}

@test "Test verifying the reusult of the role" {
    skip_if_user_is_not_root

    run ansible-playbook -v -i ${INVENTORY} converge.yml -e @res/verify_params.yml
    check_results

    run ansible-playbook -v -i ${INVENTORY} verify.yml \
        -e @roles/ssato.simple_httpd_example/defaults/main.yml
    check_results
}

# vim:sw=4:ts=4:et:filetype=sh:
