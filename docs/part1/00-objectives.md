# Lab 1: End-to-end deployment of a sample web application on a secure VPC topology

In lab 1, you provision a secure VPC-based topology that is aligned with the **VSI on VPC landing zone** deployable architecture, as shown in the following diagram.

![VSI on VPC landing zone architecture diagram](https://raw.githubusercontent.com/terraform-ibm-modules/terraform-ibm-landing-zone/main/reference-architectures/vsi-vsi.drawio.svg 'size=60%' )


After you provision the VPC, you customize the deployed infrastructure in the following ways:
- Expose one of the VSI in the management VPC to act as a "jump box" for operator access. This jump box is the entry point for operators to access the VSIs in the workload VPC.
- Deploy an Apache server in a VSI in the workload VPC.
- Expose the web pages that are served by the Apache server to the internet through a public load balancer.

## Lab Prerequisites :white_check_mark:

?> _TODO_ review

Make sure that you meet the following prerequisites before you begin the lab.

- IBM Cloud
    - An IBM Cloud Pay-Go or Subscription account

        :information_source: **Note**:  Participants in the TechXchange classroom will be provided with credentials to access an IBM Cloud account during the lab.
    - An IBMid
    - API key with the following permissions

?> _TODO_ add permissions for API key

- A development computer with the following software.
    - [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
    - Text editor of your choice
    - Web browser
    - Tools to generate SSH key
        - Linux and Mac come with ssh-keygen.
        - Windows users can use [PuTTYgen](https://www.ssh.com/academy/ssh/putty/windows/puttygen)

        For more information, see [Generating an external SSH key](https://cloud.ibm.com/docs/vpc?topic=vpc-ssh-keys&interface=ui#generating-ssh-keys).
    - Optional: [IBM Cloud CLI](https://cloud.ibm.com/docs/cli?topic=cli-getting-started)

:information_source: **Note**:  Participants in the TechXchange classroom will be provided with a development VM with the prerequisite software installed.
