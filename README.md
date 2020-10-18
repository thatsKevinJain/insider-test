#### To Do -
Write a simple Kubernetes manifest to expose a nodejs server with the following config:
- Expose the app on port 3000 via an EC2 classic load balancer.
- Should do task as code i.e. using terraform or any other configuration language of your choice.
- Should load test the application and include the test results in your submission.

#### Completed Tasks - 
- There should be 10 replicas running.
- Use a custom docker image hosted on ECR called nodejs-test:latest (any region).
- Any change to the deployment should always ensure at least 7 replicas are running at all times.
- The deployment should autoscale at average 50% cpu and 60% memory.
- Bonus points if you include how to login and pull an image from ECR.
- Should have higher priority than daemonset pods.

### Setup
I have tested the entire setup on `Minikube`

#### How to Login (To enable ECR Image Pull)- 

Configure AWS and enter the credentials -
```
aws configure
```
- AWS_KEY_ID - `AKIAI4WRGV3AR6KAJIIA`
- AWS_SECRET_KEY - `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`
- REGION - `ap-south-1`

Login and get Token -
```
TOKEN=$(aws ecr get-login-password --region ap-south-1)
```

Create a new secret -
```
kubectl create secret docker-registry regcred --docker-server=034976329924.dkr.ecr.ap-south-1.amazonaws.com --docker-username=AWS --docker-password=${TOKEN} --docker-email=thatskevinjain@gmail.com
```

You can test if the login was successful by pulling the image -
```
docker pull 034976329924.dkr.ecr.ap-south-1.amazonaws.com/nodejs-test:latest
```

Now you can **deploy the application** using the following command -
```
kubectl apply -f k8-deployment.yaml
```

---

#### Testing

To check if the pods are running, use this command and open `localhost:3000` on your browser - 
```
kubectl port-forward service/nodejs-test 3000:3000
```

---
