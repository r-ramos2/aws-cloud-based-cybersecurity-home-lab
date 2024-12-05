# Cloud-Based Cybersecurity Home Lab

## Table of Contents

1. [Introduction](#introduction)  
2. [Lab Architecture Overview](#lab-architecture-overview)  
3. [Prerequisites](#prerequisites)  
4. [Step 1: Setting Up the Environment](#step-1-setting-up-the-environment)  
   1.1 [AWS Account Configuration](#11-aws-account-configuration)  
   1.2 [Provisioning Infrastructure with Terraform](#12-provisioning-infrastructure-with-terraform)  
5. [Step 2: Configuring the Instances](#step-2-configuring-the-instances)  
   2.1 [Kali Linux Setup](#21-kali-linux-setup)  
   2.2 [Windows 10 Workstation Setup](#22-windows-10-workstation-setup)  
   2.3 [Security Tools Box (Ubuntu) Setup](#23-security-tools-box-ubuntu-setup)  
6. [Step 3: Installing and Configuring Tools](#step-3-installing-and-configuring-tools)  
   3.1 [Splunk Enterprise](#31-splunk-enterprise)  
   3.2 [Universal Forwarder for Windows Logs](#32-universal-forwarder-for-windows-logs)  
   3.3 [Tenable Nessus Essentials](#33-tenable-nessus-essentials)  
7. [Best Practices and Security Measures](#best-practices-and-security-measures)  
8. [Potential Enhancements and Next Steps](#potential-enhancements-and-next-steps)  
9. [Conclusion](#conclusion)  
10. [Resources](#resources)  
11. [Terraform Code and Variables](#terraform-code-and-variables)

---

## Introduction

This guide takes you step-by-step through setting up a cloud-based cybersecurity home lab using AWS. The lab incorporates a **Kali Linux** instance for penetration testing, a **Windows 10** workstation as a target system, and an **Ubuntu-based Security Tools Box** to run essential monitoring tools. This project demonstrates proficiency in cloud security, infrastructure-as-code (IaC), and security tool integration. It’s a valuable addition to your portfolio, showcasing hands-on expertise in deploying and securing cloud infrastructure.

---

## Lab Architecture Overview

### Components:
- **Kali Linux**: For penetration testing, vulnerability scanning, and exploiting weaknesses in target systems.
- **Windows 10 Workstation**: The simulated target machine for exploiting and testing attacks.
- **Security Tools Box (Ubuntu)**: Hosts security tools such as **Splunk** for log management and **Tenable Nessus** for vulnerability scanning.

### Network Architecture:
- **VPC**: A dedicated isolated network for all resources.
- **Subnets**: Public subnet for externally accessible instances and a private subnet for internal communication.
- **Security Groups**: Fine-grained controls with access rules for SSH, RDP, and HTTP/S protocols.

---

## Prerequisites

Before starting this project, ensure you have:

- An **AWS Account** with IAM user credentials and necessary permissions.
- **Terraform** installed on your local machine.
- **SSH Client** (e.g., OpenSSH or PuTTY) for remote connections.
- **RDP Client** (e.g., Windows Remote Desktop Connection) to access Windows instances.

---

## Step 1: Setting Up the Environment

### 1.1 AWS Account Configuration

1. Create a **dedicated IAM User** with programmatic access and the necessary EC2, VPC, IAM, and S3 permissions.
2. Configure the **AWS CLI** with the IAM user credentials.

### 1.2 Provisioning Infrastructure with Terraform

1. Clone the repository from GitHub to your local machine.
2. Modify the `variables.tf` file with your specific AWS settings (e.g., region, SSH key pair).
3. Run the following commands to initialize, review, and apply the Terraform configuration:
    ```bash
    terraform init
    terraform plan
    terraform apply
    ```

---

## Step 2: Configuring the Instances

### 2.1 Kali Linux Setup

1. SSH into the Kali Linux instance using the private key:
    ```bash
    ssh -i your-key.pem ubuntu@<Kali-IP>
    ```
2. Update and install essential tools:
    ```bash
    sudo apt update && sudo apt upgrade -y
    sudo apt install -y xrdp firefox
    sudo systemctl enable --now xrdp
    ```
3. Create an RDP user and set a password:
    ```bash
    sudo adduser rdpuser
    sudo usermod -aG sudo rdpuser
    ```

### 2.2 Windows 10 Workstation Setup

1. Use the private key to decrypt the Windows admin password.
2. Connect to the Windows instance via RDP using the public IP address.
3. Temporarily disable the Windows firewall for initial setup:
    - Open **Windows Defender Firewall** and turn it off for testing purposes.

### 2.3 Security Tools Box (Ubuntu) Setup

1. SSH into the Security Tools instance:
    ```bash
    ssh -i your-key.pem ubuntu@<Security-Tools-IP>
    ```
2. Update the system:
    ```bash
    sudo apt update && sudo apt upgrade -y
    ```

---

## Step 3: Installing and Configuring Tools

### 3.1 Splunk Enterprise

1. Download and install Splunk:
    ```bash
    wget -O splunk.deb https://download.splunk.com/releases/9.1.0/splunk.deb
    sudo dpkg -i splunk.deb
    sudo /opt/splunk/bin/splunk start
    ```
2. Enable log receiving:
    - Navigate to **Settings > Forwarding and Receiving** and enable port **9997** for data forwarding.

### 3.2 Universal Forwarder for Windows Logs

1. Download and install the **Splunk Universal Forwarder** on the Windows 10 instance.
2. Configure the forwarder to send logs to the Splunk instance.

### 3.3 Tenable Nessus Essentials

1. Download and install Nessus Essentials:
    ```bash
    wget -O nessus.deb https://www.tenable.com/downloads/nessus
    sudo dpkg -i nessus.deb
    sudo systemctl start nessusd
    ```
2. Complete the Nessus setup through the web interface.

---

## Best Practices and Security Measures

- **Least Privilege**: Use IAM roles with the minimum necessary permissions.
- **Security Groups**: Use restrictive rules for SSH, RDP, and HTTP access. Limit to specific IP ranges.
- **Key and Password Management**: Rotate SSH keys regularly, use strong passwords, and securely manage credentials.
- **Logging and Monitoring**: Enable **AWS CloudWatch** and **CloudTrail** for continuous monitoring of your AWS environment.

---

## Potential Enhancements and Next Steps

- **Automation with Ansible**: Automate system configuration and tool deployment using **Ansible**.
- **Intrusion Detection Systems**: Integrate **Snort** or **Suricata** to monitor network traffic for potential intrusions.
- **Containerization**: Extend the lab with **Docker** or **Kubernetes** for simulating containerized environments and advanced attack scenarios.

---

## Conclusion

This cloud-based cybersecurity home lab project provides a comprehensive, hands-on approach to cloud security, demonstrating skills in deploying and configuring security tools, setting up infrastructure, and following security best practices. It’s an ideal showcase for your cloud security capabilities, making it an excellent addition to your portfolio.

---

## Resources

- **AWS Documentation**: [AWS VPC](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html), [AWS EC2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html)
- **Terraform Documentation**: [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- **Splunk Setup Guide**: [Splunk Installation](https://www.splunk.com/en_us/download.html)
- **Tenable Nessus Guide**: [Tenable Nessus Setup](https://www.tenable.com/products/nessus)
