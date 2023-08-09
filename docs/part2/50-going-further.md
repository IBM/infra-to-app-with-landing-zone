# Going further...

## Automating onboarding of new versions to catalog

This lab focuses on onboarding the deployable architecture through the
IBM Cloud Catalog UI as a learning exercise.

In order to scale, especially to support the full lifecycle as new
versions of the deployable architecture are produced, it is common to
automate the catalog onboarding steps as opposed to going through the
UI.

The accompanying git repository contains starter scripts that can be
leveraged to build a pipeline that automatically pushes new version of a
deployable architecture from GitHub or GitLab to the IBM Cloud Catalog
-- inclusive of triggering all of the validation steps. The starter kits
are provided as GitHub action and tekton toolchain located at \[TODO:
add link to automation folder in our repo \]

## Leveraging curated building blocks for your Deployable Architecture

The public organization <https://github.com/terraform-ibm-modules>
contains curated terraform modules that can be used as base building
blocks in your solution to provision and configure some of the most
common IBM Cloud service. The modules are designed to cover the most
common uses cases, as well as providing guidance and pre-wired
secure-by-default configuration (typically under the profiles/fscloud
directory in each module repository).

See in particular this list \[TODO -- add link\] which contains the
modules that are actively maintained, supported and kept current by the
IBM Cloud development organization.

Whenever you have a need to create some IBM Cloud services in your
solution, strongly consider using the curated modules as opposed to the
IBM Cloud terraform provider resources directly. The modules are higher
level, and will make you gain time, while getting the assurance that the
configuration is tested and maintained by IBM.

## Best practices to implement deployable architectures

\[ TODO \]

Terraform module best practices:
<https://terraform-ibm-modules.github.io/documentation/#/implementation-guidelines>

## Making a Deployable Architecture available in the IBM Cloud public catalog.

\[ TODO \]
