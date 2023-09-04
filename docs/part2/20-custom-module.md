# Encapsulating the topology definition in a Terraform module

## Objective

In this step, you run a Terraform module that automates the creation of the custom landing zone topology that you defined in the JSON file in the [previous step](./10-customizing.md).

The objective now is to provide a basic Terraform module that can be easily consumed and creates the custom VPC topology. You can consider this module as a level of abstraction that simplifies consumption. Consumers of the module do not need to understand the landing zone code or the JSON file that contains the topology definition. They can run a `terraform apply` command with a minimal number of inputs to deploy the fully customized VPC topology in their account.

## Executing the landing zone with a JSON definition

You can find the code for this step in the [custom-slz](https://github.com/IBM/infra-to-app-with-landing-zone/tree/main/custom-slz) directory. The directory contains two important files:
- The customized JSON file [override.tftpl](https://github.com/IBM/infra-to-app-with-landing-zone/blob/main/custom-slz/override.tftpl) file.

    This file is a copy of the JSON definition for our custom topology that you created in the previous step of this lab. The file contains `${prefix}` placeholders that are replaced by an input variable at run time by using the `templatefile` function. The placeholders ensure that resource group names are unique in the account. Unique names are necessary to ensure that the resource group names don't clash because of multiple attendees who are running the lab in the same IBM Cloud account.
- The [main.tf](https://github.com/IBM/infra-to-app-with-landing-zone/blob/main/custom-slz/main.tf) file.

    This file contains the Terraform logic that calls the landing zone module with the correct parameters. The logic is relatively minimal because it mostly delegates the effort to the landing zone module.

    Notice these two settings in the `main.tf` file:

    - The `override_json_string` input variable takes the full JSON definition. In this example, the JSON that is passed to the module through the `templatefile` function first to 'inject' the prefix. That process is done to ensure uniqueness of the resource group names in the account, as mentioned in the first item.
    - The `source` is set to the standard VSI pattern and points to the version 4.6.0 (the most recent version at the time that this lab was written).

    ```hcl
    module "landing_zone" {
      source           = "git::https://github.com/terraform-ibm-modules/terraform-ibm-landing-zone.git//patterns/vsi?ref=v4.6.0"
      prefix           = var.prefix
      region           = var.region
      ibmcloud_api_key = var.ibmcloud_api_key
      ssh_public_key   = var.ssh_key
      override_json_string = templatefile("./override.tftpl", { prefix = var.prefix })
    }
    ```

To run the Terraform module in your local environment, follow these steps.

1.  Clone the repository locally with the following Git command:

    ```sh
    cd ~
    git clone https://github.com/IBM/infra-to-app-with-landing-zone
    ```

2.  Change to the `custom-slz` folder

    ```sh
    cd infra-to-app-with-landing-zone/custom-slz
    ```

3.  Create a Terraform workspace. Replace `lab` with your own name in the following command.

    ```sh
    terraform workspace new lab
    ```

4.  Generate an SSH key pair. This key pair is used to `ssh` to the VSIs created by this execution.

    ```sh
    ssh-keygen -t rsa -b 4096 -N '' -f ./lab2-key-tf
    ```

5.  Export the IBM Cloud API key that the Terraform will use for the execution. For instructions, see [Managing user API keys](https://cloud.ibm.com/docs/account?topic=account-userapikey&interface=ui).

    ```sh
    export TF_VAR_ibmcloud_api_key=<your API key>
    ```

6.  Initialize Terraform.

    ```sh
    terraform init
    ```

7.  Generate a plan. The plan lists of resources that are going to be created.

    ```sh
    terraform plan -var=region=eu-gb -var=ssh_key="$(cat ./lab2-key-tf.pub)" -var=prefix=<your_initials>-lab2
    ```

8.  (Optional) Apply the changes.

    This step might take up to 15 minutes to complete. You can skip it if you're short on time. The automation is run through the catalog onboarding in a later step of this lab.

    ```sh
    terraform apply -var=region=eu-gb -var=ssh_key="$(cat ./lab2-key-tf.pub)" -var=prefix=<your_initials>-lab2
    ```
