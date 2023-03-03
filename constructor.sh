#!/bin/bash

# This program is for automating Ansible Project initialization and removal.

# Define the packages and folders required for Ansible Project.
PACKAGES=("docker" "terraform" "packer" "gcloud")
FOLDERS=("tasks" "handlers" "files" "vars" "defaults")

decorate() {
  eval "
    _inner_$(typeset -f "$1")
    $1"'() {
      echo >&2 "Calling function '"$1"' with $# arguments"
      _inner_'"$1"' "$@"
      local ret=$?
      echo >&2 "Function '"$1"' returned with exit status $ret"
      return "$ret"
    }'
}

# The function to create the directory structure required for Ansible Project.
create_directory_structure() {
  # Loop through all packages and folders and create the directory structure.
  for package in "${PACKAGES[@]}"; do
    for folder in "${FOLDERS[@]}"; do
      mkdir -p "roles/$package/$folder"
      touch "roles/$package/$folder/main.yml"
    done
  done
}

# The function to initialize the Ansible Project.
initialize_project() {
  echo "Creating Ansible Project..."
  touch playbook.yml
  create_directory_structure
}

# The function to remove the Ansible Project.
remove_project() {
  echo "Removing Ansible Project..."
  rm -f playbook.yml
  rm -rf roles/
}

# The main function to run the script.
main() {
  # Check the number of arguments passed to the script.
  if [ "$#" -ne 1 ]; then
    echo "You must provide one argument."
    exit 1
  fi

  # Check the argument provided and perform the relevant action.
  case $1 in
    init)
      initialize_project
      ;;
    purge)
      remove_project
      ;;
    *)
      echo "Enter a valid argument."
      exit 1
      ;;
  esac
}

decorate main
# Call the main function.
main "$@"
