# Custom landing-zone topology

This module enables the creation of a custom landing-zone topology based of the VSI topology.

The custom topology is defined in the [override.json](./override.json) file. It is based of the landing zone VSI topology, with the following modifications:
1. A public floating IP is assigned to one of the VSI in the management VPC. This VSI acts as a "jump box" for operator access.
2. One of the VSI in the workload VPC is exposed through a public VPC loadbalancer
3. Adjustement to the VPC network ACLs and security group to enable connectivity to the operator "jump box" and to the workload VPC loadbalancer.

