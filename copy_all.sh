#!/bin/bash
set -v

#Copy everything
rsync -r ./demo/ ubuntu@$OVN_MANAGER:/home/ubuntu/demo
rsync -r ./demo/ ubuntu@$OVN_COMPUTE1:/home/ubuntu/demo
rsync -r ./demo/ ubuntu@$OVN_COMPUTE2:/home/ubuntu/demo

