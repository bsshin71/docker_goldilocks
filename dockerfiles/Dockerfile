FROM centos:centos7
RUN yum update  -y && yum install -y net-tools which 

ENV GOLDILOCKS_HOME /goldilocks_home
ENV GOLDILOCKS_DATA /goldilocks_data



ENV PATH $PATH:$GOLDILOCKS_HOME/bin

ADD sundb_packages /sundb_packages
ADD scripts /scripts

RUN cd /sundb_packages && gzip -cd goldilocks*.tar.gz | tar xvf -  > /dev/null \
    && mv goldilocks-server-venus.*-linux-x86_64/goldilocks_home ..  \
    && mv goldilocks-server-venus.*-linux-x86_64/goldilocks_data .. 

RUN cp /sundb_packages/license $GOLDILOCKS_HOME/license/license

RUN  chmod +x /scripts/*


CMD ["/bin/bash","/scripts/CreateAndStart.sh"]
EXPOSE 22581
