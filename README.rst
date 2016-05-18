================
 MariaDB Plugin
================

This plugin enables MariaDB opensource flavor of MySQL for Ubuntu users on
Devstack. It overrides functions at lib/databases/mysql.

======================
 Enabling in Devstack
======================

1. Download DevStack

2. Add this repo as an external repository::

     > cat local.conf
     [[local|localrc]]
     enable_plugin mariadb https://github.com/rafaelfolco/devstack-plugin-mariadb

3. run ``stack.sh``
