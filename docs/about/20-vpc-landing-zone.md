# VPC landing zone

IBM VPC landing zone (also referred to as "SLZ" for secure landing zone) is [Infrastructure-As-Code](https://en.wikipedia.org/wiki/Infrastructure_as_code) automation that enables you to create a fully customizable VPC environment within a single region. The VPC landing zone is implemented in Terraform and automates the provisioning, configuring, and integration of several services that participate in the realization of a compliant VPC-based topology that is aligned with the documented [IBM Cloud for Financial Cloud Services Framework](./about/10-fs-cloud).

The automation is available as a set of [Terraform modules on GitHub](https://github.com/terraform-ibm-modules/terraform-ibm-landing-zone). The automation creates and configures all of the resources necessary to create a secure and compliant topology:
- A resource group for cloud services and for each VPC
- Cloud Object Storage instances for flow logs and Activity Tracker (access and audit logs)
- Encryption keys in either a Key Protect or Hyper Protect Crypto Services instance
- A management and workload VPC connected by a transit gateway
- A flow log collector for each VPC
- All necessary networking rules to allow communication.
- Virtual Private Endpoint (VPE) for Cloud Object Storage in each VPC
- A VPN gateway in the management VPC

# Landing zone patterns


VPC landing zone comes with four fully functional patterns that follow the IBM Cloud Framework for Financial Services reference architecture:

- VPC pattern
- VPC with Virtual Servers ("VSIs") – which the lab uses.
- VPC with Red Hat OpenShift ("ROKS")
- VPC with VSIs and Red Hat OpenShift ("mixed") pattern.

|  VPC pattern                   |  Virtual server pattern          |  Red Hat OpenShift pattern       | Mixed pattern                      |
| ------------------------------ | -------------------------------- | -------------------------------- | ---------------------------------- |
| [![VPC](https://raw.githubusercontent.com/terraform-ibm-modules/terraform-ibm-landing-zone/main/reference-architectures/vpc.drawio.svg)](https://github.com/terraform-ibm-modules/terraform-ibm-landing-zone/blob/main/patterns/vpc/README.md) | [![VSI](https://raw.githubusercontent.com/terraform-ibm-modules/terraform-ibm-landing-zone/main/reference-architectures/vsi-vsi.drawio.svg)](https://github.com/terraform-ibm-modules/terraform-ibm-landing-zone/blob/main/patterns/vsi/README.md) | [![ROKS](https://raw.githubusercontent.com/terraform-ibm-modules/terraform-ibm-landing-zone/main/reference-architectures/roks.drawio.svg)](https://github.com/terraform-ibm-modules/terraform-ibm-landing-zone/blob/main/patterns/roks/README.md) |  [![Mixed](https://raw.githubusercontent.com/terraform-ibm-modules/terraform-ibm-landing-zone/main/.docs/images/mixed.png)](https://github.com/terraform-ibm-modules/terraform-ibm-landing-zone/blob/main/patterns/mixed/README.md) |

You can use any pattern as a starting point to create a customizable VPC-based topology that supports your customer needs or the needs of your enterprise.
