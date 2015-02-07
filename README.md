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
1. Start one or more server instances running Ubuntu 14.04.
2. Copy `staging.sample` to `staging`, and/or `production.sample` to production, and setup db hostnames/ip addresses
3. Copy `group_vars/dbservers.sample` to `group_vars/dbservers` and update the database name, password, and aws keys. 
4. Then, to deploy the dbservers, run:

  ```
  $ ansible-playbook -i staging dbservers.yml
  # or
  $ ansible-playbook -i production dbservers.yml
  ```

Still learning Ansible best practices. This isn't yet a reusable playbook.

# TODO
- Use pg_tune to optimize Postgres settings on install
- Optimize kernal shared memory settings: 
- Use EC2 dynamic inventory: http://docs.ansible.com/intro_dynamic_inventory.html
- Support creation of multiple databases

# Done
* Make pull request to Stouts.wale to install up-to-date "six" package
* Make pull request to Stouts.wale to support delete command