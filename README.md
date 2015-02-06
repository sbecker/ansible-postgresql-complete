# Postgres 9.4

This is work in progress. Installs a Postgres 9.4 server on Ubuntu, monitored by monit, with continuous archiving to S3 with wal-e.

# How to use

Run this playbook on a single server:

$ ansible-playbook pg94.yml -e "target=hostname"

