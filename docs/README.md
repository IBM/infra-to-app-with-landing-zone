# Seamless Deployment: From Provisioning to Runtime with IBM Cloud's Landing Zone

The introduction of IBM Cloud [Deployable Architectures](https://cloud.ibm.com/docs/secure-infrastructure-vpc?topic=secure-infrastructure-vpc-faqs) makes it easy to provision existing pre-defined architecture in no time.

## 📖 What you will learn

In this hands-on lab, you will learn to:

1. Create a customized VPC-based topology using the IBM Cloud [VPC Landing Zone Deployable Architecture](https://cloud.ibm.com/docs/secure-infrastructure-vpc?topic=secure-infrastructure-vpc-overview)
2. Deploy and expose a web application on top of this secure topology. For this lab, we will use an Apache service as an example.
3. Share this deployable pattern with your enterprise through an IBM Cloud Private Catalog

This lab also introduces some concepts and background prior to diving onto the hands-on steps, which can help you to better get the "bigger" picture. The hands-on steps are however designed to be independent from the concepts and background information.

## Lab structure

This lab is split into two distinct parts. Part 1 is designed as a stepping stone for part 2.

- [Part 1](./part1/00-objectives) takes the perspective of a Cloud Infrastructure Engineer, and shows the end-to-end steps to:
  1. Use the [Landing Zone Deployable Architecture](https://cloud.ibm.com/docs/secure-infrastructure-vpc?topic=secure-infrastructure-vpc-overview) to automatically deploy a secure VPC-based topology in an IBM Cloud account.
  2. Manually customize the deployed infrastructure in the account to:    
    a. Provide operator access through a "jump box" VSI.\
    b. Install an Apache server in one of the workload VPC that serves the web pages.\
    c. Expose the web pages served by the Apache server through a public VPC load balancer.

- [Part 2](./part2/00-objectives) takes the perspective of a DevOps/Automation Engineer, and shows how to:
  1. Automate the manual steps in Part 1
  2. Package, and share the automation with other users as a **Deployable Architecture** through a private IBM Cloud Catalog. This facilitates discoverability and consumption of your automation by other users.

