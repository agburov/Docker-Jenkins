- ### Setup Docker on Amazon Linux EC2
- ### Setup Docker Compose on Amazon Linux EC2
- ### Clone required files from Git
- ### Run Jenkins in browser
---
### Docker CE Install:
```
sudo amazon-linux-extras install docker
```
```
sudo service docker start
```
```
sudo usermod -a -G docker ec2-user
```
**Make Docker auto-start**
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
**Verify Docker version**
```
docker version
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
**Verify Docker-Compose version**
```
docker-compose version
```
---
## Clone this Git repository:
```
git clone https://github.com/agburov/Docker-Jenkins.git
```
**Open project folder**
```
cd Docker-Jenkins
```
**Fix permissions after download**
```
chmod +x jenkins-start.sh
```
**Add network for containers**
```
docker network create jenkins
```
**Run Docker-Compose container**
```
docker-compose up -d
```
**Build a new docker image from the Dockerfile**
```
docker build -t myjenkins-blueocean:2.346.1-1 .
```
---
## Start Jenkins:
```
sh jenkins-start.sh
```

**Open the URL using EC2_IPv4_Public_IP along with port 8080**

> Use your EC2 public IP address, like \<EC2_IPv4_Public_IP>:8080


**Get Jenkins administrator pass from file**
```
docker exec jenkins-blueocean cat /var/jenkins_home/secrets/initialAdminPassword
```
*or from logs*
```
docker logs jenkins-blueocean  -f

```

**Use Jenkins's password**
> Paste the Jenkins admin password above to unlock Jenkins

---
## Useful Docker cleanup commands:
docker rm -f \
docker ps -aq \
docker volume prune -f \
docker network prune -f

## Useful links:
* [Snippet generator](https://www.jenkins.io/doc/book/pipeline/getting-started/#snippet-generator)
* Глобальные переменные – ```<YOUR_JENKINS_URL>/pipeline-syntax/globals```
* Declarative Directive Generator – ```<YOUR_JENKINS_URL>/directive-generator```
