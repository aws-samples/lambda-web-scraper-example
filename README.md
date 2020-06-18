# A web scraper running on AWS Lambda
This an example of a web scraper running on AWS Lambda and Lambda Layers. It assumes, that you have [AWS CDK][cdk] and Docker installed. The docker image relies on [serverless-chrome][chromium].

### Create a CDK app enviroment

	cdk init --language python

### install libraries

	pip install aws-cdk.core
	pip install aws-cdk.aws_lambda
	pip install aws-cdk.aws_events_targets
	pip install aws-cdk.aws_events

### copy the files below to created app folder

	run.sh
	index.py
	app.py
	Dockerfile
	lambda_app/lambda_app_stack.py


### build the Docker image, the output will be stored in python/ folder

	docker build -t myapp .
	docker run -i -v `pwd`/python:/opt/ext -t myapp

### create a S3 bucket for the assets

	cdk bootstrap aws://your AWS ID/region

### deploy to AWS

	cdk deploy



[cdk]: https://aws.amazon.com/cdk/
[chromium]: https://github.com/adieuadieu/serverless-chrome/
