# Flutter-Application
This is a flutter application that comes alongside the development environment containing all the tools necessary to develop the application.

# Setup Instructions (Windows and Linux):
0. Ensure git is installed on your system.
1. Clone this repository using the following command:
```
   git clone https://github.com/RajwolChapagain/Flutter-Application.git
```
2. Install Visual Studio Code and the Docker Client.
3. Install the "Dev Containers" extension by Microsoft (identifier: ms-vscode-remote.remote-containers) in Visual Studio Code.
4. Open the Docker Client.
5. Open the cloned repository from step 1 in Visual Studio Code.
6. If VS Code shows a popup on the bottom right prompting to open this folder in a container, hit accept. Otherwise, press the blue icon containing two opposite-facing arrows on the bottom left of VS Code and select the "Reopen folder in a container" option from the menu that pops up.

For the first time, the development environment might take a couple of minutes to load up. After it does, you should be in an Ubuntu linux environment containing all the tools required to develop the flutter application stored in the "app" folder. 

# To run the flutter application as a web app:
1. Enter the "app" directory by using the following command:
```
    cd /workspaces/Flutter\ Application/app
```
2. Run the application using the following command:
```
    flutter run -d web-server
```
3. Once it establishes a connection, look for a line similar to the following:
    <h4> lib/main.dart is being served at http://localhost:42803 </h4>
4. Ctrl + Left Click the link starting with http://localhost: that shows up in your terminal or copy the link and paste it in your browser.

You should now have a flutter application running in your web browser.