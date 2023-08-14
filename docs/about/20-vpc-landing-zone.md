# VPC Landing Zone

IBM VPC Landing Zone (also refered as "SLZ" for Secure Landing Zone) is a set of [Infrastructure-As-Code](https://en.wikipedia.org/wiki/Infrastructure_as_code) automation that enables creating a fully customizable VPC environment within a single region. The VPC Landing Zone is implemented in terraform and automates the provisioning, configuring, and integration of several services that participates in the realization of a compliant VPC-based topology aligned with the documented [IBM Cloud Financial Services Framework](./about/10-fs-cloud).

The automation is available as a set of [terraform modules on GitHub](https://github.com/terraform-ibm-modules/terraform-ibm-landing-zone). The automation creates and configures all of the resources necessary to create a secure and compliant topology:
- A resource group for cloud services and for each VPC.
- Cloud Object Storage instances for flow logs and Activity Tracker (access and audit logs)
- Encryption keys in either a Key Protect or Hyper Protect Crypto Services instance
- A management and workload VPC connected by a transit gateway
- A flow log collector for each VPC
- All necessary networking rules to allow communication.
- Virtual Private Endpoint (VPE) for Cloud Object Storage in each VPC
- A VPN gateway in the management VPC

# Landing Zone patterns


VPC Landing Zone comes with four fully functional patterns that are strictly following the IBM Cloud Financial Services reference architecture:

- VPC pattern
- VPC with Virtual Servers ("VSIs") – which the lab will use.
- VPC with OpenShift ("ROKS")
- VPC with VSIs and OpenShift ("mixed") pattern.

|  VPC pattern                   |  Virtual server pattern          |  Red Hat OpenShift pattern       | Mixed pattern                      |
| ------------------------------ | -------------------------------- | -------------------------------- | ---------------------------------- |
| [![VPC](https://raw.githubusercontent.com/terraform-ibm-modules/terraform-ibm-landing-zone/main/reference-architectures/vpc.drawio.svg)](https://github.com/terraform-ibm-modules/terraform-ibm-landing-zone/blob/main/patterns/vpc/README.md) | [![VSI](https://raw.githubusercontent.com/terraform-ibm-modules/terraform-ibm-landing-zone/main/reference-architectures/vsi-vsi.drawio.svg)](https://github.com/terraform-ibm-modules/terraform-ibm-landing-zone/blob/main/patterns/vsi/README.md) | [![ROKS](https://raw.githubusercontent.com/terraform-ibm-modules/terraform-ibm-landing-zone/main/reference-architectures/roks.drawio.svg)](https://github.com/terraform-ibm-modules/terraform-ibm-landing-zone/blob/main/patterns/roks/README.md) |  [![Mixed](https://raw.githubusercontent.com/terraform-ibm-modules/terraform-ibm-landing-zone/main/.docs/images/mixed.png)](https://github.com/terraform-ibm-modules/terraform-ibm-landing-zone/blob/main/patterns/mixed/README.md) |

Each of the patterns can be used as a starting point to create your own customizable VPC-based topology that matches your enterprise or customer exact needs.
