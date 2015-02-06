# Ansible Postgres Complete

This is work in progress. Installs a Postgres server on Ubuntu, monitored by monit, with continuous archiving to S3 with wal-e.

# How to use

Run this playbook on a single server:

$ ansible-playbook postgresql.yml -e "target=hostname"

Still learning Ansible best practices. This isn't yet a reusable playbook.

# TODO

- Remove old backups after a certain date.
- Document how to create an IAM account for S3 with restricted permissions to write but not delete
- Make this more re-usable
