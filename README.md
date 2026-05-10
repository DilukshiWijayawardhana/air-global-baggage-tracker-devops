# ✈️ AirTrack Global Baggage System (GitOps Pipeline)

Welcome to my DevOps Internship portfolio project! 

This project demonstrates a complete, real-world **GitOps Pipeline**. I built a live baggage tracking web application and automated the entire process of testing, building, and deploying it to a Kubernetes cluster using modern DevOps tools.

---

## 🛠️ Technologies Used
* **Frontend/Backend:** Go (Golang), HTML/CSS
* **Containerization:** Docker
* **CI/CD Automation:** GitHub Actions
* **Kubernetes Orchestration:** k3d (Local K8s Cluster)
* **Package Management:** Helm Charts
* **GitOps Deployment:** ArgoCD

---

## 🏗️ The "Two-Repo" Architecture
To follow IT industry best practices, I separated my application code from my infrastructure code. This project uses two repositories:

1. **The Application Repo (This Repo):** Contains the Go programming code, the HTML website, and the GitHub Action (CI) to test the code.
2. **The Infrastructure Repo:** Contains the Dockerfile, Helm Charts, and the GitHub Action (CD) to build the Docker image. 

---

## ⚙️ How The Automation Works (The Pipeline)
When a developer (me) makes a change to the website code, the following happens automatically:

1. **Code Push:** The new code is pushed to the `main` branch.
2. **Continuous Integration (CI):** GitHub Actions automatically tests the Go code to make sure there are no errors.
3. **Signal Sent:** If the test passes, a secret signal (Repository Dispatch) is sent to the Infrastructure repository.
4. **Continuous Delivery (CD):** The Infrastructure repo catches the signal, builds a brand new Docker image, and pushes it to Docker Hub.
5. **GitOps Deployment:** The ArgoCD robot, which is living inside my Kubernetes cluster, notices the new image tag. It automatically deletes the old website boxes (pods) and spins up the new ones!

---

## 🚀 How to Run This Project Locally

If you want to test this system on your own computer, follow these simple steps:

**Step 1: Start a Kubernetes Cluster**
Create a local cluster using k3d:
`k3d cluster create my-cluster`

**Step 2: Install ArgoCD**
Create a room for ArgoCD and install it:
`kubectl create namespace argocd`
`kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml`

**Step 3: Deploy the Application**
Connect ArgoCD to the Infrastructure repository. ArgoCD will read the Helm charts and automatically build the 3 application pods.

**Step 4: Open the Website**
Build a bridge to the application to view it in your web browser:
`kubectl port-forward svc/baggage-tracker-app-service 8081:8080`

Open your browser and go to `http://localhost:8081` to scan a bag!

---
*Created by Dilukshi Wijayawardhana as part of a DevOps learning journey.*
