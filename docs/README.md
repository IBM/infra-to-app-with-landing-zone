# Seamless App Deployment with IBM Cloud's Secure Landing Zone

With the release of IBM Cloud [Deployable Architectures](https://cloud.ibm.com/docs/secure-infrastructure-vpc?topic=secure-infrastructure-vpc-faqs), it is easy to provision an exisiting pre-defined architecture or customize and import.

## :books: What you will learn

In this hands-on lab, you will learn to:

1. Create a customized VPC-based topology using the IBM Cloud [VPC Landing Zone](https://cloud.ibm.com/docs/secure-infrastructure-vpc?topic=secure-infrastructure-vpc-overview) Deployable Architecture
2. Deploy and expose a web application on top of this secure topology. For this lab, we will use an Apache service as an example.
3. Share this deployable pattern with your enterprise through an IBM Cloud Private Catalog

This lab also introduces some concepts and background prior to diving onto the hands-on steps, which can help you to better get the "bigger" picture. The hands-on steps are designed to be independent from the concepts and background information, so may be skipped as desired.

## Lab structure

The objective of this lab is split into two distinct parts.

- [Part 1](./part1/00-objectives) shows the end-to-end steps to:
  1. Use the [Landing Zone](https://cloud.ibm.com/docs/secure-infrastructure-vpc?topic=secure-infrastructure-vpc-overview) Deployable Architecture to automatically deploy a secure VPC-based topology in your account
  2. Manually customize the deployed infrastructure to:
    
    a. Provide operator access through a "jump box" VSI

    b. Install an Apache server in one of the workload VPC

    c. Expose the web application served by the Apache service through a public VPC LoadBalancer

- [Part 2](./part2/00-objectives) shows how to:
  1. Automate the manual steps in Part 1
  2. How to package, and share the automation as a **Deployable Architecture** through a private IBM Cloud Catalog to facilitate discoverability and consumption of your automation by other users.

 The first part is designed as a stepping stone for the second part.