
CORE_PEER_ENDORSER_ENABLED=true \
CORE_PEER_PROFILE_ENABLED=true \
CORE_PEER_ADDRESS=peer0.debutinfotech.com:7051 \
CORE_PEER_CHAINCODELISTENADDRESS=peer0.debutinfotech.com:7052 \
CORE_PEER_EVENTS_ADDRESS=peer0.debutinfotech.com:7053 \
CORE_PEER_ID=debut-peer0 \
CORE_PEER_LOCALMSPID=debutMSP \
CORE_PEER_GOSSIP_EXTERNALENDPOINT=peer0.debutinfotech.com:7051 \
CORE_PEER_GOSSIP_USELEADERELECTION=true \
CORE_PEER_GOSSIP_ORGLEADER=false \
CORE_PEER_TLS_ENABLED=false \
CORE_PEER_TLS_KEY_FILE=$PWD/crypto-config/peerOrganizations/debutinfotech.com/peers/peer0.debutinfotech.com/tls/server.key \
CORE_PEER_TLS_CERT_FILE=$PWD/crypto-config/peerOrganizations/debutinfotech.com/peers/peer0.debutinfotech.com/tls/server.crt \
CORE_PEER_TLS_ROOTCERT_FILE=$PWD/crypto-config/peerOrganizations/debutinfotech.com/peers/peer0.debutinfotech.com/tls/ca.crt \
CORE_PEER_TLS_SERVERHOSTOVERRIDE=peer0.debutinfotech.com \
CORE_VM_DOCKER_ATTACHSTDOUT=true \
CORE_PEER_MSPCONFIGPATH=$PWD/crypto-config/peerOrganizations/debutinfotech.com/peers/peer0.debutinfotech.com/msp \
CORE_LEDGER_STATE_STATEDATABASE=CouchDB \
CORE_LEDGER_STATE_COUCHDBCONFIG_COUCHDBADDRESS=couchdb:5984 \
CORE_LEDGER_STATE_COUCHDBCONFIG_USERNAME=admin \
CORE_LEDGER_STATE_COUCHDBCONFIG_PASSWORD=admin \
peer node start

