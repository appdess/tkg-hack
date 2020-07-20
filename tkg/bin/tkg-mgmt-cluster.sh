#!/bin/bash

export VSPHERE_RESOURCE_POOL="/SDDC-Datacenter/host/Cluster-1/Resources/Compute-ResourcePool/tkg-mgmt-cluster"

tkg init -i vsphere -p dev --name tkg-mgmt-cluster
