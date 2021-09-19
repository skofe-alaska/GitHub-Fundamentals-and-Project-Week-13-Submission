# GitHub-Fundamentals-and-Project-Week-13-Submission
GitHub Fundamentals and Project Week 13 Submission
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![TODO: Update the path with the name of your diagram](Images/diagram_filename.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Yaml file may be used to install only certain pieces of it, such as Filebeat.

- [filebeat/filebeat-playbook.yml](Ansible/Roles/Install-filebeat/filebeat-playbook.yml)
- [metricbeat/metricbeat-playbook.yml](Ansible/Roles/Install-metricbeat/metricbeat-playbook.yml)


This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
- _TODO: What aspect of security do load balancers protect? What is the advantage of a jump box?_

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the _____ and system _____.
- What does Filebeat watch for?
  - Filebeat watches for changes to files and when they occured by looking at log files.
- What does Metricbeat record?  
  - Metricbeat records metrics from the Operating System and Services running on the server.

The configuration details of each machine may be found below.

| Name     |          Function               | IP Address |  Operating System  |
|----------|---------------------------------|------------|--------------------|
| Jump Box | Gateway & runs docker w/Ansible | 10.0.0.4   |Linux (Ubuntu 18.04)|
| Web-1    | Web Server                      | 10.0.0.5   |Linux (Ubuntu 18.04)|
| Web-2    | Web Server                      | 10.0.0.6   |Linux (Ubuntu 18.04)|
| Web-3    | Web Server                      | 10.0.0.7   |Linux (Ubuntu 18.04)|
|ELKStack  | Server (ELK Container & Kibana) | 10.1.0.5   |Linux (Ubuntu 18.04)|

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine has been configured to only be allowed from my Home Network Public IP address.

Machines within the network can only be accessed by the Jump-Box-Provisioner VM.
- Which machine did you allow to access your ELK VM?
  - Jump-Box-Provisioner VM
- What was its IP address?
  - Jump-Box-Provisioner VM Public IP address is 104.42.168.123 and Private IP address is 10.0.0.4

A summary of the access policies in place can be found in the table below.

|     Name     | Publicly Accessible | Allowed IP Addresses |
|--------------|---------------------|----------------------|
| Jump Box     | Yes                 |Home Network Public IP|
| Web-1        | No                  | 10.0.0.5             |
| Web-2        | No                  | 10.0.0.6             |
| Web-3        | No		               | 10.0.0.7             |
| ELKStack     | Yes (Port 5601)     |Home Network Public IP|
|Load Balancer | Yes (Port 80)       |Home Network Public IP|

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with Ansible?_

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- ...
- ...

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![Screen shot of running sucessful playbook](Images/Screenshot%20running%20playbook.png)

![Screen shot of metricbeat date being uploaded to Kabana](Images/Screenshot%20metricbeatdatarecieved.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 10.0.0.5
- Web-2 10.0.0.6
- Web-3 10.0.0.7

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat-config.yml file to /etc/ansible/roles/install-filebeat/files/filebeat-config.yml
- Update the filebeat-config.yml file to include host "10.1.0.5:9200" with username "elastic" and password "changeme" and setup.Kibana host to "10.1.0.5:5601" (this needs to be the IP address of your ELk server).
- Run the playbook, and navigate to Kibana (Elk GUI interface) and click "Check Data" to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- Which file is the playbook? 
  - filebeat-playbook.yml
- Where do you copy it? 
  - /etc/ansible/roles/install-filebeat/tasks/filebeat-playbook.yml
- Which file do you update to make Ansible run the playbook on a specific machine?
  - [Ancible/hosts.cfg](Ansible/hosts.cfg)
 
- How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
  - [filebeat-config.yml](Ansible/Roles/Install-filebeat/filebeat-config.yml)
  
- Which URL do you navigate to in order to check that the ELK server is running? 
  - http://137.135.105.157:5601/app/kibana

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._

### Provided example will be for a metricbeat playbook.


Create a Metricbeat Configuration:
- Create a file: nano metircbeat-config.yml
  - Check line 62 and update to the IP address of your ELk Server and Port number (example 10.1.0.5:5601)
  - Check line 96 and update to the IP address of your ELK Server and Port number (exampel 10.1.0.5:9200)

  - You can copy the provided file from the raw for a template.
  - [metricbeat/config.yml](Ansible/Roles/Install-metricbeat/metricbeat-config.yml)

Create a playbook:
- Create a file: Nano metricbeat-playbook.yml

  - You can copy the provided file from the raw for a template.
  - [metricbeat/main.yml](Ansible/Roles/Install-metricbeat/metricbeat-playbook.yml)

To run your playbook:
- `ansible-playbook metricbeat-playbook.yml`

### Trouble Shooting and Common Problems
I had problems with metricbeat, after running metric beat it would show everything had passed and updated, however I was not getting data in Kabana.

-To correct this issue:
  - Added Web-3 as an additional VM
  - updated the playbooks in the following files:
  - /etc/ansible/roles/install-dvwa/task/main.yml
  - /etc/ansible/roles/install-filebeat/tasks/main.yml
  - /etc/ansible/roles/install-metricbeat/tasks/main.yml
  
 Samples of the three files are provided and may be copied in the raw for a template:
   
 - [Install-dvwa/main.yml](Ansible/Roles/install-dvwa/main.yml)
 - [Install-filebeat/mail.yml](Ansible/Roles/Install-filebeat/main.yml)
 - [Install-metricbeat/main.yml](Ansible/Roles/Install-metricbeat/main.yml)
 - [webservers.yml](Ansible/webservers.yml)
 
The new files were run to update Web-1, Web-2, and Web-3.  Once completed I was able to see that data was being recieved in Kabana from Web-3.  Web-1 and Web-2 still were not recieving data.

This was corrected by:
 - In Microsoft Azure deleated both Web-1 and Web-2
 - In Mirososft Azure rebuilt both Web-1 and Web-2
 - Ran the playbook again 

 
To run your playbook:
- `ansible-playbook webservers.yml`
