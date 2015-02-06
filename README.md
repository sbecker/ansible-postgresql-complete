# Ansible Postgres Complete

(Work in progress)

Installs Postgres on Ubuntu, monitored by monit, with continuous archiving to S3 with wal-e.

# Features
* Installs up to date Postgres
* Sets up NTP, keeps time on server up to date
* Sets up monit to monitor postgres, ssh, and ntp
* Sets up continuous archiving (once a minute) of Postgres data to AWS S3, with 7 day retention (adjustable).

# Prerequisites
* An Ubuntu server
* An AWS account
* An S3 bucket for backups
* An IAM account access keys and restricted permissions to write, but not delete, to the backup bucket.

  Example policy:
  ```json
      {
        "Statement": [
          {
            "Sid": "xyz123",
            "Action": [
              "s3:GetObject",
              "s3:ListBucket",
              "s3:PutObject"
            ],
            "Effect": "Allow",
            "Resource": [
              "arn:aws:s3:::your-bucket-name`",
              "arn:aws:s3:::your-bucket-name`/*"
            ]
          }
        ]
      }
  ```

# How to use
1. Start a server instance running Ubuntu 14.04.
2. To run this playbook on a single server:

$ ansible-playbook postgresql.yml -e "target=hostname"

Still learning Ansible best practices. This isn't yet a reusable playbook.

# TODO
- Use pg_tune to optimize Postgres settings on install
- Make pull request to Stouts.wale to support delete command
- Make this more re-usable
