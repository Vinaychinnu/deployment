# Puzzle Game Deployment (CI/CD with Jenkins, Docker, Ansible)

This project demonstrates a **CI/CD pipeline** that deploys a static puzzle game using:
- **Ansible** → Installs Jenkins & dependencies on your server
- **Jenkins** → Automates building and running the game inside Docker
- **Docker** → Packages and serves the game
- **GitHub** → Stores the source code and pipeline configuration

---

## 📂 Project Structure

├── Dockerfile # Builds Apache HTTPD container with puzzle game
├── index.html # Puzzle game HTML file
├── Jenkinsfile # Jenkins pipeline definition
├── ansible/
│ ├── inventory.ini # Ansible inventory file
│ └── jenkins-setup.yaml # Playbook to install & start Jenkins
└── README.md


