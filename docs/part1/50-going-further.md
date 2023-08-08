# Going further.....

In the interest of simplicity, as a gently introduction, this lab gives operator access through a VSI jumpbox in management and expose directly the application through public load-balancer attached to the worker VPC.

Whilst this approach provides a reasonable level of security and checks a number of compliance controls, and may be sufficient for a number of industries and enterprises, these sections describe a number of aspects to consider to enhance secure and compliance posture, including links to relevant documentation.

## Operator access

There are a more secure options for providing network connectivity to the management VPCs:

- A Client-To-Site VPN, whereby the operator has a VPN client on their environment that connect to a VPN server running the management VPC. IBM Cloud provides [a client-to-site VPN solution](https://cloud.ibm.com/docs/vpc?topic=vpc-vpn-client-to-site-overview) out-of-the-box that can be leveraged for this purpose. An [example of automation deploying a client-to-site gateway in a landing-zone management VPC](https://github.com/terraform-ibm-modules/terraform-ibm-client-to-site-vpn/tree/main/extensions/landing-zone).
  ![client-to-site vpn](../images/part-1/50-c2s.png)
- A [site-to-site VPN](https://cloud.ibm.com/docs/vpc?topic=vpc-using-vpn), to connect the management VPC to another private network. The landing-zone Deployable Architecture pre-creates a site-to-site gateway for this purpose.
- Direct Link – extends an organization data center network. See [here](https://cloud.ibm.com/docs/framework-financial-services?topic=framework-financial-services-vpc-architecture-connectivity-management) as a starting point for further details.

From a compliance perspective, it is recommended to record all interactive operator actions. For doing so, a bastion solution is required. Operator connect through the bastion, which record all interactive session action for auditing purposes. The IBM cloud Framework for Financial Services has got more [details](https://cloud.ibm.com/docs/framework-financial-services?topic=framework-financial-services-vpc-architecture-connectivity-bastion), and well as a tutorial to set up a bastion solution leveraging the 3rd party solution Teleport [here](https://cloud.ibm.com/docs/framework-financial-services?topic=framework-financial-services-vpc-architecture-connectivity-bastion-tutorial-teleport).

## Exposing the web application to the internet

In the lab, the workload is exposed through a public VPC load balancer attached to the workload VPC. There are a few additions that can be made to make the solution more secure:

1. Introduce a web application firewall in the flow. This can be done in two ways:

- As-a-service - typically done through adding a global load balancer, such as IBM Cloud CIS or Akamai in front of the VPC load balancer, and adding a network ACL on the VPC load balancer to accept inbound traffic only from the global load balancer set of known IPs
- Hosted – this can be achieved with 3rd party solution such as BigIP F5. This solution is deployed and hosted on machines that you run – for instance in VSIs in the landing-zone VPC topology. See [here](https://cloud.ibm.com/docs/framework-financial-services?topic=framework-financial-services-vpc-architecture-connectivity-waf-tutorial) for a tutorial.

2. Create the public VPC load balancer in a separate ‘edge’ VPC. Route the traffic from the ‘edge’ VPC to the application running on the ‘workload’ VPC through a private load balancer (routable only from within the VPC topology). This approach ensures that there are no direct public network flows to the workload VPC. See this [page](https://cloud.ibm.com/docs/framework-financial-services?topic=framework-financial-services-vpc-architecture-connectivity-workload#consumer-provider-public-internet) for more details.
