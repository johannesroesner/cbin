#!/bin/bash

# the script generates a default github repo out of your local folder
# requirements: authenticated github cli tool via ssh key
echo "Create new github repo based on local folder"
echo "############################################"

# argument check
if [[ $# -ne 3 ]]; then
    echo "Error: you need to provide 3 arguments: 1=name 2=public (true/false) 3=first commit message"
    exit 1
fi

# read arguments
REPOSITORY_NAME=$1
PUBLIC_FLAG=$2
FIRST_COMMIT_MESSAGE=$3
GITHUB_USER=$(gh api user | jq -r .login)
GITHUB_EMAIL=$(gh api \
    -H "Accept: application/vnd.github+json" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    /user/emails | jq -r '.[0].email')
REPOSITORY_URL="https://github.com/$GITHUB_USER/$REPOSITORY_NAME"

# create local git repo
git init
git config user.name "$GITHUB_USER"
git config user.email "$GITHUB_EMAIL"
echo "# $REPOSITORY_NAME" >>README.md
git add .
git commit -m "$FIRST_COMMIT_MESSAGE"

# create github repo based on local git repo
if [[ $PUBLIC_FLAG == "true" ]]; then
    gh repo create $REPOSITORY_NAME --add-readme --public --source=. --remote=upstream --push
elif [[ $PUBLIC_FLAG == "false" ]]; then
    gh repo create $REPOSITORY_NAME --add-readme --private --source=. --remote=upstream --push
else
    echo "Error: you need to provide true or false as second argument"
    exit 1
fi

#success
echo "############################################"
echo "Repository '$REPOSITORY_NAME' created and pushed successfully."
echo "Repository URL: $REPOSITORY_URL"