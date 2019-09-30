## AWS Engineering Learning Series - Project

![](./two-tier-application.png)

### Objective

You need to put together a 2 tier weh application, hosted in Kubernetes. The
application consists of a frontend and a backend. You will need to deploy both
and test the connectivity between the two. The application needs to be highly
available & fault tolerant.


### Steps - Frontend

1. Download the source code and deploy to your Kubernetes cluster.

    1. You'll need a Docker Hub account, create one [here](https://hub.docker.com/signup) if you don't have one yet.
    2. If you need to run Docker commands we recommend doing it from the Cloud9 environment.
    3. Source code is available in the GitHub Repo under `project/frontend`.
    4. Use `awselscpt/frontend-base` (already in Docker Hub) as the base image.
    5. **Important** - the application is configured to listen on port `tcp/4567`

1. Make sure that the frontend is accessible from the internet

1. Test the connection to the frontend

1. Test the connection to the backend from the deployed app


### Steps - Backend

1. Deploy the following image to your cluster `awselscpt/backend` (in Docker Hub already)

1. Configure your frontend to connect to your backend

1. Re-test the connnection to the backend from the frontend app - make corrections as necessary.


###