# Onboard the terraform module as a "Deployable Architecture" in IBM Cloud Catalog.

## Objective

In this section, the lab guides you through the steps to make the automation available to end-user through the [IBM Cloud Catalog](https://cloud.ibm.com/catalog) as a Deployable Architecture. 

The end result is a **secure webapp** tile in the IBM Cloud Catalog, that end-user can click on to be guided through the execution of this Deployable Architecture.

![](../images/part-2/c4a6c586954e853f8fa36d097f311cf25c71ba09.png)

## Creating a private catalog for the Deployable Architecture


1.  Create a private catalog to hold your organization's custom
    deployable architectures.

    a.  Navigate to Manage → Catalogs → [Private Catalogs](https://cloud.ibm.com/content-mgmt/catalogs) in the IBM Cloud console.

    b.  Click **Create.**

    c.  Give the catalog a name, eg. "My Deployable Architectures".

    d.  Click **Create**.


2.  Select the catalog, and click **Add** to add a Product to the new
    catalog offering.

    a.  Product type: **Deployable architecture** 

    b.  Delivery method: **Terraform** 

    c.  Repository type: **Public repository** 

    d.  Source URL: `https://github.com/IBM/infra-to-app-with-landing-zone/releases/tag/1.0.0`.
    :information_source:  **Note** This URL is the direct link to the tar.gz asset file located in the [GitHub release page](https://github.com/IBM/infra-to-app-with-landing-zone/releases/tag/1.0.0). 

    e.  Variation: **Standard**. 
    :information_source:  **Note**: a Deployable Architecture may have multiple variations the user may choose from. For example, the VSI landing zone deployable architecture has got two variations: "quick start" and "standard". In this lab, our deployable architecture has got only one variation. It is a good practice to name this variation "Standard" - but you are free to input any name in this field. 

    f.  Software Version: **1.0.0**. :information_source: **Note**: this is the version shown in the tile to the end-users in the catalog tile. It can be any string following the [semantic versioning conventions](https://semver.org/) and does not necessarily need to match the version in your source control management system. 

    g.  Category: **Enterprise applications**. :information_source: **Note**: You may select a category that closely matches your deployable rchitecture. The catalog can be filtered by category. 

    h.  Click **Add product**

3.  A default name is randomly generated for your deployable architecture. To change it:

    a.  Click the **edit** button
    ![](../images/part-2/e49d98bdf9d5c5fe23d2f0f3b04b2e0b271b50e4.png)

    b.  Change the product name to one of your choice -- eg: "Secure webapp"

    c.  (Optional) You may change any other details that will be surfaced in the "tile" of your private catalog. Eg: icon, short description, tags, documentation url. Notice the tile preview on the right-hand side of the page updating as you make changes.

## Specifying initial version details

In the next few steps, we edit the information specific to a given version. 

1. To access the version configuration screens, under the **Version list** section (bottom of the screen), click on the version that  was imported (1.0.0) ![](../images/part-2/8189e32b5ed54528a3fe0cd0ab18af214555cc7d.png)

2. You should be directed to a screen looking like this:
    ![](../images/part-2/media/image24.png)

3.  Screen **Configure version -- Step 1**: Review the version details, and click **Next**

4.  Screen **Configure version -- Step 2:** This screen gives the opportunity to configure (1) the terraform runtime version to execute this version of the Deployable architecture (2) the terraform input and output variables that are made visible to the end-user in IBM Cloud Projects as well as their type.

    a.  Leave the terraform runtime version as is -- there is no need to override the terraform version to use for our deployable architecture. IBM Cloud Schematics is able to pick the correct terraform version based on the version.tf file in our module.

    ```
    terraform {
    required_version = ">= 1.3, < 1.6"
    required_providers {
        ibm = {
        source  = "IBM-Cloud/ibm"
        version = "1.54.0"
        }
    }
    }
    ```

    b.  Under input variables, click the **Add input variables** button
    ![](../images/part-2/media/image25.png)

    c.  Select all variables and click **Add**. We want to expose all
    variables from our terraform module to end-users in IBM Cloud
    Projects.
    ![](../images/part-2/media/image26.png)

    d.  By default, the type of the variable is based on the terraform
    variable types (which is limited to string, number, list, map).
    Catalog gives the possibility to set finer-grained types for the
    input variables. 
    These finer-grained types are used in IBM Cloud
    Projects to further assist the end-user to input value:
      * Click the **region** input variable

      * Under the **Details** section, change the type from string to *VPC Region*
        ![](../images/part-2/520e1108848d01be4e7f9a8b40b36435dcecaa02.png)

      * Perform the same steps to set the "ssh_key" variable type to
         "VPC SSH Key" type. TODO: double check -- probably does not
         apply.

    e.  At this stage, you should end up with a screen like this. Click **Next** at the bottom of the screen.
    ![](../images/part-2/16ac8f7add0155eacbc958df9b14489264e9574b.png)

5.  Screen **Configure version -- Step 3:** This screen allows you to define the IAM access requires to execute. This information is  displayed to the end-users of your deployable architecture tile.
    Given that the deployable architecture deploys a VPC, there is a
    need for the user to have at least editor platform access to the
    VPC. We indicate this:

    a.  Click the **Add +** button

    b.  Under service, search for **Virtual Private Cloud**

    c.  Under platform access role, select **Editor**

    d.  Click **Add**.

    e.  You should end up with a list as shown:![](../images/part-2/media/image29.png)

    f.  Click **Next** to go to the next main step **Add deployable architecture details**

6.  Screen: **Add deployable architecture details -- Step 1 -- add
    architecture diagrams.** One or several architecture diagrams can be
    made available to the user of the deployable architecture tile
    though this step.

    a.  Click the "Add architecture diagram" link ![](../images/part-2/media/image30.png)

    b.  Follow the steps to add an architecture diagram. The repository for this lab contains an architecture diagram. This link is: TODO ![](../images/part-2/ee8a02736dedaaec38f6826ef5e454765563da63.png)

7.  Screen **Add deployable architecture details -- Step 2 -- add
    prerequisites**. Leave input as blank, and click "Next". 
    :information_source: **Note**: This step allows the deployable architecture author to indicate that one or several other deployable architectures must be deployed. In this
    lab, our module deploys the full infrastructure that is needed, so
    there is no need to indicate to the end-user to execute any other
    deployable architecture as a pre-req.

8. Screen **Add deployable architecture details -- Step 3 -- Add
    highlights**. This step allows to indicate any specific highlights
    of your deployable architecture. In this lab, we leave the list of
    highlights blank.

9. Screen **Add license agreements**. This step allows to surface any
    license agreement that users of the deployable architecture must
    accept before deploying. In this lab, we leave the license
    agreements empty.

10. Screen **Edit readme**. By default, the `readme.md` file that is
    packaged in the version is displayed to the end-users of the
    deployable architecture. This step allows making change to the text
    surfaced in the catalog tile. This is useful in the case where the
    deployable architecture does not have access to make modification
    directly to the readme file, where there is no readme file, or where
    the readme file needs adjustment to cover specifics of IBM Cloud
    deployable architecture integration. In this lab, we are using the
    readme as is.

11. Screen **Validate version** - to get the tile visible to other users
    in your account, it must be "validated". The validation process
    consists in executing successfully the terraform module in a
    Schematics workspace at least once. To do so:

    a.  Catalog gives the opportunity to configure the Schematics workspace used for the validation process. You may leave the existing values as is and click **Next**![](../images/part-2/708ba95b2a76860568ee6d085b47d4d7777d748b.png)

    b.  In **Step 2 -- Input variable** - fill out the following parameters:

       * `ibmcloud_api_key`: Input the API Key that was provided to you

       * `region`: Set to eu-gb

       * `ssh_key`: Copy paste the ssh_key that was imported in part 1 of this lab TODO: probably need to generate a new key here to avoid clash

       * `ssh_private_key`: Copy paste the private key created in part
            1 of this lab in [heredoc format](https://en.wikipedia.org/wiki/Here_document).

            ```text
            <<EOT
            -----BEGIN OPENSSH PRIVATE KEY-----
            < private key in base 64 > 
            -----END OPENSSH PRIVATE KEY-----
            EOT
            ```

    c.  In **Step 3 -- Validate version**, click the **Validate** button. ![](../images/part-2/f35f2e7ea685311f9ff32b22d3ec33dc86a5cd7e.png)

    d.  Validation is now in progress. Catalog is running the terraform
    module in a Schematics workspace. ![](../images/part-2/fe1c405a22514718df660e8e3ce13f96060e0065.png)

    e.  Once the validation complete, the following screen should look as
    is: ![](../images/part-2/366e1c7205147143b2bf25c68e2dc30deed8679c.png)
    :bulb: **Tip:** In the case where there are validation issues, you may view and
    follow the full terraform logs in IBM Cloud Schematics through the
    **View logs** link.

12. Screen **Review cost.** The cost displayed in this screen are based
    on the resources created in the validation step. You may review the
    estimate and click **Next**.

13. Screen **Manage compliance**. This step enables you to claim
    compliance to specific controls or set of controls. The claims are
    made against controls that are recorded in [IBM Cloud Security and Compliance Center](https://www.ibm.com/cloud/security-and-compliance-center) (SCC) in [pre-defined
    profiles](https://cloud.ibm.com/docs/security-compliance?topic=security-compliance-predefined-profiles).
    :information_source: **Note**: To further support your claim, you can attach the result of a Security and Compliance Center scan against the infrastructure created from your Deployable Architecture. The result of the scan will be surfaced to the consumer of your Deployable architecture. In this lab, we are not going to make any claim for our Deployable Architecture.

14. Screen **Review Requirements**. This screen gives a summary of any
    requirement. ![](../images/part-2/eb92cfbd40e4d346943f162d58a9c509f2262efc.png)
    Click **Ready to share** and confirm the choice in the popup.

15. In order to share the Deployable Architecture with other users in
    your private catalog:

    a.  Go to the Deployable Architecture page for the Secure webapp. At this point the state of the version 1.0.0 should be marked as **Ready**. ![](../images/part-2/8ede5141765f7fc8fc5d8f1c669613227075a83c.png)

    b.  Under the **Actions\...** button (top right), select **Share** ![](../images/part-2/ffbd5d3eb533623f2b7e3196d9947c898928fbbf.png)

    c.  Select **Share to this account**, and click the **Share** button at the bottom of the screen. ![](../images/part-2/8d1be5e148980da96710b4ede30117ae9babd529.png)
    :information_source: **Note**: There is also the possibility to share with other
    accounts within the same [IBM Cloud enterprise](https://cloud.ibm.com/docs/secure-enterprise?topic=secure-enterprise-what-is-enterprise&interface=ui) - this is the most common way to share Deployable Architecture across accounts for an organization, company, ISV.


At this stage, the secure webapp Deployable Architecture is available to
any user in the account. Users can find it by searching directly in the
search box in the IBM Cloud header:
![](../images/part-2/72a9d91f4543d58261951b90512784e62d4df141.png)

It is also visible in the [catalog](https://cloud.ibm.com/catalog) page. ![](../images/part-2/c4a6c586954e853f8fa36d097f311cf25c71ba09.png)