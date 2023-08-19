# Add the Apache server deployment logic in the terraform module

## Objective

This step adds the automation to deploy an Apache Server on the three
workload virtual servers.

In order to implement this automation, we leverage the native terraform
[remote-exec](https://developer.hashicorp.com/terraform/language/resources/provisioners/remote-exec) provisioner. In short, the remote-exec provisioner connects to a
remote resource and invokes a script on that machine.

In this step, we configure the remote-exec provisioner to run a script
that installs Apache server all VSIs in the workload VPC ("worker VSIs"). The remote-exec provisioner
is configured to access the worker nodes through our management jump box
that is publicly exposed through a floating IP. The same private ssh key is used in this
example to connect to the jump box and to the worker VSIs.

![](../images/part-2/media/image21.png)

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

The full logic is located [here](https://github.com/IBM/infra-to-app-with-landing-zone/tree/main/app-install).

[ TODO - steps]