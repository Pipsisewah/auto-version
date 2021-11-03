#!/usr/bin/env bash
echo 'Configuring Installation'

create_commit_message_configuration() {
  pwd
  FILENAME=".husky/commit-msg";
  > $FILENAME;
  echo "#!/bin/sh" >> $FILENAME;
  echo '. "$(dirname "$0")/_/husky.sh\"' >> $FILENAME;
  echo "npx --no-install commitlint --edit " >> $FILENAME;
}

if [ ! -d "../../node_modules" ]; then
  echo "Not installed as a dependency";
  npx husky install
  create_commit_message_configuration
  exit 0;
fi

# Copy default commitlint config if it does not already exist
echo "Creating default commitlint.config.js file"
cp -n commitlint.config.js ../../commitlint.config.js

# Copy default semantic release config if it does not already exist
echo "Creating default .releaserc file"
cp -n .releaserc ../../.releaserc

# Copy default semantic release config if it does not already exist
echo "Creating default release workflow file"
cp -n -R .github ../../.github

cd ../..
npx husky install
create_commit_message_configuration
