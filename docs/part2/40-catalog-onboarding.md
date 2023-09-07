# Onboard the Terraform module as a deployable architecture in IBM Cloud catalog

## Objective

In this step of lab 2, you make the automation available to users through the [IBM Cloud catalog](https://cloud.ibm.com/catalog) as a deployable architecture.

The result is a **secure webapp** tile in the IBM Cloud catalog that guides users through the execution of this deployable architecture.

![](../images/part-2/c4a6c586954e853f8fa36d097f311cf25c71ba09.png)

## Creating a private catalog for the deployable architecture


1.  Create a private catalog to hold your organization's custom deployable architectures.

    1.  Go to **Manage** > **Catalogs** > **[Private catalogs](https://cloud.ibm.com/content-mgmt/catalogs)** in the IBM Cloud console.
    1.  Click **Create**.
    1.  Give the catalog a name. For example, `My deployable architectures (yourinitials)`.
    1.  Click **Create**.
1.  Select the catalog, and then click **Add** to add a product to the new catalog offering.

    - Product type: **Deployable architecture**.
    - Delivery method: **Terraform**.
    - Repository type: **Public repository**.
    - Source URL: `https://github.com/IBM/infra-to-app-with-landing-zone/archive/refs/tags/1.0.2.tar.gz`.

        This URL links to the `tar.gz` asset file that is located in the [GitHub release page](https://github.com/IBM/infra-to-app-with-landing-zone/releases/tag/1.0.2).
    - Variation: **Standard**.

        :bulb: **Tip:** A deployable architecture can have multiple variations for the user to choose from. For example, the VSI on VPC landing zone deployable architecture has two variations: "quick start" and "standard". In this lab, our deployable architecture has one variation. It's good practice to name this variation "Standard" - but you can use any name.
    - Software Version: **1.0.2**.

        This version is the version that is displayed to users in the catalog. The version can be any string that follows [semantic versioning conventions](https://semver.org/). It does not need to match the version in your source control management system.
    - Category: **Enterprise applications**.

        You can select a category that matches your deployable architecture. User who browses the catalog can filter by category.
1.  Click **Add product**.
1.  (Optional) Change the default name for your product:

    1.  Click **Edit**.

        ![](../images/part-2/e49d98bdf9d5c5fe23d2f0f3b04b2e0b271b50e4.png)

    1.  Change the product name to one of your choice. For example, `Secure webapp`.
    1.  (Optional) You can change any other details in the tile of your private catalog. For example, you can change the icon, short description, tags, or documentation URL. A preview of the catalog tile on the right side of the page updates as you make changes.
    1.  Click the **Save** button to persist the changes.

## Specifying initial version details

In the next few steps, you edit the information that applies to the version.

### Configuring the version
1.  Access the version configuration pages:

    1.  In the **Version list** section, click the version that was imported (1.0.2).

        ![](../images/part-2/8189e32b5ed54528a3fe0cd0ab18af214555cc7d.png)

1.  The **Configure version** pane is displayed:
    ![](../images/part-2/media/image24.png)
    1.  Review the details in **Step 1 - Review the version details**. Click **Next**.
    1.  In **Step 2**, you can configure both the Terraform runtime version to run this version of the deployable architecture and the Terraform input and output variables that are displayed to users in IBM Cloud projects.

        Leave the Terraform runtime version as is. You do not need to override the Terraform version to use for our deployable architecture. IBM Cloud Schematics is able to pick the correct Terraform version from the `version.tf` file in the module.

        ```hcl
        terraform {
        required_version = ">= 1.3, < 1.6"
        required_providers {
            ibm = {
            source  = "IBM-Cloud/ibm"
            version = "1.56.1"
            }
        }
        }
        ```

    1.  In the Input variables section, click **Add input variables**.

        ![](../images/part-2/media/image25.png)
    1.  Select all variables and click **Add**. We want to display all variables from our Terraform module to users in IBM Cloud projects.

        ![](../images/part-2/media/image26.png)
    1.  Edit some input variables:

        By default, the type of the variable is based on the Terraform variable type (which are limited to `string`, `number`, `list`, and `map`). You can set finer-grained types for the input variables, which can help users set the input values.

        1.  Click the `region` input variable
        1.  In the **Details** section, change the type from string to *VPC Region*

            ![](../images/part-2/520e1108848d01be4e7f9a8b40b36435dcecaa02.png)

        1.  Perform the same steps to set the type of the `ssh_private_key` variable to *Multiline secure value*

        Compare your entries against the following screenshot.

        ![](../images/part-2/16ac8f7add0155eacbc958df9b14489264e9574b.png)

    1.  Click **Next**.

1.  In the **Step 3** pane, you define the IAM access permissions that are needed to run the deployable architecture. This information is displayed to users of your deployable architecture tile.

    The deployable architecture deploys a VPC, so users need at least editor platform access to the VPC:
    1.  Click **Add +**.
    1.  In service, search for **Virtual Private Cloud**.
    1.  In platform access role, select **Editor**.
    1.  Click **Add**.

    Compare your work against the following screenshot.

    ![](../images/part-2/media/image29.png)

1.  Click **Next**.

### Adding deployable architecture details

In the **Add deployable architecture details** section, you can add architecture diagrams and other information about the deployable architecture.

1.  In the **Step 1 - Add architecture diagrams** pane, add an architecture diagram:

    1.  Click the **Add architecture diagram** link

        ![](../images/part-2/media/image30.png)

    1.  Follow the steps to add an architecture diagram.

        The repository for this lab contains an architecture diagram. When prompted, use this url: `https://raw.githubusercontent.com/IBM/infra-to-app-with-landing-zone/cff0457a362c9b56ce805234410b678d55ebe29d/vpc.drawio.svg`

        ![](../images/part-2/ee8a02736dedaaec38f6826ef5e454765563da63.png)

    1.  Add a required caption and description and click **Update**.

1.  In the **Step 2 - add prerequisites** pane, leave the input as blank, and click **Next**.

    In this step, you can identify prerequisite deployable architectures that must be deployed. However, in this lab, our module deploys the full infrastructure, and you don't need to identify other deployable architectures that are required.

1.  In the **Step 3 - Add highlights** pane, leave the list of highlights blank.

    In this step, you can indicate other pertinent information about your deployable architecture.

### Updating the license agreement and readme file

1.  In the **Add license agreements** pane, keep the [license](https://github.com/IBM/infra-to-app-with-landing-zone/blob/main/LICENSE) that was imported automatically by IBM Cloud Catalog from the Github repository.

    In this step, you can identify a license agreement that users must accept before they deploy.

1.  In the **Edit readme** pane, leave the readme file as is.

    By default, the `readme.md` file that is packaged in the version is displayed to users. In this step, you can change the content that is displayed. Changing the content of the readme file is useful in several situations. For example,

    - When the deployable architecture does not have access to make modifications directly to the readme file.
    - When no readme file exists.
    - When the details of the deployable architecture are different in the IBM Cloud deployable architecture integration.

### Validating the version

Before the deployable architecture is published to others to see, it is validated. The validation process attempts to execute the Terraform module in a IBM Cloud Schematics workspace at least one time successfully.

1.  In the **Step 1 - Configure Schematics workspace** pane, leave the existing values as is and click **Next**.

    ![](../images/part-2/708ba95b2a76860568ee6d085b47d4d7777d748b.png)

1.  Generate an SSH key pair. This key pair is used to ssh to the VSIs created by this execution.

    ```sh
    ssh-keygen -t rsa -b 4096 -N '' -f ./lab2-catalog-key
    ```

1.  In **Step 2 - Input variable**, specify the following parameters:
    - `ibmcloud_api_key`: Untoggle *Use a secret* and input the API key that you generated.
    - `region`: Set to `eu-gb`.
    - `ssh_key`: Copy and paste the SSH key that was generated in previous step (content of `lab2-catalog-key.pub`).
    - `ssh_private_key`: Untoggle *Use a secret* and copy and paste the private key that was generated in previous step (content of `lab2-catalog-key`) in the [heredoc format](https://en.wikipedia.org/wiki/Here_document). You should end up with a string looking like:

        ```text
        <<EOT
        -----BEGIN OPENSSH PRIVATE KEY-----
        < private key in base 64 >
        -----END OPENSSH PRIVATE KEY-----
        EOT
        ```

    - `prefix` (under the **Optional input variables** section): Your initials followed by catalog. For instance `vb-catalog`.

1.  In **Step 3 - Validate version**, click **Validate**.

    ![](../images/part-2/f35f2e7ea685311f9ff32b22d3ec33dc86a5cd7e.png)

    Validation is now in progress. The IBM Cloud catalog is running the Terraform module in a Schematics workspace. 

    ![](../images/part-2/fe1c405a22514718df660e8e3ce13f96060e0065.png)

    Validation may take up to 25 minutes as it is going to deploy the full solution implemented in the module. While you wait for the validation to finish, consider doing these things:
    1. Look at the deployment logs in IBM Cloud Schematics by clicking the **View logs** link
    1. Explore some of the materials in the [introduction](README) to this lab.
    1. Have a coffee ☕

    If the validation completes successfully, you see a pane that looks like the following screenshot:

    ![](../images/part-2/366e1c7205147143b2bf25c68e2dc30deed8679c.png)

    :bulb: **Tip:** If you have issues with validation, click the **View logs** link to examine the full Terraform logs in IBM Cloud Schematics.

### Reviewing cost, compliance, and requirements

1.  In the **Review cost** pane, review the cost estimate. The costs are based on the resources that are created in the validation step.
1.  Click **Next**.
1.  In the **Manage compliance** pane, leave everything as is and click **Next**.

    The compliance step supports your claiming compliance with specific controls or a set of controls. The claims are made against controls that are recorded in [IBM Cloud Security and Compliance Center](https://www.ibm.com/cloud/security-and-compliance-center) in [predefined profiles](https://cloud.ibm.com/docs/security-compliance?topic=security-compliance-predefined-profiles).

    :information_source: **Note**: To further support your claim, you can attach the result of a Security and Compliance Center scan against the infrastructure that is created from your deployable architecture. The result of the scan is available to users of your deployable architecture.

    In this lab, we don't make any claims for our deployable architecture.

1.  Review the details in the **Review Requirements** pane, and then click **Ready to share**. Confirm your choice.

    ![](../images/part-2/eb92cfbd40e4d346943f162d58a9c509f2262efc.png)

### Sharing your deployable architecture

To share the deployable architecture with other users in your private catalog, following these steps.

1.  Go to the deployable architecture page for the Secure webapp. Make sure that state of the version 1.0.2 is marked as `Ready`.

    ![](../images/part-2/8ede5141765f7fc8fc5d8f1c669613227075a83c.png)
1.  Click **Actions...** and select **Share**.

    ![](../images/part-2/ffbd5d3eb533623f2b7e3196d9947c898928fbbf.png)
1.  Select **Share to this account**, and click **Share**.

    ![](../images/part-2/8d1be5e148980da96710b4ede30117ae9babd529.png)


You can also share the deployable architecture with other accounts in the same [IBM Cloud enterprise](https://cloud.ibm.com/docs/secure-enterprise?topic=secure-enterprise-what-is-enterprise&interface=ui). This method is the most common way to share deployable architectures across accounts for an organization, company, or ISV.

The secure webapp deployable architecture is available to any user in the account. Your users can find it by searching directly in the search box in the IBM Cloud header.

![](../images/part-2/72a9d91f4543d58261951b90512784e62d4df141.png)

The deployable architecture is also displayed in the [catalog](https://cloud.ibm.com/catalog) page.

![](../images/part-2/c4a6c586954e853f8fa36d097f311cf25c71ba09.png)
