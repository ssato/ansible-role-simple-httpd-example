# Info

本 Ansible Role は Linux をターゲットホストとして典型的なシステムサービスのセットアップを行う。
典型的なシステムサービスの例として Apache httpd を選択し、実装している。

#  Goals

- Linux ターゲットホストで systemd に制御される、典型的なシステムサービスのセットアップを行う Ansible 実装例を示す
- 基本的な Ansible Role の組み込みテストと molecule を用いたテスト実装の例を示す
- SaaS 利用による CI 設定の例を示す
- その他、Ansible Role 開発に必要となる要素の参照実装となることを目指す

## Non Goals

- 汎化や高機能化全般、例えば、以下のようなものはゴールとしない想定
  - 他のターゲットへの対応
  - Apache httpd に特化した、より柔軟で高機能な設定の機能
  - Apache httpd 以外のシステムサービスへの対応
- べき等性の担保

# Background

昨今 Ansible Role の実装例は以前よりは格段に増えているが、以前以下のような課題があるという印象が残る。

- Ansible Role 実装のより完全な形での実装例が少い
- テストを実装していないものが多い
- CI 設定を行っていないか、行なっていてもテスト実装がより充足された形で実装されていないものが多い
- role 変数の validation を行っていないか、不十分なものが多い

本 Ansible Role は上記をふまえ、より情報と説明を実例を通して補完できることを目指す。

# Implementation Overview

- 変数はすべて defaults/ 下に定義
- meta/argument_specs.yml を活用して role 変数の validation を行う
- tasks/ に task 定義を分割定義
  - main.yml: 他を ansible.builtin.include_tasks で include するのみ
  - pre\*.yml: 主に role 変数の validation を行う
  - test\*.yml: role 組み込みのテスト。フラグ変数 (sshe_verification_mode) の切替により実行を制御
    - フラグ変数の代わりに tags 利用も検討したがインベントリデータで制御できるわかりやすさと実行のしやすさ、履歴の残りやすさを優先した
- コードスタイルチェックやテストは molecule 経由で行う
   - テストドライバは RHEL や Fedora で使いやすくより安全な podman と localhost (delegated) の利用を想定

# Design and implementation details

TBD

# Limitations and issues

- 対応 OS は RHEL と Debian のみ、十分にテストしているのは RHEL
- molecule のテストドライバは現行以外に対応する予定はない
- 今のところ設定変更の自由度は低い (汎用性を意図していないため)

# References

- molecule: https://molecule.readthedocs.io/en/latest/
- tox: https://tox.wiki/en/latest/
- Role argument validation: https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html#role-argument-validation
