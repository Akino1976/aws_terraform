# aws_terraform

## Terraform by version
Install via Homebrew

  ```console
  $ brew install tfenv
  $ tfenv use 0.13.5
  ```
### tfenv install [version]

Install a specific version of Terraform.

If no parameter is passed, the version to use is resolved automatically via .terraform-version files, defaulting to 'latest' if none are found.

If a parameter is passed, available options:

- `i.j.k` exact version to install
- `latest` is a syntax to install latest version
- `latest:<regex>` is a syntax to install latest version matching regex (used by grep -e)
- `min-required` is a syntax to recursively scan your Terraform files to detect which version is minimally required. See [required_version](https://www.terraform.io/docs/configuration/terraform.html) docs. Also [see min-required](#min-required) section below.

```console
$ tfenv install
$ tfenv install 0.7.0
$ tfenv install latest
$ tfenv install latest:^0.8
$ tfenv install min-required
```
