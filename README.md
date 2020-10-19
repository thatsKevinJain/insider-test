### Setup
I have tested the entire setup on `Minikube` | `MacOS` | `4 CPUs` | `8GB RAM`

#### Push & pull images -
You can directly run the following commands to push/pull images, they will automatically login and run out of the box - 
```
chmod +x scripts/push-image.sh && scripts/push-image.sh
chmod +x scripts/pull-image.sh && scripts/pull-image.sh
```

#### How to test the app on kubernetes - 

You need to login first and create the login secret - <br>
```
chmod +x scripts/login.sh && scripts/login.sh
```
**Assumption** - The setup was tested locally on Minikube configured with default settings. <br>

Now you can **deploy the application** using the following command -
```
kubectl apply -f k8/deployment.yaml
```
---

#### Testing

To check if the pods are running, use this command and open `localhost:3000` on your browser - 
```
kubectl port-forward service/nodejs-test 3000:3000
```

---
#### Completed Tasks - 
- There should be 10 replicas running.
- Use a custom docker image hosted on ECR called nodejs-test:latest (any region).
- Any change to the deployment should always ensure at least 7 replicas are running at all times.
- The deployment should autoscale at average 50% cpu and 60% memory.
- Bonus points if you include how to login and pull an image from ECR.
- Should have higher priority than daemonset pods.

---
#### To Do -
Write a simple Kubernetes manifest to expose a nodejs server with the following config:
- Expose the app on port 3000 via an EC2 classic load balancer. `Could not setup EC2 load balancer due to pricing concerns of running pods on servers`
- Should load test the application and include the test results in your submission. `I could not complete the load test due the some issues faced locally with Horizontal Pod Scaler.`
- Should do task as code i.e. using terraform or any other configuration language of your choice.

---
