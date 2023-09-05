# Lab Prerequisites ☑

Make sure that you meet the following prerequisites before you begin the lab.

## IBM Cloud

1.  An IBM Cloud Pay-Go or Subscription account (trial accounts are not sufficient)

    :information_source: **Note**:  Participants in the TechXchange lab will be provided with user credentials to access a paid IBM Cloud account for the duration of the lab.

2. A personal API Key associated with a user with the following permissions.

    :information_source: **Note**:  The user account provided in the TechXchange lab already has got the necessary permissions. Participants in the TechXchange lab only need to create an API Key as described below.


| Service | Resources |  Role |
| -------- | ------- | ------- |
| IBM Cloud Projects | All | Administrator |
| Activity Tracker event routing | All | Editor |
| Transit Gateway | All | Editor, Manager |
| Schematics | All | Editor, Manager |
| Key Protect | All | Editor, KeyPurge, Manager |
| Cloud Object Storage | All | Editor, Manager |
| VPC Infrastructure Services | All | Editor, Manager |
| Resource group only | All resource group in the account | Viewer, Editor, Administrator|
| Catalog Management | All | Editor, Publisher|


To create an API Key: \
    1. In the IBM Cloud console, in the navigation bar at the top of your screen, go to **Manage > Access (IAM) > API keys.** \
    2. Click **Create +**. \
    3. Enter a name, for example `<yourinitials> lab` and optionally a description for your API key. \
    4. Click **Create** \
    5. Then, click **Show** (the eye icon) to display the API key.

:exclamation: **Important**: Please save the generated API key for later use in the labs. The API key is only available to be copied or downloaded at the time of creation. If the API key is lost, you can re-create a new API key.

:information_source: **Note**:  In the TechXchange VM, you may open a text editor to paste the API Key for later use with the following terminal command:
```sh
gedit &
```

## Development environment

A development computer with the following software:
- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- Text editor of your choice
- Web browser
- Tools to generate SSH key
    - Linux and Mac come with ssh-keygen.
    - Windows users can use [PuTTYgen](https://www.ssh.com/academy/ssh/putty/windows/puttygen)
    - Optional: [IBM Cloud CLI](https://cloud.ibm.com/docs/cli?topic=cli-getting-started)

:information_source: **Note**:  Participants in the TechXchange classroom will be provided with a development VM with the prerequisite software installed. You may however decide to use your own machine for convenience.