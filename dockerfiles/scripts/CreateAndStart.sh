GOLDILOCKS_FULL_MEMBER_NAME=${GOLDILOCKS_CLUSTER_GROUP}${GOLDILOCKS_MEMBER_NAME}

gcreatedb --cluster --member=${GOLDILOCKS_FULL_MEMBER_NAME}\
          --host=${GOLDILOCKS_CLUSTER_IP}\
       	  --port=${GOLDILOCKS_CLUSTER_PORT}

gsql sys gliese --as sysdba << EOF
startup ;
ALTER SYSTEM OPEN GLOBAL DATABASE ;
COMMIT;
quit;
EOF

glsnr --start 

tail -f $GOLDILOCKS_DATA/trc/system.trc

