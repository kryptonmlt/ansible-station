docker stop ansible-station
docker rm ansible-station
docker run -d --name ansible-station -v C:\PATH\TO\ansible-station\code:/root/code/ -v C:\PATH\TO\ansible-station\conf\ssh:/root/ssh-host/ -v C:\PATH\TO\ansible-station\conf\inventory:/etc/ansible/hosts ansible-station
docker exec ansible-station sh /root/prepare-key