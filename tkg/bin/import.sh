#!/bin/bash

set -euo pipefail

NETWORK=emea-tkg-01
PHOTON=photon-3-kube-v1.18.2-vmware.1
HAPROXY=photon-3-haproxy-v1.2.4-vmware.1
GOVC_RESOURCE_POOL='/SDDC-Datacenter/host/Cluster-1/Resources/Compute-ResourcePool'

cd $HOME/tkg

govc import.spec ${HAPROXY}.ova | jq ".Name=\"$HAPROXY\"" | jq ".NetworkMapping[0].Network=\"$NETWORK\"" > ${HAPROXY}.json
govc import.ova -options=${HAPROXY}.json ${HAPROXY}.ova
govc snapshot.create -vm ${HAPROXY} root
govc vm.markastemplate ${HAPROXY}
#govc object.mv /SDDC-Datacenter/host/Cluster-1/vm/${HAPROXY} /SDDC-Datacenter/vm/Workloads/tkg

govc import.spec ${PHOTON}.ova | jq ".Name=\"$PHOTON\"" | jq ".NetworkMapping[0].Network=\"$NETWORK\"" > ${PHOTON}.json
govc import.ova -options=${PHOTON}.json ${PHOTON}.ova
govc snapshot.create -vm ${PHOTON} root
govc vm.markastemplate ${PHOTON}
#govc object.mv /SDDC-Datacenter/host/Cluster-1/vm/${PHOTON} /SDDC-Datacenter/vm/Workloads/tkg
