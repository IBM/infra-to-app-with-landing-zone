# Add the Apache server deployment logic in the Terraform module

## Objective

This step adds the automation to deploy an Apache server on the three workload virtual servers.

To implement this automation, we use the built-in Terraform [remote-exec](https://developer.hashicorp.com/terraform/language/resources/provisioners/remote-exec) provisioner. The remote-exec provisioner connects to a remote resource and invokes a script on that computer.

We configure the remote-exec provisioner to run a script that installs the Apache server on a worker VSI. The remote-exec provisioner is configured to access the worker nodes through our management jump box that is publicly exposed. The same private SSH key is used to connect both to the jump box and to the worker VSIs.

![Diagram of the flow through the jump box to the workload VSIs](../images/part-2/media/image21.png)

## Execute the Apache deployment logic 

You can find the code for this step in the [app-install](https://github.com/IBM/infra-to-app-with-landing-zone/tree/main/app-install) directory. The directory contains the following important files:

- The [main.tf](https://github.com/IBM/infra-to-app-with-landing-zone/blob/main/app-install/main.tf) file which contains the terraform logic calling the remote-exec provisioner with the ‘right’ parameters.
   
    Notice the following settings in the `main.tf` file:

    - In the connection block, the `bastion_host` is set to the management server floating IP address that you will use as a jump host to connect to the workload server.
    - In the connection block, the `host` is set to the IP address of the workload server.
    - In the provisioner block, a list of the commands that will be executed on the workload server are listed.

    ```hcl
    resource "null_resource" "application-install" {
      count = var.number_vsi_workload
      connection {
        type         = "ssh"
        user         = "root"
        bastion_host = var.floating_ip_address
        host         = local.workload_ip_list[count.index]
        private_key  = var.ssh_private_key
        agent        = false
        timeout      = "15m"
      }

      provisioner "remote-exec" {
        inline = [
          "apt-get install apache2 -y"
        ]
      }
    }
    ```

To run the Terraform module in your local environment, follow these steps.

1.  Clone the repository locally with the following Git command, unless you cloned it in the previous step ([Executing the landing zone with a JSON definition](#/./part2/20-custom-module?id=executing-the-landing-zone-with-a-json-definition)):

    ```sh
    git clone https://github.com/IBM/infra-to-app-with-landing-zone
    ```

2.  Change to the `app-install` folder

    ```sh
    cd infra-to-app-with-slz/app-install
    ```

3.  Create a Terraform workspace. Replace `lab` with your own name in the following command.

    ```sh
    terraform workspace new lab
    ```

    Note: If you receive the error `Workspace "..." already exists`, issue the command:
    
    ```sh
    terraform workspace select lab
    ```

4.  Export the IBM Cloud API key that the Terraform will use for the execution. For instructions, see [Managing user API keys](https://cloud.ibm.com/docs/account?topic=account-userapikey&interface=ui).

    ```sh
    export TF_VAR_ibmcloud_api_key=<your API key>
    ```

6.  Generate a plan. The plan lists of resources that are going to be created.

    ```sh
    terraform plan --var=region=eu-gb -var=ssh_private_key="$(cat ./lab2-key-tf)" -var=floating_ip_address=<The floating point IP address of the jump box> -var=vpc_id=<ID of the workload VPC>
    ```

7.  (Optional) Apply the changes.

    ```sh
    terraform apply --var=region=eu-gb -var=ssh_private_key="$(cat ./lab2-key-tf)" -var=floating_ip_address=<The floating point IP address of the jump box> -var=vpc_id=<ID of the workload VPC>
    ```