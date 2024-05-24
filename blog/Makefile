PROFILE = yokohama

list:
	aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId, Tags[?Key==`Name`].Value | [0], State.Name]' --output text --profile $(PROFILE)

stop:
	./blog_instance.sh stop $(PROFILE)

start:
	./blog_instance.sh start $(PROFILE)
