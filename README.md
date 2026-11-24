# Deploying a Fault-Tolerant Visitor Counter (Flask + Redis) on Kubernetes with Self-Healing, Zero-Downtime Rolling Updates and Hybrid Failover

**Submitted by:** Aman Kumar Singh  
**Roll Number:** 2410030293  
**Programme:** B.Tech Computer Science and Engineering (Artificial Intelligence & Machine Learning)  
**University:** IILM University, Greater Noida  
**GitHub Repository:** https://github.com/aman8340-coder/Visitor-Counter-Cloud-Computing

## Overview
This project implements a containerized visitor counter web application using **Python Flask** and **Gunicorn** backed by **Redis** for atomic counter state (`INCR visits`), orchestrated on local **Kind** Kubernetes clusters with **Liveness (`/health`)** and **Readiness (`/ready`)** probes, **Self-Healing**, **Horizontal Pod Autoscaling (HPA)**, **Rolling Updates**, and an **Nginx Primary/Backup Hybrid Failover Gateway**.

## Repository Structure
- `app/` — Flask application (`app.py`, `requirements.txt`, `templates/index.html`, `static/style.css`)
- `Dockerfile` & `Dockerfile.before` — Multi-stage non-root Alpine image vs baseline image
- `docker-compose.yml` — Local multi-container stack (`localhost:5000`)
- `k8s/` & `k8s/before/` — Kubernetes Deployments, Services, HPA, and baseline manifests
- `kind/` & `kind-config.yaml` — Kind cluster definitions (`private` on `8081`, `public` on `8082`)
- `hybrid/nginx.conf` — Nginx primary/backup gateway (`localhost:8080`)
- `scripts/` & `tools/` — Failover demo, measurement script, cost calculator, and busybox load generator
- `metrics-server.yaml` & `metrics-patch.json` — Metrics server configuration for HPA
- `docs/generate_architecture.py` — Architecture diagram generator script
- `Screenshots/` — Verification, deployment, scaling, and benchmark screenshots
