===================================
ssato.simple_httpd_example role
===================================

.. image:: https://img.shields.io/travis/ssato/ansible-role-simple-httpd-example.png
   :target: https://travis-ci.org/ssato/ansible-role-simple-httpd-example
   :alt: [Test Status]

.. .. image:: https://img.shields.io/ansible/role/<TBD>.svg
   :target: https://galaxy.ansible.com/ssato/simple_httpd_example
   :alt: [Ansible Galaxy]

An ansible role to show how to do Ansible Role CI using the following tools.

- molecule (https://molecule.readthedocs.io), a de facto test framework for ansible
- ansible as a molecule's verifier
- bash to run bats (https://github.com/sstephenson/bats) as an alternative test tool

Requirements
==============

- Linux Server running RHEL or CentOS or Fedora
- Access to Yum repository contains httpd or nginx RPM from the server
- Others for tests:

  - nc to check listening port

Role Variables
================

Variables should be customized for your use cases.

- rntebr_mode: 'dump' or 'dryrun' or other string including 'normal'

  - Set to 'dump' if you want dump the output of results of command run
  - Set to 'dryrun' if you just want to test regex pattern matches w/ reference
    data was given. (You need to prepare the reference data by yourself.)
  - Set to other string including 'normal' if you want to run command and test
    existence of target objects by finding regex matches given

- rntebr_targets_patterns: Regex patterns to search for target objects from
  outputs as a result of command run

- rntebr_res: Set to some results on 'dryrun' mode
- rntebr_dump_path: output file path on 'dump' mode
- rntebr_command: command to run on target network nodes on !'dryrun' mode

Other variables should not needed to be customized for most cases.

see also defaults/main.yml for default definitions of each variables and tests/files/\*_evars_\*.yml for .

Example Playbook
==================

see tests/playbook.yml

License
=========

MIT

Author
=========

Satoru SATOH `ssato@Github <https://github.com/ssato>`_

.. vim:sw=2:ts=2:et:
