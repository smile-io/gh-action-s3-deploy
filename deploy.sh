#!/bin/bash
set -e

export $(printf "AWS_ACCESS_KEY_ID=%s AWS_SECRET_ACCESS_KEY=%s AWS_SESSION_TOKEN=%s" \
$(aws sts assume-role \
--role-arn arn:aws:iam::307739032832:role/allow-auto-deploy-from-other-accounts \
--role-session-name AWSCLI-Session \
--query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken]" \
--output text))