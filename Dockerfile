FROM debian:bullseye

WORKDIR /docker
ADD ./packages.txt /docker/packages.txt
RUN apt update

#egrep -v      means leave the following out
#^#.*          means patterns that begin with a #
#|             means or
#^$            means patterns that are empty

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    $(cat /docker/packages.txt | egrep -v "(^#.*|^$)" | tr '\n' ' ')
