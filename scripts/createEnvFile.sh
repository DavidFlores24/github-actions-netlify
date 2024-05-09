#!/bin/bash
echo -e "\nCreating env file based on CircleCI variables"

touch .env
echo "
  NETLIFY_API_TOKEN: '${NETLIFY_API_TOKEN}',
" > .env

echo "Successfully created env file"