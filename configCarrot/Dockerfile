# syntax=docker/dockerfile:1.3
# previous command for builder buildkit compatibility, I guess. https://docs.docker.com/engine/reference/builder/
#For the manual installation on which that dockerfile is based go to :https://docs.ip-tools.org/patent2net/index.html
# Run the ubuntu image of docker
FROM centos:8

RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum makecache --refresh
RUN yum -y update 

RUN yum -y update; yum clean all
RUN yum install -y epel-release \
    && yum clean all
RUN yum -y install pkg-config

RUN yum install -y sudo \
    wget \
	unzip \
    && yum clean all
# 4 carrot2 
RUN yum -y install java-11-openjdk.x86_64

RUN useradd --uid 1000 p2n
RUN yum install -y passwd

RUN passwd -f -d p2n
ADD carrot2.sh /home/p2n/
RUN chmod 755 /home/p2n/carrot2.sh
RUN chown p2n /home/p2n/carrot2.sh
USER p2n
WORKDIR /home/p2n
RUN cd /home/p2n


# carrot DL and install

#RUN cd /home/p2n/P2N-V3/

RUN /home/p2n/carrot2.sh

# Hack Carrot2 size limit in clustering ES data
COPY main.4974e0c5.chunk.js /home/p2n/carrot2/carrot2-4.2.1/dcs/web/frontend/static/js
#RUN /home/p2n/carrot2/carrot2-4.2.1/dcs/dcs.sh --port 8080 &

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
RUN export LC_ALL=C.UTF-8  && export LANG=C.UTF-8
EXPOSE 8080
CMD ["bash"]
