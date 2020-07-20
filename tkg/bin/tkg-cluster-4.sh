#!/bin/bash

export VSPHERE_NETWORK=tkg-02
export VSPHERE_RESOURCE_POOL="/SDDC-Datacenter/host/Cluster-1/Resources/Compute-ResourcePool/tenant-2/tkg-cluster-4"

tkg create cluster tkg-cluster-4 -p dev -k v1.17.3+vmware.2 -c 1 -w 3
