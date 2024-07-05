# Ansible Project Manager

The Ansible Project Manager script is a utility tool designed to automate the initialization and removal of Ansible projects. It simplifies the setup process by creating a predefined directory structure and cleaning up projects with ease.

## Features

- **Automated Initialization**: Quickly set up a new Ansible project with a standard directory structure.
- **Easy Cleanup**: Remove an existing Ansible project and its directory structure with a single command.
- **Predefined Structure**: Creates a set of directories and files for `docker`, `terraform`, `packer`, and `gcloud` roles.
- **Ansible Installation**: Includes a script to easily set up Ansible on your system.

## Requirements

- Bash
- Ansible (for running the initialized projects)

## Getting Started

### Installation

No installation is required for the project manager itself. Simply download the `ansible-project-manager.sh` and `install-ansible.sh` scripts to your local machine.

To set up Ansible on your system, run the `install-ansible.sh` script:

```bash
./install-ansible.sh
```

This script adds the Ansible repository and installs the latest version of Ansible.

Usage
The script supports two main operations: initializing a new Ansible project and purging an existing one.

To initialize a new Ansible project, run:

```bash
./ansible-project-manager.sh init <project-name>
```

This command creates the necessary directory structure and files for the predefined packages (docker, terraform, packer, gcloud) under the roles directory.

To remove an existing Ansible project, run:
  
```bash
./ansible-project-manager.sh purge <project-name>
```

This command removes the project directory and its contents.

## Contributing

Contributions to the script are welcome. Please ensure that your contributions adhere to best practices and are well-documented.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
