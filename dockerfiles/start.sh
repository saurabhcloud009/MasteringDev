#!/bin/bash
#runall.sh
# Create Directotriies
mkdir -p $HOME/data/jenkins
#Download Apache-Maven
wget  http://www-us.apache.org/dist/maven/maven-3/3.5.3/binaries/apache-maven-3.5.3-bin.zip -P $HOME/data/jenkins
#Unzip in directory
unzip  $HOME/data/jenkins/apache-maven-3.5.3-bin.zip -d  $HOME/data/jenkins/
#Permission to write in the folder
chmod -R 777 $HOME/data

docker-compose up -d

docker ps -a --filter=status=running  --format "{{.Names}}: {{.Ports}}"

ipconfig getifaddr en0;docker ps -a --filter=status=running  --format "{{.Names}}: {{.Ports}}"

sleep 5m # Waits 5 minutes.

echo "NOTE: Please allow a couple of minutes for the  application to start."