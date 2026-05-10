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
<img width="1167" height="291" alt="image" src="https://github.com/user-attachments/assets/497610f8-d587-4364-8273-0b57dc95ba4f" />
<img width="1848" height="738" alt="image" src="https://github.com/user-attachments/assets/62ea154e-6beb-4c46-9e6f-9707f4751a6f" />
<img width="1575" height="825" alt="image" src="https://github.com/user-attachments/assets/7b08c229-a484-420d-897b-29952d26292f" />


**Step 2: Install ArgoCD**
Create a room for ArgoCD and install it:
`kubectl create namespace argocd`
`kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml`
<img width="1457" height="195" alt="image" src="https://github.com/user-attachments/assets/0a605db5-ccd1-4b5e-9ade-f7cdc76b436e" />

**Step 3: Deploy the Application**
Connect ArgoCD to the Infrastructure repository. ArgoCD will read the Helm charts and automatically build the 3 application pods.
<img width="1430" height="266" alt="image" src="https://github.com/user-attachments/assets/1d4f3e3c-670d-43be-8465-c474eb1ac87b" />
<img width="1430" height="302" alt="image" src="https://github.com/user-attachments/assets/385f46d2-bb3d-4bf4-8158-7b668eee40d3" />
<img width="1537" height="245" alt="image" src="https://github.com/user-attachments/assets/30cf890a-8e4a-4433-ac4f-d95aa02843f3" />


<img width="1692" height="805" alt="image" src="https://github.com/user-attachments/assets/cc489862-9180-403d-b4c1-3e5c0d80f727" />


**Step 4: Open the Website**
Build a bridge to the application to view it in your web browser:
`kubectl port-forward svc/baggage-tracker-app-service 8081:8080`
<img width="1423" height="220" alt="image" src="https://github.com/user-attachments/assets/57c5d56b-cc51-40ba-9e1c-58a3b62dd034" />

Open your browser and go to `http://localhost:8081` to scan a bag!
<img width="1918" height="945" alt="image" src="https://github.com/user-attachments/assets/f8bfcc65-5eeb-4483-8b0b-3f0495a4dd88" />

---
*Created by Dilukshi Wijayawardhana as part of a DevOps learning journey.*
