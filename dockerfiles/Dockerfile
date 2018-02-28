FROM centos:centos7
RUN yum update  -y && yum install -y net-tools which 

ENV GOLDILOCKS_HOME /goldilocks_home
ENV GOLDILOCKS_DATA /goldilocks_data



ENV PATH $PATH:$GOLDILOCKS_HOME/bin

ADD goldilocks_package /goldilocks_package
ADD scripts /scripts

RUN cd /goldilocks_package && gzip -cd goldilocks*.tar.gz | tar xvf -  > /dev/null \
    && mv goldilocks-*/goldilocks_home ..  \
    && mv goldilocks-*/goldilocks_data .. 

RUN cp /goldilocks_package/license $GOLDILOCKS_HOME/license/license

RUN  chmod +x /scripts/*


CMD ["/bin/bash","/scripts/CreateAndStart.sh"]
EXPOSE 22581
