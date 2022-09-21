FROM debian:bullseye

WORKDIR /docker
ADD ./packages.txt /docker/packages.txt
RUN apt update

# Remove newlines and lines that start with a hash (comments)
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    $(cat /docker/packages.txt | egrep -v "(^#.*|^$)" | tr '\n' ' ')
