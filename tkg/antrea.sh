#!/bin/bash

cd $HOME

sed '/calico-config/,$d' .tkg/providers/infrastructure-vsphere/v0.6.3/cluster-template-dev.yaml > .tkg/providers/infrastructure-vsphere/v0.6.3/cluster-template-dev-antrea.yaml

sed '/calico-config/,$d' .tkg/providers/infrastructure-vsphere/v0.6.3/cluster-template-dev.yaml > .tkg/providers/infrastructure-vsphere/v0.6.3/cluster-template-prod-antrea.yaml

awk '{print "   ", $0}' tkg/antrea.yaml >> .tkg/providers/infrastructure-vsphere/v0.6.3/cluster-template-dev-antrea.yaml
awk '{print "   ", $0}' tkg/antrea.yaml >> .tkg/providers/infrastructure-vsphere/v0.6.3/cluster-template-prod-antrea.yaml
