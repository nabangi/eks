# Engineering Learning Series - EKS

## Final Project

### 1. Frontend

  * 1.1 -  Download the source code and deploy to your Kubernetes cluster
    - **You will need a Docker Hub account**, create one if you don't have one yet
    - If you need to run Docker commands we recommend doing it from the Cloud9 environment
    - Source code is available here the in the `project/` directory.
    - Use `awsels/frontend-base` (already in Docker Hub) as the base image
    - **Important**: The application is configured to listen on TCP/4567

  * 1.2 - Make sure the frontend is accessible from the internet

  * 1.3 - Test the connection to the frontend

  * 1.4 - Test the connection to the backend (database)

### 2. Backend
 - Deploy the following image to your cluster: `awsels/backend`
 - The backend is MongoDB running on the default port

### 3. Test

 - Re-test the connection to the backend (database) - make adjustments if necessary

## Bonus points (in any order)

Once the project is completed, for bonus points work on the below!

* Restrict the access to the frontend to a given IP address or range

* Put your image in Amazon ECR repository and update your K8s objects

* Configure the frontend to automatically scale based on CPU utilization

* Migrate to using an Application Load Balancer for the frontend service

* Configure health checks for the frontend and backend Pods

---

## Upload your Project feedback

[Event Dashboard](http://engineerlearningseries.ap-southeast-2.elasticbeanstalk.com)

---

## Cleanup (only do this at the end of the third session)

Follow the below steps to delete the EKS cluster and Cloud9 environment

## Delete the EKS cluster

This can be done in the Cloud9 console, navigate to Cloud9, or click the link below:

| Region          | EC2     |
| --------------- |:------------------:|
| us-east-1       | [Console link](https://us-east-1.console.aws.amazon.com/cloud9/home?region=us-east-1) |
| us-west-2       | [Console link](https://us-west-2.console.aws.amazon.com/cloud9/home?region=us-west-2) |
| ap-southeast-1  | [Console link](https://ap-southeast-1.console.aws.amazon.com/cloud9/home?region=ap-southeast-1) |

* Delete the EKS cluster from the Cloud9 terminal with the below command:

```bash
eksctl delete cluster eks
```

## Delete the Cloud9 CloudFormation stack

This can be done in the CloudFormation console, navigate to CloudFormation, or click the link below:

| Region          | EC2     |
| --------------- |:------------------:|
| us-east-1       | [Console link](https://us-east-1.console.aws.amazon.com/cloudformation/home?region=us-east-1) |
| us-west-2       | [Console link](https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2) |
| ap-southeast-1  | [Console link](https://ap-southeast-1.console.aws.amazon.com/cloudformation/home?region=ap-southeast-1) |

There may be a number of stacks, select the stack named "cloud9", and click the "Delete" button


---

## Handouts

* [Day 1 Slides](handouts/day1.pdf)
* [Day 2 Slides](handouts/day2.pdf)

---

## Launching an EKS Cluster

Follow the below steps to get setup with a Cloud9 environment and create your Cluster.

## 1. Launch a Cloud9 Environment

Click the button to begin creating a CloudFormation stack for the region you are assigned.

Preferably right click an open it in a new tab.

| Region          | CloudFormation     |
| --------------- |:------------------:|
| us-east-1       | [![Launch Stack](https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png)](https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?stackName=cloud9&templateURL=https://eks2019.s3-ap-southeast-2.amazonaws.com/cloud9-template.yml) |
| us-west-2       | [![Launch Stack](https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png)](https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?stackName=cloud9&templateURL=https://eks2019.s3-ap-southeast-2.amazonaws.com/cloud9-template.yml) |
| ap-southeast-1  | [![Launch Stack](https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png)](https://console.aws.amazon.com/cloudformation/home?region=ap-southeast-1#/stacks/new?stackName=cloud9&templateURL=https://eks2019.s3-ap-southeast-2.amazonaws.com/cloud9-template.yml) |

Just before clicking "Create stack" button, please tick "I acknowledge that AWS CloudFormation might create IAM resources." 

If you get stuck, the CloudFormation template is available [here](https://eks2019.s3-ap-southeast-2.amazonaws.com/cloud9-template.yml)

## 2. Attach the IAM Role to the Cloud9 instance

This can be done in the EC2 console, navigate to your EC2 instances, or click the link below:

Preferably right click an open it in a new tab.

| Region          | EC2     |
| --------------- |:------------------:|
| us-east-1       | [Console link](https://us-east-1.console.aws.amazon.com/ec2/v2/home?region=us-east-1#Instances:tag:Name=cloud9;sort=instanceState) |
| us-west-2       | [Console link](https://us-west-2.console.aws.amazon.com/ec2/v2/home?region=us-west-2#Instances:tag:Name=cloud9;sort=instanceState) |
| ap-southeast-1  | [Console link](https://ap-southeast-1.console.aws.amazon.com/ec2/v2/home?region=ap-southeast-1#Instances:tag:Name=cloud9;sort=instanceState) |

 * Select the Cloud9 instance
 * Click Actions > Instance Settings > Attach/Replace IAM Role
 * Filter the roles, searching for "cloud9"
 * Click Apply once the role is selected

## 3. Access the Cloud9 environment

This can be done in the Cloud9 console, navigate to Cloud9 or click the link below:

Preferably right click an open it in a new tab.


| Region          | EC2     |
| --------------- |:------------------:|
| us-east-1       | [Console link](https://us-east-1.console.aws.amazon.com/cloud9/home?region=us-east-1) |
| us-west-2       | [Console link](https://us-west-2.console.aws.amazon.com/cloud9/home?region=us-west-2) |
| ap-southeast-1  | [Console link](https://ap-southeast-1.console.aws.amazon.com/cloud9/home?region=ap-southeast-1) |

 * Click Open IDE

## 4. Setup the Cloud9 environment

The environment will be our workstation for the sessions, there are a few steps needed to get it setup

* From within the Cloud9 environment perform the below steps:

  * Click on AWS Cloud9 (top left) > Preferences
  * Click on AWS SETTINGS > Credentials
  * Turn off 'AWS managed temporary credentials'

* Change to a dark theme if you prefer:

  * View > Themes > UI Themes > Classic Dark

### Run the below commands in the Cloud9 terminal

#### Clone the repository

```bash
git clone https://github.com/els-syd/eks.git
```

#### Run the bootstrap script

The script installs and configures the necessary pre-requisites

```bash
eks/scripts/bootstrap.sh
```

Confirm the IAM role is as expected

## 5. Launch the EKS Cluster

Before launching the cluster with the command below, ensure the IAM role is correct in the previous step

```bash
eksctl create cluster --ssh-access --version 1.13 --node-type t3.medium --name eks
```

The EKS cluster creation process will take about 15-20 minutes

Once complete, 2 Worker Nodes should now be in Ready status

```bash
kubectl get nodes
```

Example output:

```
NAME                                               STATUS   ROLES    AGE   VERSION
ip-192-168-29-29.ap-southeast-1.compute.internal   Ready    <none>   27h   v1.13.7-eks-c57ff8
ip-192-168-88-24.ap-southeast-1.compute.internal   Ready    <none>   27h   v1.13.7-eks-c57ff8
```

### View the EKS Cluster in the console

To view the EKS Cluster configuration, navigate to EKS in the console or click the link below:

| Region          | EC2     |
| --------------- |:------------------:|
| us-east-1       | [Console link](https://us-east-1.console.aws.amazon.com/eks/home?region=us-east-1#/clusters/eks) |
| us-west-2       | [Console link](https://us-west-2.console.aws.amazon.com/eks/home?region=us-west-2#/clusters/eks) |
| ap-southeast-1  | [Console link](https://ap-southeast-1.console.aws.amazon.com/eks/home?region=ap-southeast-1#/clusters/eks) |

---

# Cleanup (Only do this after the end of all three sessions)

After the end of all three sessions, follow the below steps to delete the EKS cluster and Cloud9 environment

## Delete the EKS cluster

This can be done in the Cloud9 console, navigate to Cloud9, or click the link below:

| Region          | EC2     |
| --------------- |:------------------:|
| us-east-1       | [Console link](https://us-east-1.console.aws.amazon.com/cloud9/home?region=us-east-1) |
| us-west-2       | [Console link](https://us-west-2.console.aws.amazon.com/cloud9/home?region=us-west-2) |
| ap-southeast-1  | [Console link](https://ap-southeast-1.console.aws.amazon.com/cloud9/home?region=ap-southeast-1) |

* Delete the EKS cluster from the Cloud9 terminal with the below command:

```bash
eksctl delete cluster eks
```

## Delete the Cloud9 CloudFormation stack

This can be done in the CloudFormation console, navigate to CloudFormation, or click the link below:

| Region          | EC2     |
| --------------- |:------------------:|
| us-east-1       | [Console link](https://us-east-1.console.aws.amazon.com/cloudformation/home?region=us-east-1) |
| us-west-2       | [Console link](https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2) |
| ap-southeast-1  | [Console link](https://ap-southeast-1.console.aws.amazon.com/cloudformation/home?region=ap-southeast-1) |

There may be a number of stacks, select the stack named "cloud9", and click the "Delete" button
