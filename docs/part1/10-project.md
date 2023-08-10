# Deploying Landing Zone VSI pattern through IBM Cloud Project

1. Create an ssh-key via the command:\
   `ssh-keygen -t rsa -b 4096 -N '' -f ./lab-key`\
   This command generates two files in the current directory: `lab-key` (the private key) and `lab-key.pub` (the public key).
2. Access the [VSI on VPC landing zone Deployable Architecture](https://cloud.ibm.com/catalog/architecture/deploy-arch-ibm-slz-vsi-ef663980-4c71-4fac-af4f-4a510a9bcf68-global?catalog_query=aHR0cHM6Ly9jbG91ZC5pYm0uY29tL2NhdGFsb2cjcmVmZXJlbmNlX2FyY2hpdGVjdHVyZQ%3D%3D)
3. On the Overview page, make sure the following is selected:\
   a. Product version: **Select the latest** (4.4.7 at the time of writting)

   b. Variation: Standard
   ![Overview page](../images/part-1/10-overview-page.png)
4. Click **Review deployment options** on the bottom right
5. Click **Add to project**
6. Under _Create New_, input a name that you wish to provide to the project. For example "Landing Zone Lab"
7. Click **Add** on the bottom right
8. Under _Configure -> Security_ section, set the following:\
   a. Authentication: untoggle _Use a secret_ and paste your IBM Cloud API key input the box

9. Under _Configure->Required_ section, set the following:\
   a. `ssh_public_key`: The value of lab-key.pub that was generated from step 1\
   b. `region`: Select a region that you wish to deploy in\
   c. `prefix`: your initials
   ![Configuration](../images/part-1/10-configuration.png)

10. Under _Configure-> Optional_, set the following:\
    a. `add_atracker_route`: false
11. Click **Save**
12. Click **Validate**
13. The project will go through different steps in validation. When it completes, the validation might fail due to a rule within the Security and compliance section. In the _Approval not recommended_ section, add a comment and click **Override and approve** to start provisioning.

![Validation](../images/part-1/10-validation.png)

14. Click **Deploy**

Note: The deploy will take approximately 15 minutes to complete
