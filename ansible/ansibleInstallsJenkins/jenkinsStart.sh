#!/bin/bash
sudo systemctl enable jenkins
sudo systemctl start jenkins
# sudo systemctl status jenkins
echo "Enter the below initialAdminPassword if asked: "
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
firefox "http://localhost:8080"
