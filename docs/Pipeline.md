## CI/CD Pipeline Environement
My continuous integration pipeline starts at the development machine where my repository is cloned and my flutter application is being worked on. To ensure a consistent development environment complete with all the dependencies required to develop a flutter web application, the Dev Containers extension in Visual Studio Code is used in tandem with Docker. A devcontainer.json file specifies that the development environment be created on a Ubuntu:Jammy base container which is modified for flutter appilcation development. Hence, the development machine can be running any operating system.

When changes are made to the source code and it is pushed to the remote repository hosted on GitHub, a build and deploy GitHub workflow is triggered that runs on a runner machine provided by GitHub. A yaml file inside the .github/workflows folder in the repository specifies which linux distibution to use for building and deploying the appilcation, which in this case is Ubuntu:latest, the same linux distribution used for our development environment. The relevant assets from the build are pushed to the gh-pages branch which is then used as the root directory for serving the web page through GitHub Pages, a service provided by GitHub to host static websites for free.

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

## Automation Process
The CI/CD pipeline automation process currently starts as soon as a change is pushed to the main branch of the project repository. There, a workflow defined in a yaml file is triggered which first uses a pre-defined action to clone the repository on a runner machine provided by GitHub and then uses another such action to install Flutter onto that machine.

After that, flutter commands are run that install the necessary dependencies on the runner and then another flutter command builds the application for the web.

The result of this build is stored in the /app/build/web folder which is specified as the publish directory for a pre-defined GitHub action that deploys the contents of that folder into the gh-pages branch of the repository, replacing all the contents of that repository. 

The push then triggers another workflow defined by GitHub that deploys the website, serving the contents of the gh-pages branch as a webpage accessible to all via a url.

In this way, code travels from a developer's machine to a production build of the software automatically through my CI/CD Pipeline.