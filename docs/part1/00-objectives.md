# Part 1: End-to-end deployment of a sample web application on top of a secure VPC-topology

This section of the lab walks through the steps to provision a secure VPC-based topology aligned with the with Financial the **VSI on VPC landing zone** Deployable Architecture as show below.

![](https://raw.githubusercontent.com/terraform-ibm-modules/terraform-ibm-landing-zone/main/reference-architectures/vsi-vsi.drawio.svg 'size=60%' )

We will then manually customize the deployed infrastructure to:
1. Expose one of the VSI in the management VPC to act as a "jump box" for operator access. This jump box is the entry point for operators to access the VSIs in the workload VPC.
2. Deploy an Apache server in a VSI in the workload VPC.
3. Expose the web pages served by the Apache service to the internet through a public load balancer.

## Lab Prerequisites :white_check_mark:

?> _TODO_ review

- IBM Account (ibmid to gain access to console)
- API Key
- Generate SSH key for access to VSI
