

ORDERER_GENERAL_LOGLEVEL=debug \
ORDERER_GENERAL_LISTENADDRESS=secondorder.debutinfotech.com \
ORDERER_GENERAL_GENESISMETHOD=file \
ORDERER_GENERAL_GENESISFILE=$PWD/channel-artifacts/genesis.block \
ORDERER_GENERAL_LOCALMSPID=debutOrdererMSP \
ORDERER_GENERAL_LOCALMSPDIR=$PWD/crypto-config/ordererOrganizations/debutinfotech.com/orderers/secondorder.debutinfotech.com/msp \
ORDERER_GENERAL_TLS_ENABLED=false \
ORDERER_GENERAL_TLS_PRIVATEKEY=$PWD/crypto-config/ordererOrganizations/debutinfotech.com/orderers/secondorder.debutinfotech.com/tls/server.key \
ORDERER_GENERAL_TLS_CERTIFICATE=$PWD/crypto-config/ordererOrganizations/debutinfotech.com/orderers/secondorder.debutinfotech.com/tls/server.crt \
ORDERER_GENERAL_TLS_ROOTCAS=[$PWD/crypto-config/ordererOrganizations/debutinfotech.com/orderers/secondorder.debutinfotech.com/tls/ca.crt] \
CONFIGTX_ORDERER_BATCHTIMEOUT=1s \
CONFIGTX_ORDERER_ORDERERTYPE=kafka \
CONFIGTX_ORDERER_KAFKA_BROKERS=[kafka0:9092,kafka1:9092,kafka2:9092,kafka3:9092] \
orderer

