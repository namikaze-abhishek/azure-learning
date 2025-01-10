#!/bin/bash

set -x

# i want to talk
I #https://medium.com/@dileepa.mabulage/deploying-a-node-js-app-to-azure-app-service-using-azure-devops-classic-editor-274298445da8
# Set the repository URL
REPO_URL="https://DsgIQpURkj92YWxeGTBAM0cWlf2tUJYCfqBmWviyYCVfxEoWDUJ7JQQJ99AKACAAAAAAAAAAAAASAZDOIOeN@dev.azure.com/abhishek13072000anand/_git/abhishek13072000anand"

# Clone the git repository into the /tmp directory
git clone "$REPO_URL" /tmp/temp_repo

# Navigate into the cloned repository directory
cd /tmp/temp_repo

# Make changes to the Kubernetes manifest file(s)
# For example, let's say you want to change the image tag in a deployment.yaml file
sed -i "s|image:.*|image: kings.azurecr.io/$2:$3|g" $1-deployment.yaml

#git

git config --global user.email "abhishek13072000anand@gmail.com"
git config --global user.name "abhishek13072000anand@gmail.com"

# Add the modified files
git add .

# Commit the changes
git commit -m "Update Kubernetes manifest"

# Push the changes back to the repository
git push

# Cleanup: remove the temporary directory
rm -rf /tmp/temp_repo
