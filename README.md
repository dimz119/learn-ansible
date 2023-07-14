
## installation
```
# create virtual environment
virtualenv venv

# activate the virtual environment
source venv/bin/activate

# install Ansible
pip install ansible
``` 

## Build Docker image
```
# build an image
docker build -t sshd_ubuntu .

docker run -d -p 55000:22 sshd_ubuntu
docker run -d -p 55001:22 sshd_ubuntu

docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' sshd_ubuntu1
```

