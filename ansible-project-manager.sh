#!/usr/bin/env bash

# This program automates Ansible Project initialization and removal.

set -euo pipefail

# Define the packages and folders required for Ansible Project.
PACKAGES=("docker" "terraform" "packer" "gcloud")
FOLDERS=("tasks" "handlers" "files" "vars" "defaults")

# Function to create the directory structure required for Ansible Project.
create_directory_structure() {
    echo "Creating directory structure..."
    for package in "${PACKAGES[@]}"; do
        for folder in "${FOLDERS[@]}"; do
            mkdir -p "roles/$package/$folder"
            : > "roles/$package/$folder/main.yml"
        done
    done
}

# Function to initialize the Ansible Project.
initialize_project() {
    echo "Initializing Ansible Project..."
    : > playbook.yml
    create_directory_structure
    echo "Ansible Project initialized successfully."
}

# Function to remove the Ansible Project.
remove_project() {
    echo "Removing Ansible Project..."
    rm -f playbook.yml
    if [[ -d roles ]]; then
        rm -rf roles/
        echo "Ansible Project removed successfully."
    else
        echo "No existing project found. Nothing to remove."
    fi
}

# Function to display usage information.
usage() {
    cat << EOF
Usage: $0 [init|purge]
  init  - Initialize a new Ansible Project
  purge - Remove an existing Ansible Project
EOF
}

# Main function to run the script.
main() {
    if [[ $# -ne 1 ]]; then
        usage
        exit 1
    fi

    case $1 in
        init)
            initialize_project
            ;;
        purge)
            remove_project
            ;;
        *)
            echo "Error: Invalid argument."
            usage
            exit 1
            ;;
    esac
}

# Call the main function.
main "$@"
