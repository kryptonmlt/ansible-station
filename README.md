# Ansible Station
This repo is mostly dedicated to peoply who want to run ansible easily on Windows. Docker is used so that ansible is not needed to be installed on the OS.

## Build image
* docker build -t ansible-station .

## Run the image
* The image needs 3 paths to work as expected
	* The volume that will contain your ansible playbooks (ansible-station\code)
	* The volume that contains your ssh key in RSA format (ansible-station\conf\ssh)
	* The volume that contains your ansible inventory (ansible-station\conf\inventory)
* Put in your id_rsa key in the ansible-station\conf\ssh
* Next step is to run a script found inside the running container to fix any permission issue in the .ssh folder. This was essential to go around the following docker issue when building on windows: SECURITY WARNING: You are building a Docker image from Windows against a non-Windows Docker host. All files and directories added to build context will have '-rwxr-xr-x' permissions. It is recommended to double check and reset permissions for sensitive files and directories.
* Commands:
	1. docker run -d --name ansible-station -v PATH\TO\ansible-station\code:/root/code/ -v PATH\TO\ansible-station\conf\ssh:/root/ssh-host/ -v PATH\TO\ansible-station\conf\inventory:/etc/ansible/hosts ansible-station
	2. docker exec ansible-station sh /root/prepare-key

## Login to the running container
* docker exec -it ansible-station /bin/bash
* Now you should be able to run your ansible code example;
	* ansible all -m ping
	* ansible-playbook code/specs.yml

## Windows Helper files
* build-ansible-station.bat
* run-ansible-station.bat (Put in correct absolute paths first!)
* login-to-container.bat

## Requirements
* Only this has to be installed [Docker Desktop](https://www.docker.com/products/docker-desktop)