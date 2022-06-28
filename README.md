- ## Setup Docker on Amazon Linux EC2
- ## Setup Docker Compose on Amazon Linux EC2
- ## Run Jenkins using Git and docker-compose.yml
---
### Docker CE Install:
```
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user
```
**Make docker auto-start**
```
sudo chkconfig docker on
```
**Install Git client**
```
sudo yum install -y git
```
**Fix permissions for Docker**
```
sudo chmod ugo+rw /var/run/docker.sock
```
---
### Docker-Compose Install:
Copy the latest version of [docker-compose](https://github.com/docker/compose/releases/) binary from GitHub:
```
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
```
**Fix permissions after download**
```
sudo chmod +x /usr/local/bin/docker-compose
```
**Verify Docker and Docker-Compose versions**
```
docker version
docker-compose version
```
---
## Clone this git repository:!!!!!!!
```
git clone https://github.com/agburov/ansible-mysql.git
```
**Run docker-compose container**
```
docker-compose up -d
```
**Get Jenkins administrator pass from file**
```
docker exec jenkins-lts cat /var/jenkins_home/secrets/initialAdminPassword
```
***or from logs***
```
docker logs jenkins-lts

```
**Start Jenkins**\
open the URL using EC2_IPv4_Public_IP along with port 8080 ```<EC2_IPv4_Public_IP>:8080```

**Use Jenkins's password**\
Paste Jenkins administrator password from above step to unlock Jenkins

---
## Useful Docker cleanup commands:
docker rm -f `docker ps -aq` \
docker volume prune -f \
docker network prune -f

## Useful links:
* [Snippet generator](https://www.jenkins.io/doc/book/pipeline/getting-started/#snippet-generator)
* Глобальные переменные – ```<YOUR_JENKINS_URL>/pipeline-syntax/globals```
* Declarative Directive Generator – ```<YOUR_JENKINS_URL>/directive-generator```
