## Introduction
CI/CD (Continuous Integration/Continuous Delivery) pipelines are crucial components in modern software development workflows. CI is the practice of frequently integrating code changes from multiple developers into a shared repository. This process involves automatically running tests and checks to ensure that new code integrates smoothly with the existing codebase. Key elements of CI include automated builds, code quality checks, and unit testing. Developers commit their changes to the shared repository frequently, triggering the CI pipeline to run tests and checks. CD extends CI by automating the delivery process, making it possible to deploy code changes to production or staging environments quickly and consistently. CD pipelines typically include steps such as automated deployment, integration testing, user acceptance testing (UAT), and even production deployment if the tests pass successfully.

### Significance in Modern Software Development:
- Faster Release Cycles: CI/CD pipelines enable teams to release updates and new features rapidly and frequently, reducing time-to-market and keeping pace with customer demands.
- Higher Quality Software: Automated testing and continuous feedback loops help catch bugs and issues early in the development process, leading to higher quality software.
- Consistency and Reliability: Automation ensures that deployments are consistent and repeatable, reducing human errors and ensuring reliable software delivery.
- Collaboration and Efficiency: CI/CD encourages collaboration among team members by providing a streamlined and automated process for integrating, testing, and deploying code changes.
- Feedback Loops: CI/CD pipelines provide immediate feedback to developers about the quality and functionality of their code, facilitating rapid iteration and improvement.

Overall, CI/CD pipelines are fundamental to modern software development practices as they enable teams to deliver high-quality software efficiently, reliably, and with shorter release cycles.

## Development Environment
To ensure a standardized development environment across different machines, the Nix package manager is used. Nix is a declarative package manager for unix-like operating systems. It has several benefits over using Docker + VS Code:
- Nix is just a package manager and thus, does not require containers to be spun up. It merely installs the specified packages on a given system. Resultantly, it is exponentially more light-weight than using Docker which is very resource intensive.
- Nix frees the developers up to use any IDE or Code Editor to develop their application as it is not tied to a specific Code Editor like VS Code as opposed to DevContainers which only exists as an extension to VSCode. 
- Nix provides the most number of packages out of any other package manager. As a result, it is guarranteed that the dependencies required for developing a certain application will be met by using Nix. At the moment, Nixpkgs has over 110,000 packages compared to a mainstream package repository like Ubuntu's which has about 37,000 packages.

### Setup Instructions
The Nix package manager can be installed on the host system on Linux and Mac but requires Windows Subsystem for Linux (WSL) to be installed on Windows. Installation instructions for WSL can be found here: https://learn.microsoft.com/en-us/windows/wsl/install

Installation instructions for Nix on Linux, Mac, and WSL: https://nixos.org/download/

After installing Nix, follow the following instructions to enter a shell environment with all the required dependencies for Flutter development installed:
1. Ensure git is installed on your system.
2. Clone this repository using the following command in a terminal emulator:
```
   git clone https://github.com/RajwolChapagain/Flutter-Application.git
```
3. Enter the project folder using the following command:
```
   cd Flutter-Application
```
4. Enter the development shell environment using the following command:
```
    nix-shell flutter.nix
```
Initial setup may take a minute or two but after it completes, your shell prompt will change and start with [nix-shell]. This indicates that you've successfully entered the development shell environment. Next, you can run ```flutter doctor``` to ensure that you have flutter and its dependencies installed. From here, you can open up any IDE or code editor that you like. For example, to open Visual Studio Code if it is installed on your system, enter ```code``` in the terminal and install necessary extensions for ease of development. To exit the development environment, enter ```exit``` in the terminal emulator.

## Source Code Version Control Tools

### Version Control System
Git was chosen as the version control system because it is the most popular and standard version control software in use today. Moreover, it has complete integration with GitHub, which is essential for the integration and deployment pipeline phase of this project as it utilizes GitHub Actions.

