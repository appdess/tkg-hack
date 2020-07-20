#!/bin/bash

export VSPHERE_NETWORK=tkg-01
export VSPHERE_RESOURCE_POOL="/SDDC-Datacenter/host/Cluster-1/Resources/Compute-ResourcePool/tenant-1/tkg-cluster-3"

tkg create cluster tkg-cluster-3 -p dev -k v1.17.3+vmware.2 -c 1 -w 3
