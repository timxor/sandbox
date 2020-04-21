#! /usr/bin

# ------------------------------------------------------------------
#  kubectl
# ------------------------------------------------------------------

# download
brew install kubectl 

# confirm kubectl installation
#
# location:  /usr/local/Cellar/kubernetes-cli/1.18.2
which kubectl
kubectl version --client
sysctl -a | grep -E --color 'machdep.cpu.features|VMX'


# ------------------------------------------------------------------
#  virtualbox
# ------------------------------------------------------------------

# install virtual box
brew cask install virtualbox

# confirm installation
which virtualbox
virtualbox



# ------------------------------------------------------------------------------------------------
#  minikube
# ------------------------------------------------------------------------------------------------
# https://kubernetes.io/docs/setup/learning-environment/minikube/#specifying-the-vm-driver 
# ------------------------------------------------------------------------------------------------

# install minikube
brew install minikube
which minikube


# install minikube drivers
#     Hyperkit - VM (preferred) 
#          see: https://minikube.sigs.k8s.io/docs/drivers/
brew install hyperkit
which minikube

minikube config set driver hyperkit
minikube start --driver=hyperkit
# or minikube start

# delete minikube

# virtualbox setup
##     make virtualbox the default driver 
#      minikube config set driver virtualbox
##     start a cluster using the virtualbox driver
#      minikube start --driver=virtualbox


# ------------------------------------------------------------------
#   minikube can be deployed as a VM, a container or bare-metal
# ------------------------------------------------------------------


# query the existing image called echoserver
kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.10


# setup access the hello-minikube via an exposed service
kubectl expose deployment hello-minikube --type=NodePort --port=8080


# see if the pod is up and running
kubectl get pod

# get the URL of the exposed service
minikube service hello-minikube --url
open -a Safari http://192.168.64.2:31818

# delete the service
kubectl delete services hello-minikube
kubectl delete deployment hello-minikube
minikube stop
minikube delete


# ------------------------------------------------------------------
#  docker
# ------------------------------------------------------------------

# install
brew cask install docker
brew install docker
brew install docker-
brew install docker-machine

docker ps
env | grep DOCKER

kubectl config get-contexts
kubectl config use-context docker-desktop
docker --version
docker-compose --version
docker-machine --version


docker-machine create --driver virtualbox default
docker-machine create -d virtualbox toolbox

docker ps
docker-machine restart
eval $(docker-machine env default)


# open docker app up on mac
docker run hello-world
docker run -d -p 80:80 --name webserver nginx
docker run -it ubuntu bash


docker image ls 
docker ps --all


















#
#      nginx
#
# Docroot is: /usr/local/var/www
# 
# The default port has been set in /usr/local/etc/nginx/nginx.conf to 8080 so that
# nginx can run without sudo.
# 
# nginx will load all files in /usr/local/etc/nginx/servers/.
# 
# To have launchd start nginx now and restart at login:
#   brew services start nginx
# Or, if you don't want/need a background service you can just run:
#   nginx
# ==> Summary
# 🍺  /usr/local/Cellar/nginx/1.17.10: 25 files, 2.1MB











