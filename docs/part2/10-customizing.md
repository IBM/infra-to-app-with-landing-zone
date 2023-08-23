# Customizing the landing zone topology

## Ways to customize

The landing zone module is designed to enable both lightweight and deep customizations of the VPC topology, including all the services that are deployed to make the VPC topology compliant.

In a nutshell, you can customize the topology in two ways:

- By using Terraform input variables.

    The module accepts more than 70 input variables that you can use to tweak the VPC topology. Consider the input variables as "knobs" that you can turn to adjust the topology.
- By passing a JSON string value to the file `override.json` or through the module variable `override_json_string`.

    The override enables deeper and broader types of customizations. By using a JSON definition, you can fully customize aspects of the topology beyond what you can achieve with Terraform input variables.

## Defining our custom topology with a JSON definition

In this lab, you use the JSON override file to define a topology that matches the manual steps that you followed in the lab 1.

As a refresher, here's what you did in lab 1:

- Created a VPC-topology based on the standard SLZ pattern.
- Exposed one VSI in the management VPC through a public floating IP address (our "jump box").
- Exposed one VSI in the workload VPC behind a public load balancer.
- Made the necessary adjustments to the network ACL and security group to accommodate inbound and outbound traffic to the management jump box and the workload.

### Creating the JSON definition

You can create a JSON file that codifies the topology that you want in one of three ways. The following list orders the methods from least complex to most complex:

- Use the [secure landing zone wizard](https://slz-gui.15z7evpngrsf.us-south.codeengine.appdomain.cloud/) to produce a valid JSON file.

    The wizard also supports importing an existing JSON file and start from there.

    ![screenshot of the secure landing zone wizard](../images/part-2/cdbc891686d226024c1d5da0aef003a858508460.png)
- Customize the definition through a Terraform input variable.

    The landing zone module produces an output that is named `config`. The `config` output contains a JSON definition with all the customizations that are made through the Terraform input variables. You can start with this output and make more customizations, either manually or through the wizard in the previous method.
- The third way is to start from a copy of the JSON definition in one of the four [patterns](https://github.com/terraform-ibm-modules/terraform-ibm-landing-zone/tree/main/patterns) that are provided with the landing zone module.

    For example, the JSON file for the standard VSI-based landing zone is located under the [vsi](https://github.com/terraform-ibm-modules/terraform-ibm-landing-zone/blob/main/patterns/vsi/override.json) directory. You can customize a copy of that JSON pattern file either manually or through the wizard.

### Creating the JSON definition

For this lab, use the customized JSON file at https://github.com/IBM/infra-to-app-with-landing-zone/blob/main/custom-slz/override.tftpl.
