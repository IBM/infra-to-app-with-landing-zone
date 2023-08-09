# Encapsulating the topology definition in a terraform module


## Objective

In this step, you will be executing a terraform module that automates
the creation of the custom landing zone topology defined in the json
file created in the [previous step](./10-customizing.md).

The objective is to provide a basic terraform module that can be easily
consumed to create the custom VPC topology. See this module as a level
of abstraction simplifying consumption: consumers of the module that we
will create here do not need to understand landing zone, or even the
json file containing the topology definition -- they can "just" run
terraform apply with a minimal number of inputs to get the full custom
VPC topology deployed in their account.

## Executing landing-zone with a json definition

The code for this step is located in the [custom-slz](https://github.com/IBM/infra-to-app-with-landing-zone/tree/main/custom-slz) directory. The custom-slz directory contains two
important files:
1.  The [override.tftpl](https://github.com/IBM/infra-to-app-with-landing-zone/blob/main/custom-slz/override.tftpl) file -- which is a copy of the json definition for
    our custom topology created in the previous step of this lab.
2.  The [main.tf](https://github.com/IBM/infra-to-app-with-landing-zone/blob/main/custom-slz/main.tf) file which contains the terraform logic calling the landing zone module with the 'right' parameters. The logic is relatively minimal as it mainly delegates the effort to the landing zone module. Two noteworthy aspects:

    a.  The input named "override_json_string" is set to true. This instructs the landing zone module to look for and use the override.json file in the same directory.

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

1.  Clone the git repository locally with\
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

4.  Execute the module with terraform apply.
    ```bash
    terraform apply --var=region=eu-gb -var=ssh-key="\$(cat pub
    key) -var=prefix=lab-prefix
    ```