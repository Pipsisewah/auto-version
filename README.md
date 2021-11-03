## Semantic Versioning
### How this library works
Enforces semantic auto versioning when commits are committed to or merged into main

Auto versioning is based on commit message types

Format: `````<type>: message`````

Commit Lint is used to enforce commit message format

This library is configured to work with GitHub Actions and will automatically complete the following actions when pushed to main
- Create / update the CHANGELOG with new version and commit messages
- Update package.json with new version
- Create a git tag it GitHub
- Create a Release in GitHub and add commit messages to the release


### On Installation
Required libraries are installed and default library configurations are copied to your project

### Library Customization
#### Commit Lint
You can modify the commitlint.config.js file to customize how the library works

You are welcome to change the message types but you should ensure both commit lint and semantic release are aligned or your commits may not trigger a new version

#### Semantic Release
You may edit the .releaserc file to customize the semantic release library

You may edit the message types and which release versions are triggered from these commits but ensure you coordinate any changes with your commit lint configuration