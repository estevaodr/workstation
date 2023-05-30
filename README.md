# Workstation Setup with Ansible

This repository contains an Ansible configuration for setting up a Mac from scratch. Its primary purpose is setting up a new Mac from scratch, but I endeavor to also use it for adding new software as I go so that it remains up to date. At the moment, it's being used for setting up Intel based Macs running macOS Ventura.

## Installation

To use this Ansible code, you need to have Ansible installed on your system. If you don't have it, you can follow the official Ansible installation guide at [ansible.com/installation](https://ansible.com/installation).

There's a simple shell script in bin/bootstrap.sh which will perform the initial steps of:

- Installing Xcode
- Installing Ansible
- Fetching required Ansible roles and collections
- And then runs the main playbook main.yml.

The main playbook is built using the tag strategy, so you can use the tags inside the main playbook to execute parts of code separated like this example:

```shell
ansible-playbook -i "localhost" -c local -t packages  main.yml --ask-become-pass
```

## What's installed
The easiest way to understand what's installed is to read the contents of folders roles/zsh, roles/packages, roles/zsh, this configuration is fairly specific to the range of DevOps I do personally, but may serve as a useful starting point for others. The core components are:

- ZSH + Oh My Zsh as the primary shell
- Homebrew for package management
- ASDF for version management (along with plugins and default versions for Golang, Terraform, Terragrunt and Kind Cluster)
- Virtualbox, Vagrant, Docker
- VSCode, Sublime 
- Lots of other tools and utilities
