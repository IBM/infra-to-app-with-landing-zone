# Lab 1: End-to-end deployment of a sample web application on a secure VPC topology

In lab 1, you provision a secure VPC-based topology that is aligned with the **VSI on VPC landing zone** deployable architecture, as shown in the following diagram.

<img src="https://raw.githubusercontent.com/terraform-ibm-modules/terraform-ibm-landing-zone/main/reference-architectures/vsi-vsi.drawio.svg" width="75%" heigh="75%"/>

After you provision the VPC, you customize the deployed infrastructure in the following ways:
- Expose one of the VSI in the management VPC to act as a "jump box" for operator access. This jump box is the entry point for operators to access the VSIs in the workload VPC.
- Deploy an Apache server in a VSI in the workload VPC.
- Expose the web pages that are served by the Apache server to the internet through a public load balancer.
