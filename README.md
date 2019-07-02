# Engineering Learning Series - EKS

Follow the below steps to get setup with a Cloud9 environment

## Launch a Cloud9 Environment

Click the button to begin creating a CloudFormation stack for the region you are assigned

| Region          | CloudFormation     |
| --------------- |:------------------:|
| us-east-1       | [![Launch Stack](https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png)](https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?stackName=cloud9&templateURL=https://els-syd-eks.s3-ap-southeast-1.amazonaws.com/cloud9-template.yml) |                    
| us-west-2       | [![Launch Stack](https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png)](https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?stackName=cloud9&templateURL=https://els-syd-eks.s3-ap-southeast-1.amazonaws.com/cloud9-template.yml) |
| ap-southeast-1  | [![Launch Stack](https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png)](https://console.aws.amazon.com/cloudformation/home?region=ap-southeast-2#/stacks/new?stackName=cloud9&templateURL=https://els-syd-eks.s3-ap-southeast-1.amazonaws.com/cloud9-template.yml) |

If you get stuck, the CloudFormation template is available [here](https://els-syd-eks.s3-ap-southeast-1.amazonaws.com/cloud9-template.yml)

## Attach the IAM Role to the Cloud9 instance

This can be done in the EC2 console, navigate to your EC2 instances, or click the link below:

| Region          | EC2     |
| --------------- |:------------------:|
| us-east-1       | [Console link](https://us-east-1.console.aws.amazon.com/ec2/v2/home?region=us-east-1#Instances:tag:Name=cloud9;sort=instanceState) |
| us-west-2       | [Console link](https://us-west-2.console.aws.amazon.com/ec2/v2/home?region=us-west-2#Instances:tag:Name=cloud9;sort=instanceState) |
| ap-southeast-1       | [Console link](https://ap-southeast-1.console.aws.amazon.com/ec2/v2/home?region=ap-southeast-1#Instances:tag:Name=cloud9;sort=instanceState) |

 * Select the Cloud9 instance
 * Click Actions > Instance Settings > Attach/replace IAM Role
 * Filter the roles, searching for "cloud9"
 * Click Apply once the role is selected

## Access the Cloud9 environment

This can be done in the Cloud9 console, navigate to Cloud9 or click the link below:

| Region          | EC2     |
| --------------- |:------------------:|
| us-east-1       | [Console link](https://ap-southeast-1.console.aws.amazon.com/cloud9/home?region=us-east-1) |
| us-west-2       | [Console link](https://ap-southeast-1.console.aws.amazon.com/cloud9/home?region=us-west-2) |
| ap-southeast-1       | [Console link](https://ap-southeast-1.console.aws.amazon.com/cloud9/home?region=ap-southeast-1) |

 * Click Open IDE

## Setup the Cloud9 environment

The environment will be our workstation for the sessions, with a few setup steps we can get it ready to work with our EKS Clusters