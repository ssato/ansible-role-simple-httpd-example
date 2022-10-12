= Info

本 Ansible Role は Linux をターゲットホストとして典型的なシステムサービスのセットアップを行います。
典型的なシステムサービスの例として apache httpd を選択し、実装しています。

=  Goals

- Linux ターゲットホストに典型的なシステムサービスのセットアップを行う Ansible 実装例を示す
- 基本的な Ansible Role の組み込みテストと molecule を用いたテスト実装の例を示す
- SaaS 利用による CI 設定の例を示す
- その他、Ansible Role 開発に必要となる要素の参照実装となることを目指す

= Background

昨今 Ansible Role の実装例は以前よりは格段に増えているが、以前以下のような課題があるという印象が残る。

- Ansible Role 実装のより完全な形での実装例が少い
- テストを実装していないものが多い
- CI 設定を行っていないか、行なっていてもテスト実装がより充足された形で実装されていないものが多い
- role 変数の validation を行っていないか、不十分なものが多い

本 Ansible Role は上記をふまえ、より情報と説明を実例を通して補完できることを目指す。

= Implementation Overview

- 変数はすべて defaults/ 下に定義
- meta/argument_specs.yml を活用して role 変数の validation を行う
- tasks/ に task 定義を分割定義
  - main.yml: 他を ansible.builtin.import_tasks で import するのみ
  - pre*.yml: 主に role 変数の validation を行う
  - 
- コードスタイルチェックやテストは molecule で行う

= Design and implementation details

TBD

= Limitations and issues

- 対応 OS は RHEL と Debian のみ、十分にテストしているのは RHEL
- 今のところ設定変更の自由度は低い (汎用性を意図していないため)

= References

- molecule: https://molecule.readthedocs.io/en/latest/
- tox: https://tox.wiki/en/latest/
- Role argument validation: https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html#role-argument-validation