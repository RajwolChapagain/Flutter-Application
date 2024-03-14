# DevContainer Environment

## Introduction

"DevContainer" stands for Development Container. The Development part signifies that it is used for developing software and the Container part indicates that it utilizes Containerization technology. 

Containerization is a technology which allows the bundling of an application with all of its dependencies including the required Operating System. This ensures that a containerized application will run on any platform since all the dependencies it needs to run come bundled with the application.

This concept can not only be applied to the deployment but also to the development of software. A containerized development environment is simply a container which contains all the tools required to develop software. In our case, it is a container with all the tools (like flutter) required to develop a flutter application. 

The benefits of such a development container are numerous:

- It makes setting up development environments on new machines trivially easy since you don't have to install all the tools required to get started with development manually. Instead, a specification file like our devcontainer.json can be used to reproduce a known good development environment in the form of a container.
-   It ensures that all developers working on a project are utilizing the same development environment which prevents the "It works on my machine" syndrome.
- It frees the developers up to use any kind of machine and operating system that they like instead of having a standard forced upon them.
- It keeps the host development machine clean and free of development tools which can grow out of control if you work on many projects utilizing different frameworks and programming languages.

## Configuration
The DevContainer was created using Ubuntu Linux (Jammy Jellyfish) as the base image distributed through the Microsoft Artifact Registry. Jarrod Colburn's flutter-sdk feature was added to the DevContainer to install flutter and its depenendies to the base image. A post-create command that gives all users read, write, and execution access to the /flutter folder and its contents was used to configure the environment to be able to run flutter applications.

## Integration with VS Code
The Dev Containers extension from Microsoft was used to make the creation and configuration of development containers inside of Visual Studio Code possible. It is what enables the use of the devcontainers.json file to specify and configure a basic development container distributed by Microsoft to tailor it to the needs of our project. It is worth noting that the container so created does not need to have Visual Studio Code installed because the powerful integration of Microsoft's VS Code with its Dev Containers extensions allows us to edit code inside of a development environment using a local instance of VS Code running on our host machine.

## Usage

### Setup Instructions (Windows and Linux):
0. Ensure git is installed on your system.
1. Clone this repository using the following command:
```
   git clone https://github.com/RajwolChapagain/Flutter-Application.git
```
2. Install Visual Studio Code and the Docker Client.
3. Install the "Dev Containers" extension by Microsoft (identifier: ms-vscode-remote.remote-containers) in Visual Studio Code.
4. Open the Docker Client.
5. Open the cloned repository from step 1 in Visual Studio Code.
6. If VS Code shows a popup on the bottom right prompting to open this folder in a container, hit accept. Otherwise, press the blue icon containing two opposite-facing arrows on the bottom left of VS Code and select the "Reopen in Container" option from the menu that pops up.

For the first time, the development environment might take a couple of minutes to load up. After it does, you should be in an Ubuntu linux environment containing all the tools required to develop the flutter application stored in the "app" folder. 

### Editing Code:
To edit the source code for the application, edit the main.dart file using VS Code in the following directory: Flutter-Appilcation/app/lib

### Running the Application as a Web App:
1. Enter the "app" directory by using the following command in the terminal window inside of VS Code:
```
cd /workspaces/Flutter-Application/app
```
2. Run the application using the following command:
```
flutter run -d web-server
```
3. Once it establishes a connection, look for a line similar to the following:
    #### lib/main.dart is being served at http://localhost:42803
4. Ctrl + Left Click the link starting with http://localhost: that shows up in your terminal or copy the link and paste it in your browser.

You should now have a flutter application running in your web browser.

## Challenges and Solutions
The primary challenge that I faced setting up this DevContainer was getting the ```flutter run -d web-server``` command to work. Initially, it kept failing because it was denied access to the /flutter directory. So, I looked at the error messages and ran a recursive command to allow access to the folder for all users. After confirming that this solves the problem, I included this command as a postCreate in the devcontainer.json file which solved my problem.

## Conclusion
Using a DevContainer for this project eliminates the need of manually installing all the dependencies required by Flutter on my local machine for me to able to able to work on this application. Furthermore, it is platform-agnostic, which means that I can easily switch between different machines or operating systems and still be able to seamlessly work on my application by cloning my repository and starting up the DevContainer. 

Because of working on this project, I realized the power and usefulness of containerized deployments as well as containerized development. I learned in detail how they solve major problems in software development created by the differences between platforms and environments that software is developed and used on. 