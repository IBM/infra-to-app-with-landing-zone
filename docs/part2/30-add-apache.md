# Add the Apache server deployment logic in the Terraform module

## Objective

This step adds the automation to deploy an Apache server on the three workload virtual servers.

To implement this automation, we use the built-in Terraform [remote-exec](https://developer.hashicorp.com/terraform/language/resources/provisioners/remote-exec) provisioner. The remote-exec provisioner connects to a remote resource and invokes a script on that computer.

We configure the remote-exec provisioner to run a script that installs the Apache server on a worker VSI. The remote-exec provisioner is configured to access the worker nodes through our management jump box that is publicly exposed. The same private SSH key is used to connect both to the jump box and to the worker VSIs.

![Diagram of the flow through the jump box to the workload VSIs](../images/part-2/media/image21.png)

## Steps

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

You can find the full logic in the [app-install](https://github.com/IBM/infra-to-app-with-landing-zone/tree/main/app-install) directory.

?> _TODO_ add steps
