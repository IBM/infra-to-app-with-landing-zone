# Going further

## Automating onboarding of new versions to catalog

This lab focuses on onboarding the deployable architecture through the IBM Cloud catalog UI as a learning exercise.

It can be tedious to use the catalog UI to support the lifecycle of several deployable architectures as new versions are produced. You can automate the catalog onboarding steps with these starter scripts in the accompanying Git repository. The scripts build a pipeline that pushes new versions of a deployable architecture from GitHub or GitLab to the IBM Cloud catalog and trigger the catalog validation. The starter scripts are use GitHub actions and the tekton toolchain and are available at

?> _TODO_ add link to automation folder in our repo

## Using curated building blocks for your deployable architecture

The [IBM Cloud Terraform modules](https://github.com/terraform-ibm-modules) GitHub organization contains curated Terraform modules that you can use as building blocks in your solution to provision and configure some of the most common IBM Cloud services. The modules are designed to cover the most common uses cases and provide guidance and secure-by-default configurations (typically in the `profiles/fscloud` directory of the module).

The following list contains the modules that are actively maintained, supported, and kept current by IBM Cloud.

?> _TODO_ add link

If you need to create some IBM Cloud services in your solution, consider using these curated modules rather than coding against the IBM Cloud Terraform provider resources directly. The modules are higher level and can save you time, and they provide assurance that the configuration is tested and maintained by IBM.

## Best practices to implement deployable architectures

For recommendations and best practices about implementing quality Terraform modules, see the [terraform-ibm-modules](https://terraform-ibm-modules.github.io/documentation/#/implementation-guidelines) documentation. A [module template](https://github.com/terraform-ibm-modules/terraform-ibm-module-template) is also available that you can use to get started quickly creating your own module.

## Making a deployable architecture available in the IBM Cloud public catalog.

If you are a partner or vendor that is interested in making a deployable architecture available in the public IBM Cloud catalog, see [Selling on IBM Cloud](https://cloud.ibm.com/docs/sell?topic=sell-selling-clouds).
