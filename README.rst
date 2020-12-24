===================================
ssato.simple_httpd_example role
===================================

.. image:: https://img.shields.io/travis/ssato/ansible-role-simple-httpd-example.png
   :target: https://travis-ci.org/ssato/ansible-role-simple-httpd-example
   :alt: [Travis-CI Status]

.. image:: https://github.com/ssato/ansible-role-simple-httpd-example/workflows/Tests/badge.svg
   :target: https://github.com/ssato/ansible-role-simple-httpd-example/actions?query=workflow%3ATests
   :alt: [GitHub Actions Status]

..  image:: https://dev.azure.com/satorusatoh0471/ansible-role-simple-httpd-example/_apis/build/status/ssato.ansible-role-simple-httpd-example
   :target: https://dev.azure.com/satorusatoh0471/ansible-role-simple-httpd-example/_build/latest?definitionId=1
   :alt: [Azure Pipelines Status]

.. .. image:: https://img.shields.io/ansible/role/<TBD>.svg
   :target: https://galaxy.ansible.com/ssato/simple_httpd_example
   :alt: [Ansible Galaxy]

An ansible role to show how to do Ansible Role CI using the following tools.

- molecule (https://molecule.readthedocs.io), a de facto test framework for ansible, with ansible as a molecule's verifier
- bats (https://github.com/sstephenson/bats) to run a kind of integration tests
- tox (https://tox.readthedocs.io) to run these commands in various environments

Requirements
==============

- Linux Server running RHEL or CentOS or Fedora
- Access to Yum repository contains httpd or nginx RPM from the server
- Others for tests:

  - nc to check listening port

Role Variables
================

Variables may be customized as needed.

- sshe_verification_mode: Verification mode flag,

  - false [default]: All tasks except for verification tasks will run
  - true: Only verification tasks will run

- sshe_httpd_pkg: www server package name ['httpd' or 'apache2']
- sshe_httpd_service: system service name of the www server [same as sshe_httpd_pkg]
- sshe_httpd_port: HTTP Listening port
- sshe_httpd_configs: A list of {'path':, 'pattern': } denotes configuration
  file path and configuration string pattern to search

Other variables should not needed to be customized for most cases.

- os_family: (Linux) OS family name [ansible_os_family or 'RedHat']

see also defaults/main.yml for default definitions of each variables and tests/files/\*_evars_\*.yml for .

Example Playbook
==================

see tests/converge.yml

How to test this role
======================

This ansible role contains the built-in tests. You can test this ansible role
by enabling the verfication mode (set true to the variable
sshe_verification_mode).

License
=========

MIT

Author
=========

Satoru SATOH `ssato@Github <https://github.com/ssato>`_

.. vim:sw=2:ts=2:et:
