# Deployable Architecture

“Deployable Architecture” is officially defined as “Cloud automation for deploying a common architectural pattern that combines one or more cloud resources that is designed for easy deployment, scalability, and modularity.”

More specifically, and concretely, from a technical perspective, “Deployable Architectures” are essentially terraform modules that are fully integrated into the IBM Cloud experience. Deployable Architecture are:

- Discoverable and available through the IBM Cloud Catalog (and through IBM Cloud search)
- Fully integrated in IBM Cloud Projects and Schematics.
- Integrated with [IBM Cloud Risk Analyzer](https://cloud.ibm.com/docs/code-risk-analyzer-cli-plugin?topic=code-risk-analyzer-cli-plugin-cra-cli-plugin#terraform-command)

In other words, it is possible for an end-user to execute the terraform automation behind a “Deployable Architecture” just from a few clicks and inputs in the IBM Cloud console.

![Deployable Architecture console](../images/about-deployable-arch.png)

The Landing Zone terraform module and patterns described in [🌍 VPC Landing Zone](./about/20-vpc-landing-zone.md) have a corresponding [Deployable Architecture](https://cloud.ibm.com/docs/secure-infrastructure-vpc?topic=secure-infrastructure-vpc-overview) in IBM Cloud. In this lab, the Secure Landing Zone is consumed through the Deployable Architecture experience for ease of use, rather than using the terraform CLI against the open-source github version.

IBM-maintained Deployable Architectures, like the Landing Zone Deployable Architecture:

- Provide the same level of customer support as any other IBM Cloud product
- [Come with extensive documentation](https://cloud.ibm.com/docs/secure-infrastructure-vpc?topic=secure-infrastructure-vpc-overview)
- Are maintained and remains current over time
