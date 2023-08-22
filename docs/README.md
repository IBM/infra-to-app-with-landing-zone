# Seamless Deployment: From Provisioning to Runtime With the IBM Cloud VPC landing zone

The introduction of IBM Cloud [deployable architectures](https://cloud.ibm.com/docs/secure-infrastructure-vpc?topic=secure-infrastructure-vpc-faqs) makes it easy to provision predefined architecture in no time.

## 📖 What you will learn

In this hands-on lab, you will learn how to work with the VPC landing zone deployable architecture to accomplish these goals.

1. Create a customized VPC-based topology from the VPC landing zone deployable architecture.
2. Deploy and expose a web application on this secure topology. For this lab, we use an Apache service as an example.
3. Share this deployable pattern with your enterprise through the IBM Cloud private catalog.

The lab also introduces some concepts and background to help you to better get the "bigger" picture at the beginning. However, the hands-on steps are designed to be independent from the concepts and background information.

## Lab structure

The lab has two parts. The first part is a stepping stone to the second part.

In [part 1](./part1/00-objectives), you take the perspective of a cloud infrastructure engineer:

1. Use the [landing zone deployable architecture](https://cloud.ibm.com/docs/secure-infrastructure-vpc?topic=secure-infrastructure-vpc-overview) to automatically deploy a secure VPC-based topology in an IBM Cloud account.
2. Manually customize the deployed infrastructure in the account in the following ways:
    a. Provide operator access through a "jump box" VSI.
    b. Install an Apache server in one of the workload VPCs that serves the web pages.
    c. Expose the web pages that are served by the Apache server through a public VPC load balancer.

In [part 2](./part2/00-objectives), you are a DevOps/automation engineer:

1. Automate the manual steps in part 1.
2. Package, and share the automation with other users as a **Deployable architecture** through a private IBM Cloud catalog. This packaging in a private catalog helps specific users to find and consume your automation.
