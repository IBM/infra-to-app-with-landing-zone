# Encapsulating the topology definition in a terraform module


## Objective

In this step, you will be executing a terraform module that automates
the creation of the custom landing zone topology defined in the json
definition created in the [previous step](./10-customizing.md).

The objective is to provide a basic terraform module that can be easily
consumed to create the custom VPC topology. See this module as a level
of abstraction simplifying consumption: consumers of the module that we
will create here do not need to understand landing zone, or even the
json file containing the custom topology definition -- they can "just" run
`terraform apply` with a minimal number of inputs to get the full custom
VPC topology deployed in their account.

## Executing landing-zone with a json definition

The code for this step is located in the [custom-slz](https://github.com/IBM/infra-to-app-with-landing-zone/tree/main/custom-slz) directory. The custom-slz directory contains two
important files:
1.  The [override.tftpl](https://github.com/IBM/infra-to-app-with-landing-zone/blob/main/custom-slz/override.tftpl) file -- which is a copy of the json definition for our custom topology created in the previous step of this lab.
> In this lab, the file is a template file that contains the json definition, with one small addition: the file contains placeholders `${prefix}` that are replaced by an input variable at runtime to ensure that resource group names are unique in the account using the [templatefile](https://developer.hashicorp.com/terraform/language/functions/templatefile) function. This is necessary to ensure there is no clash in the resource group names from multiple attendees running the lab in the same IBM Cloud account.
2.  The [main.tf](https://github.com/IBM/infra-to-app-with-landing-zone/blob/main/custom-slz/main.tf) file which contains the terraform logic calling the landing zone module with the 'right' parameters. The logic is relatively minimal as it mainly delegates the effort to the landing zone module. Two noteworthy aspects:

    a.  The input named `override_json_string` takes the full json definition. In this example, the json passed to the module goes through the templatefile function first to 'inject' the prefix. It is done to ensure uniqueness of the resource group names in the account as indicated in step 1.

    b.  The source is set to the standard vsi pattern and pointing to the latest version at the time this lab was written (v4.4.4).

```hcl
module "landing_zone" {
  source           = "git::https://github.com/terraform-ibm-modules/terraform-ibm-landing-zone.git//patterns/vsi?ref=v4.4.4"
  prefix           = var.prefix
  region           = var.region
  ibmcloud_api_key = var.ibmcloud_api_key
  ssh_public_key   = var.ssh_key
  override_json_string = templatefile("./override.tftpl", { prefix = var.prefix })
}
```

To run the terraform module on your local environment:

1.  Clone the git repository locally with
    ```bash
    git clone https://github.com/IBM/infra-to-app-with-landing-zone
    ```

2.  Change directory into the custom-slz folder\
    ```bash
    cd infra-to-app-with-slz/custom-slz
    ```

3.  Create a new terraform workspace. You may replace "lab" with the
    name of your choice in the command below.
    ```bash
    terraform workspace new lab
    ```

4.  Generate a SSH key pair. This is the key pair that will be used to ssh to the VSIs created by this execution.
```
ssh-keygen -t rsa -b 4096 -N '' -f ./lab2-key-tf
```

5.  Export the IBM Cloud API Key that will be used by terraform for the execution. See [instructions](https://cloud.ibm.com/docs/account?topic=account-userapikey&interface=ui)
```
export TF_VAR_ibmcloud_api_key=<your API key>
``` 

6.  Generate a plan. The plan lists of resources that are going to be created.
    ```bash
    terraform plan --var=region=eu-gb -var=ssh-key="$(cat ./lab2-key-tf)" -var=prefix=lab-prefix
    ```

7.  (Optional) Execute the module with terraform apply.
> This step may take up to 15 minutes to complete. We recommend to skip it if you are short on time. The automation will be run through the catalog onboarding in a subsequent step of this lab.
    ```bash
    terraform apply --var=region=eu-gb -var=ssh-key="$(cat ./lab2-key-tf)" -var=prefix=lab-prefix
    ```