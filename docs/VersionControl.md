# Source Code Version Control Tools

## Introduction
Version control is an indispensable part of modern-day software development because it enables tracking and reverting changes to source code and facilitates collaboration between developers. It facilitates collaboration by attributing changes to invidiual contributors, enabling change merging, and alerting the developers of merge conflicts.

## Version Control System
Git was chosen as the version control system because it is the most popular and standard version control software in use today. Moreover, it has complete integration with GitHub, which is essential for the deployment pipeline phase of this project as it utilizes GitHub Actions.

## Repository Setup
The repository is divided into four main subfolders:
- **.devcontainer** contains the devcontainer.json file which specifies and configures the container image to use for our development container. This ensures standardization and uniformity of the development environments across different development systems.
- **.github** contains the workflows subdirectory containing .yaml files that describe various stages of our deployment pipeline. These files utilize the GitHub Actions feature to define the steps to build, test, and deploy our application and the events that trigger those steps.
- **app** contains all the source code and assets used by our flutter application including test files that define the various tests that run on our application to ensure expected behavior.
- **docs** contains documentation files related to various aspects of the project.

The commit messages of this repository follow the convention of using imperative commit messages in the present tense such as "Update main.dart file". This is done to follow [best practices outlined by git](https://git.kernel.org/pub/scm/git/git.git/tree/Documentation/SubmittingPatches?h=v2.36.1#n181).

## Common Commands and Usage
Common git commands can be found [here](https://www.geeksforgeeks.org/git-cheat-sheet/#basic).

The workflow for making changes to this repository follows the  [GitHub flow](https://docs.github.com/en/get-started/using-github/github-flow).

## Collaboration Features
Version control tools facilitate collaboration among team members through the following features:

- **Pull Requests** provide a structured way to propose and review code changes before merging. In doing so, they encourage communication and feedback between team members.

- **Code Reviews** allow team members to review code changes, identify issues, and suggest improvements. They improve code quality and knowledge sharing within the team.

- **Conflict Resolution** detects and highlights conflicts when merging changes from different developers. This enables collaborative resolution of conflicts to maintain code integrity and prevent data loss.


## Challenges and Solutions
A challenge I faced while using the version control system was authenticating to push my local changes to the GitHub repository. I tried putting in my GitHub account password but it failed. After looking at the error messages, I learned that GitHub now uses a Personalized Access Token system to handle authentication. So, I went to my GitHub settings and generated a token. Putting the token in the password field for pushing changes solved my problem. 

## Conclusion
Integrating version control with my project using git allows me to easily track the changes I made to my repository. It also enables me to roll back to a previous known good state if the changes I make cause the system to break. This encourages experimentation and exploration as well. Furthermore, adding new contributors to the repository is made easier because of git's easy integration with GitHub which allows other users to clone the repository, make changes, and submit pull requests for their changes to be merged. 

Through working on this project, I learned the powerful integration of version control with deployment pipelines via GitHub Actions which listen for events such as a push to the main branch to then trigger various stages of the deployment pipeline such as build, test, and deploy. This enables me to see exactly which change I made caused the system to fail and modify those changes so that errors are fixed closer to when they are introduced.