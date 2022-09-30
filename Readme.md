### What is Terraform ?

It is an open source Infrastructure as Code (IAC) tool to automate and manage your infrastructure.

### Configuration Management vs Infrastructure Provisioning tool

| Configuration Management                                              | Infrastructure Provisioner                           |
| --------------------------------------------------------------------- | ---------------------------------------------------- |
| Primarily designed to install and manage software on existing servers | Primarily provisions the servers and infrastructures |
| Popular tools - Ansible, Chef and Salt stack                          | Popular tools - Terraform and Pulumi                 |

### What are the main commands available in Terraform ?

- init - To initialize a terraform files
- refresh - Queries infrastructure to get current state
- plan - Shows preview changes required by the current configuration
- apply - Executes the plan by creating or updating infra
- destroy - Deletes previously created resources
