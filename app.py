#!/usr/bin/env python3

from aws_cdk import core

from lambda_app.lambda_app_stack import LambdaAppStack


app = core.App()
LambdaAppStack(app, "lambda_app")

app.synth()