### Repository Setup
The repository is divided into four main subfolders:
- **.devcontainer** contains the devcontainer.json file which specifies and configures the container image to use for our development container. This ensures standardization and uniformity of the development environments across different development systems.
- **.github** contains the workflows subdirectory containing .yaml files that describe various stages of our deployment pipeline. These files utilize the GitHub Actions feature to define the steps to build, test, and deploy our application and the events that trigger those steps.
- **app** contains all the source code and assets used by our flutter application including test files that define the various tests that run on our application to ensure expected behavior.
- **docs** contains documentation files related to various aspects of the project.

The commit messages of this repository follow the convention of using imperative commit messages in the present tense such as "Update main.dart file". This is done to follow [best practices outlined by git](https://git.kernel.org/pub/scm/git/git.git/tree/Documentation/SubmittingPatches?h=v2.36.1#n181).

### Common Commands and Usage
Common git commands can be found [here](https://www.geeksforgeeks.org/git-cheat-sheet/#basic).

The workflow for making changes to this repository follows the  [GitHub flow](https://docs.github.com/en/get-started/using-github/github-flow).

### Collaboration Features
Version control tools facilitate collaboration among team members through the following features:

- **Pull Requests** provide a structured way to propose and review code changes before merging. In doing so, they encourage communication and feedback between team members.

- **Code Reviews** allow team members to review code changes, identify issues, and suggest improvements. They improve code quality and knowledge sharing within the team.

- **Conflict Resolution** detects and highlights conflicts when merging changes from different developers. This enables collaborative resolution of conflicts to maintain code integrity and prevent data loss.

## CI/CD Pipeline Environement
My continuous integration pipeline starts at the development machine where my repository is cloned and my flutter application is being worked on. To ensure a consistent development environment complete with all the dependencies required to develop a flutter web application, the Nix package manager is used. A flutter.nix file specifies all the dependencies required for flutter appilcation development. Hence, the development machine can be running any operating system.

When changes are made to the source code and it is pushed to the remote repository hosted on GitHub, a build and deploy GitHub workflow is triggered that runs on a runner machine provided by GitHub. A yaml file inside the .github/workflows folder in the repository specifies which linux distibution to use for building, testing, and deploying the appilcation, which in this case is Ubuntu:latest, the same linux distribution used for our development environment. The relevant assets from the build are pushed to the gh-pages branch which is then used as the root directory for serving the web page through GitHub Pages, a service provided by GitHub to host static websites for free.

## CI/CD Pipeline Tools
GitHub Actions is used as the tool for implementing my CI/CD pipeline for several reasons:
- **Integration with GitHub**: GitHub Actions is tightly integrated with GitHub repositories, where my project is hosted, making it convenient to set up and manage CI/CD workflows directly within the GitHub platform. This integration reduces the need for external services or additional configurations.

- **Ease of Use**: GitHub Actions provides a user-friendly interface for creating and customizing CI/CD workflows using YAML files. Its visual editor also simplifies the process of defining workflows, making it accessible for beginners like myself.

- **Workflow Automation**: GitHub Actions allows for automation of various development tasks such as building, testing, and deploying code. This automation helps streamline the development process, improve code quality, and accelerate the delivery of software updates.

- **Extensive Marketplace**: GitHub Actions has a marketplace with a wide range of pre-built actions that can be easily integrated into workflows. These actions cover common development tasks and services, saving time and effort in implementing CI/CD pipelines. In my project, I've already utilized several such actions to automatically clone my repository on the runner, install Flutter and deploy the build assets to a target branch.

While GitHub Actions offers numerous benefits, it also has some limitations:

- **Resource Limitations**: GitHub Actions imposes resource limitations on usage, including limits on concurrent workflows, workflow execution time, and available storage for artifacts.

- **Third-Party Integration Limitations**: Although GitHub Actions has a marketplace with many pre-built actions, some integrations or services may not be directly supported. For such cases, custom actions or scripts will need to be developed which can take up a lot of time.

- **Limited Self-Hosted Runners**: GitHub Actions offers self-hosted runners for executing workflows on custom infrastructure. However, the number of self-hosted runners and their capacity is limited by the GitHub plan that a user is subscibed to.

- **Cost Considerations**: While GitHub Actions provides free usage for public repositories and a certain amount of free workflow minutes for private repositories, additional usage beyond these limits may incur costs.


## Deployment Environment
My application is deployed using the GitHub Pages feature. After the code passes the build phase and tests, a pre-defined GitHub action by peaceiris handles the deployment of the application. Under the hood, it takes the contents of the ./app/build/web directory, which are a product of building the application for the web, and pushes them to a special branch in the repository called gh-pages. This then triggers GitHub's in-built page-deployment workflows that then serves the contents of the gh-pages branch in the following url: https://rajwolchapagain.github.io/Flutter-Application/. The server machine is an abstracted implementation; the site is being served using GitHub's machines but the details of what kind of machine it is being served from is abstracted.

## Flutter Web Application

### Overview, Functionality and Future Plans
The application being developed is based on the default Flutter application template where a button can be clicked to increment a number in the center of the screen. Expansion plans for the application include gamefying the application by providing the user with a goal for number of clicks to reach and integrating a shop system where accrued clicks can be traded for tools like double clicks, auto-clicks, et cetera, essentially turning the application into a clicker game.

### Testing
The application is tested through a widget_test.dart file which launches the application, checks to see if the click counter starts at 0, taps the increment button, and checks if the text changed from 0 to 1. If it observees the expected functionality, the test passes, otherwise it fails.

### Deployment via CI/CD Pipeline
Details of how changes in source code make their way from the developer's machine to the deployed website are explained in the [CI/CD Pipeline Envrionment Section](#cicd-pipeline-environement)

### Challenges
I encountered several issues while trying to develop and deploy this application such as flutter not having proper permissions to run in the initial DevContainer setup, build artifacts not being uploaded to the gh-pages branch, and deployed website displaying a blank screen. I fixed most of the errors by paying careful attention to error messages and fulfilling the conditions being demanded by them. For instance, when I saw that ```flutter run -d web-server``` was failing with the error message that flutter didn't have permissions to a specific directory, I changed the permissions of that directory using the chmod command and the issue was fixed.

However, I sought my instructor's help on one issue about the deployed website not displaying anything despite the build passing the test after trying to problem-solve for several hours. Since there were no obvious error messages to be observed, I was stumped and felt it best to ask for help when needed.

## Conclusion
Overall, I learned a tremendous amount about development environment standardization and CI/CD pipelines and their significance for modern software development through this project. I gained the practical ability of standardizing a development environment for application development and assembling a CI/CD pipeline from scratch. Moreover, I gained hand-on experience with specific tools and technologies used for application development and deployment like Docker, Flutter, Git, GitHub, GitHub Actions, et cetera. 

More broadly, I honed my problem-solving and debugging skills by being thrown into something that I was completely unfamiliar with and mastering it gradually through a combination of independent research and guidance from the instructor.

The challenges faced while working on this project are detailed in the [Challenges](#challenges) subsection of Flutter Web Appilcation section and potential improvements to the application are discussed in the [Overview, Functionality, and Future Plans](#overview-functionality-and-future-plans) subsection of the same section. Potential improvements to the CI/CD pipeline includes the following enhancements:
- Separating the build and deployment phases into individual workflow files for modularity and efficiency. An artifact upload-and-download approach will be required to eliminate redundant builds in the build and deploy phases.
- Exploring the use of light-weight Linux distributions like Alpine Linux as opposed to the current Ubuntu Linux for GitHub runners in order to increase speed of workflow execution.
- Implementing an automated code coverage report using tools like lcov to ensure the effectiveness of tests and increase security and reliability of the application.
- Stopping changes to files that don't affect source code such as MarkDown files from trigerring the build and deploy workflow to eliminate redundant build and deployment.
- Implementing a custom deployment solution instead of deploying via GitHub Pages to accomodate the application expansion plans for saving number of user clicks to an external database.