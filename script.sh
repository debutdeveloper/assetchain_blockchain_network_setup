export CHANNEL_NAME=assetchain
export GOPATH=$HOME/go/src/

#create a channel

CORE_PEER_LOCALMSPID="debutMSP" \
CORE_PEER_TLS_ROOTCERT_FILE=$HOME/debutNetwork/crypto-config/peerOrganizations/debutinfotech.com/peers/peer0.debutinfotech.com/tls/server.crt \
CORE_PEER_MSPCONFIGPATH=$HOME/debutNetwork/crypto-config/peerOrganizations/debutinfotech.com/users/Admin@debutinfotech.com/msp \
CORE_PEER_ADDRESS=peer0.debutinfotech.com:7051 \
peer channel create -o secondorderer.debutinfotech.com:7050 -c $CHANNEL_NAME -f $HOME/debutNetwork/channel-artifacts/channel.tx

echo
echo ------------------------- assetchain CHANNEL CREATED------------------
echo

sleep 2

#Join Peer 0
CORE_PEER_LOCALMSPID="debutMSP" \
CORE_PEER_TLS_ROOTCERT_FILE=$HOME/debutNetwork/crypto-config/peerOrganizations/debutinfotech.com/peers/peer0.debutinfotech.com/tls/server.crt \
CORE_PEER_MSPCONFIGPATH=$HOME/debutNetwork/crypto-config/peerOrganizations/debutinfotech.com/users/Admin@debutinfotech.com/msp \
CORE_PEER_ADDRESS=peer0.debutinfotech.com:7051 \
peer channel join -b assetchain.block

echo
echo ------------------------- peer0 joined assetchain------------------
echo

sleep 2

#Join Peer 1
CORE_PEER_LOCALMSPID="debutMSP" \
CORE_PEER_TLS_ROOTCERT_FILE=$HOME/debutNetwork/crypto-config/peerOrganizations/debutinfotech.com/peers/peer1.debutinfotech.com/tls/server.crt \
CORE_PEER_MSPCONFIGPATH=$HOME/debutNetwork/crypto-config/peerOrganizations/debutinfotech.com/users/Admin@debutinfotech.com/msp \
CORE_PEER_ADDRESS=peer1.debutinfotech.com:7051 \
peer channel join -b assetchain.block

echo
echo ------------------------- peer1 joined assetchain------------------
echo

sleep 2

#Join Peer 2
CORE_PEER_LOCALMSPID="debutMSP" \
CORE_PEER_TLS_ROOTCERT_FILE=$HOME/debutNetwork/crypto-config/peerOrganizations/debutinfotech.com/peers/peer2.debutinfotech.com/tls/server.crt \
CORE_PEER_MSPCONFIGPATH=$HOME/debutNetwork/crypto-config/peerOrganizations/debutinfotech.com/users/Admin@debutinfotech.com/msp \
CORE_PEER_ADDRESS=peer2.debutinfotech.com:7051 \
peer channel join -b assetchain.block

echo
echo ------------------------- peer2 joined assetchain------------------
echo

sleep 2

#Update Anchor peer 0
CORE_PEER_LOCALMSPID="debutMSP" \
CORE_PEER_TLS_ROOTCERT_FILE=$HOME/debutNetwork/crypto-config/peerOrganizations/debutinfotech.com/peers/peer0.debutinfotech.com/tls/server.crt \
CORE_PEER_MSPCONFIGPATH=$HOME/debutNetwork/crypto-config/peerOrganizations/debutinfotech.com/users/Admin@debutinfotech.com/msp \
CORE_PEER_ADDRESS=peer0.debutinfotech.com:7051 \
peer channel update -o secondorderer.debutinfotech.com:7050 -c assetchain -f ./channel-artifacts/debutMSPanchors.tx

echo
echo ------------------------- peer0 updated as anchor peer on assetchain------------------
echo

sleep 2

#Install Chaincode peer0
CORE_PEER_LOCALMSPID="debutMSP" \
CORE_PEER_TLS_ROOTCERT_FILE=$HOME/debutNetwork/crypto-config/peerOrganizations/debutinfotech.com/peers/peer0.debutinfotech.com/tls/server.crt \
CORE_PEER_MSPCONFIGPATH=$HOME/debutNetwork/crypto-config/peerOrganizations/debutinfotech.com/users/Admin@debutinfotech.com/msp \
CORE_PEER_ADDRESS=peer0.debutinfotech.com:7051 \
peer chaincode install -n assetchaincode -v 1.0 -p github.com/debut_asset_chaincode/

echo
echo ------------------------- Installed chaincode on peer0------------------
echo

sleep 2

#Install Chaincode peer1
CORE_PEER_LOCALMSPID="debutMSP" \
CORE_PEER_TLS_ROOTCERT_FILE=$HOME/debutNetwork/crypto-config/peerOrganizations/debutinfotech.com/peers/peer1.debutinfotech.com/tls/server.crt \
CORE_PEER_MSPCONFIGPATH=$HOME/debutNetwork/crypto-config/peerOrganizations/debutinfotech.com/users/Admin@debutinfotech.com/msp \
CORE_PEER_ADDRESS=peer1.debutinfotech.com:7051 \
peer chaincode install -n assetchaincode -v 1.0 -p github.com/debut_asset_chaincode/

echo
echo ------------------------- Installed chaincode on peer1------------------
echo

sleep 2

#Install Chaincode peer2
CORE_PEER_LOCALMSPID="debutMSP" \
CORE_PEER_TLS_ROOTCERT_FILE=$HOME/debutNetwork/crypto-config/peerOrganizations/debutinfotech.com/peers/peer2.debutinfotech.com/tls/server.crt \
CORE_PEER_MSPCONFIGPATH=$HOME/debutNetwork/crypto-config/peerOrganizations/debutinfotech.com/users/Admin@debutinfotech.com/msp \
CORE_PEER_ADDRESS=peer2.debutinfotech.com:7051 \
peer chaincode install -n assetchaincode -v 1.0 -p github.com/debut_asset_chaincode/

echo
echo ------------------------- Installed chaincode on peer2------------------
echo

sleep 2

#Install Chaincode peer0
CORE_PEER_LOCALMSPID="debutMSP" \
CORE_PEER_TLS_ROOTCERT_FILE=$HOME/debutNetwork/crypto-config/peerOrganizations/debutinfotech.com/peers/peer0.debutinfotech.com/tls/server.crt \
CORE_PEER_MSPCONFIGPATH=$HOME/debutNetwork/crypto-config/peerOrganizations/debutinfotech.com/users/Admin@debutinfotech.com/msp \
CORE_PEER_ADDRESS=peer0.debutinfotech.com:7051 \
peer chaincode instantiate -o secondorderer.debutinfotech.com:7050 -C assetchain -n assetchaincode -v 1.0 -c '{"Args":[""]}' -P "AND ('debutMSP.peer')"

echo
echo ------------------------- Instantiated chaincode on peer0------------------
echo