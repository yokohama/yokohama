#!/bin/bash

INSTANCE_NAME=blog

ACTION=$1
PROFILE=$2

# インスタンスのインスタンスIDの取得
instance_ids=$(aws ec2 describe-instances \
  --filters "Name=tag:Name,Values=${INSTANCE_NAME}" \
  --query "Reservations[*].Instances[*].InstanceId" \
  --output text --profile ${PROFILE})

# インスタンスIDの存在確認
if [ -z "$instance_ids" ]; then
  echo "No instances found with the name 'blog'"

else
  # 取得したインスタンスIDでインスタンスを停止
  if [[ $ACTION == "stop" ]]; then
    aws ec2 stop-instances --instance-ids $instance_ids --profile ${PROFILE}
    echo "Stopping instance(s): $instance_ids"

  # 取得したインスタンスIDでインスタンスを停止
  elif [[ $ACTION == "start" ]]; then
    aws ec2 start-instances --instance-ids $instance_ids --profile ${PROFILE}
    echo "Stopping instance(s): $instance_ids"

  else
    echo "action name ${ACTION} was not found."
  fi
fi
