### What is Terraform ?

It is an open source Infrastructure as Code (IAC) tool to automate and manage your infrastructure.

### Configuration Management vs Infrastructure Provisioning tool

| Configuration Management                                              | Infrastructure Provisioner                           |
| --------------------------------------------------------------------- | ---------------------------------------------------- |
| Primarily designed to install and manage software on existing servers | Primarily provisions the servers and infrastructures |
| Popular tools - Ansible, Chef and Salt stack                          | Popular tools - Terraform and Pulumi                 |

> **Note**
> Please look at the [index](Index.md) file for easier navigation and better overview of the project.

1. <details>
   <summary>What are the main commands available in Terraform ?</summary>
   <p>
    - **init** - To initialize a terraform files
    - **validate** - Checks wether tf files are syntactically valid
    - **plan** - Shows preview changes required by the current configuration
    - **apply** - Executes the plan by creating or updating infra
    - **destroy** - Deletes previously created resource
    - **refresh** - Queries infrastructure to get current state
    - **fmt** - Rewrites all Terraform configuration files to a canonical format. (Includes - `.tf` and `.tfvars` but not the `.tf.json` or `.tfvars.json`)
   </p>
   </details>

1. <details>
   <summary>What is the structure of the terraform file ?</summary>

   <p>

      **Syntax:**
      ```tf
      <block-name> <resource-type> <resource-name> {
          argument = value # could be an optional or mandatory argument
          argument = value
      }
      ```

      **Resource block:**
      ```tf
      resource "aw_iam_user" "admin-user" {
          name = "lucy"
          tags = {
            Description = "TL for the sapphire project"
          }
      } 
      ```

      **Data block:**
      ```tf
      data "aws_ami" "example" {
        most_recent = true

        owners = ["self"]
        tags = {
          Name   = "app-server"
          Tested = "true"
        }
      }
      ```
   </p>
   </details>

1. <details>
   <summary></summary>

   <p>

   </p>
   </details>

1. <details>
   <summary></summary>

   <p>

   </p>
   </details>
1. <details>
   <summary></summary>

   <p>

   </p>
   </details>

1. <details>
   <summary></summary>

   <p>

   </p>
   </details>

1. <details>
   <summary></summary>

   <p>

   </p>
   </details>

1. <details>
   <summary></summary>

   <p>

   </p>
   </details>

1. <details>
   <summary></summary>

   <p>

   </p>
   </details>

1. <details>
   <summary></summary>

   <p>

   </p>
   </details>

1. <details>
   <summary></summary>

   <p>

   </p>
   </details>

1. <details>
   <summary></summary>

   <p>

   </p>
   </details>

