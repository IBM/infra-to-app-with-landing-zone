# Lab Prerequisites :white_check_mark:

Make sure that you meet the following prerequisites before you begin the lab.

- IBM Cloud
    - An IBM Cloud Pay-Go or Subscription account
    - An IBMid

        :information_source: **Note**:  Participants in the TechXchange classroom will be provided with credentials to access an IBM Cloud account during the lab.
    - [API key with the following permissions](https://cloud.ibm.com/docs/account?topic=account-userapikey&interface=ui#create_user_key)

    | Service | Resources |  Role |
    | -------- | ------- | ------- |
    | IBM Cloud Projects | Aldministrator |
    | Activity Tracker event routing | All | Editor |
    | Transit Gateway | All | Editor, Manager |
    | Schematics | All | Editor, Manager |
    | Key Protect | All | Editor, KeyPurge, Manager |
    | Cloud Object Storage | All | Editor, Manager |
    | VPC Infrastructure Services | All | Editor, Manager |
    | Resource group only | All resource group in the account | Viewer, Editor, Administrator|

     :exclamation: **Important**: Participants in the TechXchange classroom will need to create an API key for their provided credentials.  Please save the generated API key for later use.

- A development computer with the following software.
    - [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
    - Text editor of your choice
    - Web browser
    - Tools to generate SSH key
        - Linux and Mac come with ssh-keygen.
        - Windows users can use [PuTTYgen](https://www.ssh.com/academy/ssh/putty/windows/puttygen)

        For more information, see [Generating an external SSH key](https://cloud.ibm.com/docs/vpc?topic=vpc-ssh-keys&interface=ui#generating-ssh-keys).
    - Optional: [IBM Cloud CLI](https://cloud.ibm.com/docs/cli?topic=cli-getting-started)

:information_source: **Note**:  Participants in the TechXchange classroom will be provided with a development VM with the prerequisite software installed.