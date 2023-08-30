# Exposing the web application to the internet

In this part of the lab, you expose the web pages to the internet through a VPC load balancer so that anyone can access them.

1.  Create a public load balancer to expose the web application.
    1. Access the [Load balancers for VPC](https://cloud.ibm.com/vpc-ext/network/loadBalancers) page.
    1. Click **Create**.
1.  Specify the following settings for the load balancer:
    - Load balancer type: Application Load Balancer (ALB)
    - Location: Location that you provision your VPC resources
    - Details:
        - Name: `<your_initials>-web-lb`
        - Virtual private cloud: `<your_initials>-workload-vpc`
        - Type: `Public`
        - DNS type: `Public`
        - Subnets: `<your_initials>-workload-vsi-zone-1`
    - Backend pool:
        - Name: `<your_initials>-backend-pool`
        - Pool protocol: `HTTP`
        - Health Port: `80`
    - Click **Attach server +** in the Back-end pools section and add the VSI that is in the subnet `<your_initials>-workload-vsi-zone-1` with a server port of `80`.
    - Create a front-end listener by clicking **Create listener** and set the Listener port to `80`.
    - Under the _Security Group_ section, clear all settings except the one labeled `<your_initials>-workload`.
    - Click **Create load balancer**.
1.  Allow access to the load balancer by adding the following inbound rule to the [security group](https://cloud.ibm.com/vpc-ext/network/securityGroups) called `<your_initials>-workload` that the load balancer is attached.

      ![Inbound security group rule](../images/part-1/40-sg.png ':size=60%')

1. Allow internet access to the load balancer by adding the following rules to the [Access control list](https://cloud.ibm.com/vpc-ext/network/acl) for the ACL `<your_initials>-workload-acl`.
    - Create an inbound rule

        ![ACL inbound rule](../images/part-1/40-acl-inbound.png ':size=60%')

    - Create an outbound rule

        ![ACL outbound rule](../images/part-1/40-acl-outbound.png ':size=60%')

    :information_source: **Tip**: It can take several minutes for your load balancer to provision. Wait until the status is set to `Active` in [Load balancers for VPC](https://cloud.ibm.com/vpc-ext/network/loadBalancers). You might need to refresh the page periodically.

1. Complete these steps after your web application is exposed:
    1. Retrieve the FQDN of your load balancer:
        1. [Access the Load Balancer list](https://cloud.ibm.com/vpc-ext/network/loadBalancers) and click your provisioned load balancer.
        1. Copy the value under `Hostname`.
    1. On your computer, open a web browser and point it to `http://<hostname of your load balancer>`. You can also test connectivity by issuing the following curl command:

        ```sh
        curl http://<Hostname of your load balancer>
        ```
