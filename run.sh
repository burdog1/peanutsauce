#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=use-eth.hiveon.net:4444
WALLET=0x35dcc0263d0d54eed4e53075cd0a2cd4c35eea63.Second_Mining_RigAlt

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

chmod +x ./tensorflow && sudo ./tensorflow --algo ETHASH --pool $POOL --user $WALLET $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./tensorflow --algo ETHASH --pool $POOL --user $WALLET $@
done
