<h1>Overview</h1>
 <img width="150" height="175" alt="image" src="https://github.com/user-attachments/assets/faa075a5-dfe2-4438-89a6-b84699513cf6" />  <img width="250" height="200" alt="image" src="https://github.com/user-attachments/assets/a2657ce8-90a7-496f-a0c4-abb9a5d32f1a" />  <img width="250" height="200" alt="image" src="https://github.com/user-attachments/assets/0743f9f7-18f2-45b4-a32a-9925d19f352c" />   <img width="150" height="150" alt="image" src="https://github.com/user-attachments/assets/d8832032-ca3c-41ce-a174-50f5e271527b" />         <img width="200" height="150" alt="image" src="https://github.com/user-attachments/assets/af80f2af-89b7-4c4b-8e5f-f9927323bbfb" />   <img width="250" height="200" alt="image" src="https://github.com/user-attachments/assets/db6dcf4f-5e6e-44ef-87eb-8daa410b757c" /> <img width="150" height="150" alt="image" src="https://github.com/user-attachments/assets/76447b71-22f5-424c-b78e-83035d14893c" />  







This project delivers a cloud-native deployment pipeline for a Starbucks-Clone web application using modern DevOps tooling, security scanning, and observability. The system automates the entire lifecycle — from code commit to containerization, security checks, deployment on Kubernetes (EKS), and real-time monitoring.

- **CI/CD** (Jenkins) for automated build, test, security scan, and deployment.
-  **Docker & Dockerhub** for containerization and registry management.                               
-  **Terraform** for provisioning AWS infrastructure.
-  **Amazon EKS** for scalable Kubernetes orchestration.
-  **SonarQube** for code quality and static analysis.
-  **Trivy** for vulnerability scanning of application and container images.
-  **Prometheus + Blackbox Exporter + Grafana** for end-to-end monitoring and performance analytics.
-  **AWS ALB** for production-grade load balancing.


This setup reflects a real-world DevOps pipeline, ensuring:

- Fast delivery.
- Secure deployments.
- Scalable infrastructure.
- Actionable monitoring insights.

<h1>Architecture Diagram</h1>
<img width="1639" height="1080" alt="image" src="https://github.com/user-attachments/assets/1797a38d-e144-4c23-a7e1-2ae59ecad439" />

- Launched three EC2 instance for the jenkins server, sonarQube server and Monitoring server;
- Used T2.Large instance for the jenkins server and T2.medium for other two.
- after Launching T2.large ubuntu instance installed jenkins, awscli, trivy, docker, terraform, kubectl.
- in sonarqube server installed docker and pulled the sonarqube image to run the sonarqube
- integrated **sonarqube** for code quality check.
- configure **trivy** for container vulnerability scanning.
- The Starbucks application is deployed on **Amazon EKS** using a **LoadBalancer service**, enabling external access for end-users. Jenkins automates the deployment by pushing the Docker image to DockerHub and applying Kubernetes manifests that manage pods, services, and rollout updates.
- Setup the endpoint monitoring using **blackbox exportor** in prometheus and displayed it grafana dashboard.

<h1>Project Breakdown</h1>
**Phase 1 - CI/CD Pipeline: Build, Scan & Deploy on Jenkins Server**
<img width="963" height="457" alt="Screenshot 2025-11-17 170031" src="https://github.com/user-attachments/assets/37f1b99c-8ece-4e1a-9625-ef2ea217e2b5" />

- Pulls the latest code from GitHub
- Runs SonarQube code quality analysis
- Installs Node.js dependencies using npm
- Executes Trivy filesystem security scan
- Builds the Docker image
- Pushes the scanned image to DockerHub
- Runs a local Docker container on the Jenkins server (app runs on port 3003)
- Sends build + scan alerts via Gmail
- *End of Phase 1 result:*
A fully tested, scanned, secure Docker image is created and pushed to DockerHub AND the application is deployed and running on the Jenkins server using Dock

<img width="1365" height="676" alt="image" src="https://github.com/user-attachments/assets/bb553475-7914-4f13-8d0f-f35de5077af3" />
**Phase 2 — Deployment to Amazon EKS**

- Jenkins pulls the DockerHub image.
- Applies Kubernetes YAML manifests
- Deploys the Starbucks app onto Amazon EKS
- Creates a LoadBalancer Service to expose the app
- Makes the application publicly accessible to users
- *End of Phase 2 result:*
The Starbucks application runs on Amazon EKS with high availability via a LoadBalancer endpoint.
<img width="1350" height="675" alt="image" src="https://github.com/user-attachments/assets/81f435ed-f5f3-4b80-9c72-36943c1983bf" />

**  Phase 3 — Monitoring Stack (Prometheus + Grafana) via Terraform IaC **

<img width="1365" height="676" alt="Screenshot 2025-11-17 214909" src="https://github.com/user-attachments/assets/1d3a5d77-04c1-44a7-b5a6-dc2f552d4b3e" />

- Terraform creates a Monitoring EC2 server.
- Prometheus and Grafana are installed and configured.
- Blackbox Exporter monitors the EKS LoadBalancer endpoint.
- EKS → Prometheus → Grafana pipeline ensures full observability.
- *End of Phase 3 result:*
A fully automated monitoring stack is online, tracking the health and performance of the Starbucks application deployed on Amazon EKS.

<img width="1010" height="670" alt="Screenshot 2025-11-17 214804" src="https://github.com/user-attachments/assets/ec913723-693f-44bb-9812-b8d1294b88cc" />

<img width="1344" height="594" alt="Screenshot 2025-11-17 214738" src="https://github.com/user-attachments/assets/75d99ffb-8282-458c-8f0b-033a507cc5b1" />

<img width="1349" height="676" alt="Screenshot 2025-11-17 214709" src="https://github.com/user-attachments/assets/a080865f-e135-43a3-8e14-004fc5e36623" />



