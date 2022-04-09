#!/bin/bash
# Author: Pradeep Singh Makwana (pradeepsinghmakwana@gmail.com)
# force stop and delete any containers

IMAGE_NAME="" # Similar to Amazon AMI, original image name
CONTAINER_NAME="" # name of the container, REPOSITORY NAME

while getopts "i:c:p:" option; do
  case $option in
    i ) IMAGE_NAME=$OPTARG
    # echo "ARG_TOKEN: $ARG_TOKEN"
    ;;
    c ) CONTAINER_NAME=$OPTARG
    ;;
    p ) HOST_PORT=$OPTARG
    ;;
  esac
done

REMOTE_PORT=80
if [ -z "$HOST_PORT" ]; then
  HOST_PORT=80
fi

sudo service jenkins stop
sudo service apache2 stop
docker rm -f $(docker ps -aq)

if [ -z "$IMAGE_NAME" ]; then
  IMAGE_NAME="php:7.2-apache" # Similar to Amazon AMI, original image name
fi
if [ -z "$CONTAINER_NAME" ]; then
  CONTAINER_NAME="my-apache-php-app" # name of the container, REPOSITORY NAME
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )


sudo rm /var/www/html/index.html

echo "Removing any already existing image with the same name"
docker image rm $CONTAINER_NAME

# TAG the image with CONTAINER_NAME for identification
docker build -t $CONTAINER_NAME - < Dockerfile

docker run -d -p $REMOTE_PORT:$HOST_PORT --name $CONTAINER_NAME -v "$SCRIPT_DIR":/var/www/html $IMAGE_NAME
(firefox "http://localhost:$HOST_PORT/")