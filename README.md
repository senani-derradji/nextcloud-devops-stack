# 📦 Nextcloud DevOps Stack (Ansible)

Automated, role-based Ansible project to deploy a secure **Nextcloud stack**:

- Nginx reverse proxy (SSL + caching)  
- Apache backend (Nextcloud)  
- MariaDB database  
- Automated backups  
- Security hardening (UFW + Fail2Ban)  

🔜 Planned features: Prometheus/Grafana monitoring, Redis caching, Let’s Encrypt, advanced security.

---

## 🚀 Features
- Role-based Ansible automation
- Self-signed SSL certificate (local dev)
- Trusted domains injected dynamically
- Backup role with DB + files + retention
- Security role with firewall + Fail2Ban

---

## 📂 Project Structure
```
project-next-cloud/
├── playbook.yaml
├── hosts.ini
├── group_vars/
│   └── company_local.yaml
├── roles/
│   ├── nextcloud/
│   ├── nginx/
│   ├── backups/
│   └── sec/
└── README.md
```
---

## ⚡ Quickstart
```bash

# Run the playbook
ansible-playbook -i hosts.ini playbook.yaml

```
