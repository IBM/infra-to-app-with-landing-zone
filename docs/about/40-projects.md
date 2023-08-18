# IBM Cloud projects

IBM Cloud projects make it easy to manage Infrastructure-As-Code (IaC) deployments across accounts, collaborate with team members, and maintain compliance.

At its core, an IBM Cloud project is made up of a collection of configurations that are used to manage related Infrastructure as Code (IaC) deployments (and associated resources) across accounts.

For example, let’s imagine the scenario of a SRE team that is responsible for setting up the infrastructure that supports the web application. That SRE team wants to follow best practices and deploy the following environments, which are based on the same deployable architecture template (but with slight configuration differences for each environment):

1. A development environment: with scaled down compute resources and no audit event tracking.
2. A staging environment: as close as possible to the production environment
3. Two production environments: one in North America and another one in Europe.

That SRE team can group configurations, and thus centralize the governance and supervision, for the four different environments in one single Project.

Beyond the core configuration grouping capability, IBM Cloud projects is designed with an IaC and a compliance-first approach. Projects also seemingly integrates with IBM Cloud Schematics to deploy, update, and manage the resources that are created by the IaC automation.

Each project also includes tools to scan for potentially harmful resource changes, compliance, security, and cost issues, and to track configuration versioning and governance.

![IBM Cloud projects](../images/about-projects.png)
