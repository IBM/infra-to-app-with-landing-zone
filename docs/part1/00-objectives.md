# Part 1: End-to-end deployment of a sample web application on top of a secure VPC-topology

This section of the lab walks through the steps to provision a secure VPC-based topology aligned with the with Financial the **VSI on VPC landing zone** Deployable Architecture as show in the diagram below. 

![](https://raw.githubusercontent.com/terraform-ibm-modules/terraform-ibm-landing-zone/main/reference-architectures/vsi-vsi.drawio.svg 'size=60%' )

We will then manually customize the deployed infrastructure to:
1. Expose one of the VSI in the management VPC to act as a "jump box" for operator access. This jump box is the entry point for operators to access the VSIs in the workload VPC.
2. Deploy an Apache server in a VSI in the workload VPC.
3. Expose the web pages served by the Apache service to the internet through a public load balancer.


## Lab Prerequisites :white_check_mark:

?> _TODO_ review


- An IBM Cloud Pay-As-You-Go or Subscription account.
:information_source: **Note**:  Participants in the TechXchange classroom will be provided with credentials to access an IBM Cloud account for the duration of the lab.
- An IBMId
- API Key

A development machine with the following software:
- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- Text editor of your choice
- Web browser
- Tools to generate SSH key. Linux and Mac comes with ssh-keygen. [PuTTYgen](https://www.ssh.com/academy/ssh/putty/windows/puttygen) can be used on Windows. See [Generating an external SSH key](https://cloud.ibm.com/docs/vpc?topic=vpc-ssh-keys&interface=ui#generating-ssh-keys)

:information_source: **Note**:  Participants in the TechXchange classroom will be provided with a development VM with pre-installed software.