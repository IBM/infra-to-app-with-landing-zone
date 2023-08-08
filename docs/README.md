# Seamless App Deployment with IBM Cloud's Secure Landing Zone

With the release of IBM Cloud Deployable Architectures, it is easy to provision an exisiting pre-defined architecture or customize and import.

In this hands-on lab, you will learn to:

1. Create a customized VPC-based topology using the VPC Landing Zone Deployable Architecture
2. Deploy and expose a web application on top of this secure topology. For this lab, we will use an Apache service as an example.
3. Share this deployable pattern with your enterprise through the IBM Cloud Private Catalog

The objective of this lab is split into two distinct parts. The first part is built as a stepping stone for the second part.

- Part 1 shows the end-to-end steps to deploy a sample web application on top of a secure VPC-topology in your own account.
  - The secure VPC-based topology will be deployed using the Landing Zone Deployable Architecture.
  - Operator access will be provided through a manually deployed jump box VSI
  - An Apache server will be deployed in a secure VSI workload VPC
  - The web application will be exposed for outside access.
- Part 2 shows how to automate the manual steps in Part 1, and then, how to package, and share the automation as a “Deployable Architecture” with other user through a private IBM Cloud Catalog
