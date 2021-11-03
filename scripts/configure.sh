#!/usr/bin/env bash
echo 'Configuring Installation'

if [ ! -d "../../node_modules" ]; then
  echo "Not installed as a dependency";
  npx husky install
  npx husky set .husky/commit-msg 'npx --no-install commitlint --edit $1'
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
npx husky set .husky/commit-msg 'npx --no-install commitlint --edit $1'
