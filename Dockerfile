FROM ubuntu:18.04
WORKDIR /root
RUN apt-get update && apt-get upgrade -y && apt-get install software-properties-common vim -y && apt-add-repository ppa:ansible/ansible && apt-get update && apt-get install ansible -y && apt-get install python -y
COPY conf/prepare-key /root/prepare-key
RUN chmod +x /root/prepare-key
CMD echo "Started Ansible Station container" > /var/log/ansible-station.log && tail -f /var/log/ansible-station.log