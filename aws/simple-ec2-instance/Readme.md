> **Warning**  
> Hardcoding `Access key`, `Secret key` or any other sensitive info in terraform files are not recommend.

> **Note**  
> It is always recommended to use `required_providers` to specify the providers we are using, by default `source` refers to Hashicorp maintained [providers](https://registry.terraform.io/search/providers?namespace=hashicorp).

```hcl
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.33.0"
    }
  }
}

provider "aws" {
  # Configuration options
}
```

For other providers (not part of Hashicorp maintained) source section will vary and if not provided it will throw an error.

```hcl
terraform {
  required_providers {
    azuredevops = {
      source = "microsoft/azuredevops"
      version = "0.2.2"
    }
  }
}

provider "azuredevops" {
  # Configuration options
}
```
