# docker_goldilocks

This Repository has docker-releated files and shell scripts those help running Goldilocks Cluster on docker.

## Quick Start 

* Clone this Repository

```sh
$ git clone https://github.com/ckh0618/docker_goldilocks
$ cd docker_goldilocks 
```

* Put a Goldilocks cluster package and license file into dockerfiles/goldilocks_packages. You can get goldilocks package and license by email ( technet@sunjesoft.com)

```sh
$ cp goldilocks-server-venus.3.1.9-linux-x86_64.tar.gz  dockerfiles/goldilocks_packages
$ cp license dockerfiles/goldilocks_packages
``` 

* Build image and up 

```sh 
$ docker-compose build 
$ docker-compose up 
```

* Create Cluster 

```sh
$ docker exec -it g1n1_1 /bin/bash 
$ gsql sys gliese --as sysdba <<EOF

CREATE CLUSTER GROUP G1 CLUSTER MEMBER G1N1 HOST '172.18.18.17' PORT 10101; 
ALTER  CLUSTER GROUP G1 CLUSTER MEMBER G1N2 HOST '172.18.18.18' PORT 10101; 
CREATE CLUSTER GROUP G2 CLUSTER MEMBER G2N1 HOST '172.18.18.19' PORT 10101; 
ALTER  CLUSTER GROUP G2 CLUSTER MEMBER G2N2 HOST '172.18.18.20' PORT 10101; 
CREATE CLUSTER GROUP G3 CLUSTER MEMBER G3N1 HOST '172.18.18.21' PORT 10101; 
ALTER  CLUSTER GROUP G3 CLUSTER MEMBER G3N2 HOST '172.18.18.22' PORT 10101; 
CREATE CLUSTER GROUP G4 CLUSTER MEMBER G4N1 HOST '172.18.18.23' PORT 10101; 
ALTER  CLUSTER GROUP G4 CLUSTER MEMBER G4N2 HOST '172.18.18.24' PORT 10101; 
quit;
EOF 

```

Now you have 4X2 Goldilocks Cluster system. 
