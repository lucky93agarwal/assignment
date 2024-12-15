# coding_assignment

A new Flutter project.

## Getting Started

## Folder Structure


```
lib
│
├── Component => This file contains the component
│   ├── ScreenNameComponent Folder
│   │   [Contains all the components For Particular Screen]
│   │       │
│   └──CommonComponet [Folder]
│             [ Contains Widget like button, search bar, textfield... etc ]
│       
│
├── Config => The file contains the configuration file that used main.dart
│   ├── routes 🛣️
│   │       │
│   │       ├── app_routes
│   │       │   [Contains all the routes used in main.dart ]
│   │       │   
│   │       └── route_path
│   │           [ Class to add all the routes, which can be fetched using class ]
│   ├── theme 💄
│   │       │
│   │       ├── theme_collection
│   │       │   [Collection of Themes like dark, light, etc ]
│   │       │   
│   │       ├── abstract_theme
│   │       │   [ Abstract class of theme which will be extended by different theme used ]
│   │       │
│   │       ├── my_theme
│   │       │    [ Current theme setup ]
│   │       │
│   │       └── theme_manager
│   │           [ Method to select theme ]
│   │
│   ├── app_init.dart ⚙️
│   │
│   ├── r.dart 🎞️
│   │   [ Contains Assets path ]
│   │
│   └── text_styles.dart
│       [ Contains all the textStyle used in the App ]
│
├── Constant
│   ├──font_constant
│   │       [ Constant of Fonts that are used in the app ]
│   ├── enum
│   └──string constant
│    
├── Cors
│   ├── common_utils
│   │   [ This file will have the methods to display snackbar, dialogue, etc ]
│   │
│   ├── ApisRoutes
│   │  
│   ├── Api Wrapper
│   │
│   ├── 
│   │ 
│   ├──Other Services
│   └── Shared Prefrance
│ 
├── L10N [Language]
│
├── Screens 🪶 [Folder]
│   └── ScreenName [Folder]
│       │
│       └── screen_name.dart[file in snake_case] 
│          │
│          If contain tab => Another folder with tab_name_screen => Under Screen Name
│
├── Model 💃
│   └── Contains All the Model
│        [ Model for the language ]
│
└── main.dart 🚀
    [Project begins Here]

```



```
Git branch

** developer [From Where Developer will pull and raise PR]
** staging   [ Parallel branch to main]
** main      [ Stable which will not be touched by anyone]

```

Build the APK
```
flutter build apk --release
```


Build DEV APK
```
flutter build apk --release --build-name=coding_assignment_dev_1.0.1 --build-number=1
```

Build PROD APK
```
flutter build apk --release --build-name=coding_assignment_1.0.1 --build-number=1
```

Increase the patch version with every build


Share build
```
Create the build from above Command

Upload the build in this folder
https://drive.google.com/drive/folders/1-DwyW8LEWT6fIOWEVTiLORfSHWLPk0mu?usp=sharing

Rename the build like this nepal_calender_dev_version_no

Share the build Link
```


Common Rules
```
Folder name: Folder name should be camelCase, like FolderName
File name: File name should be snake_case, like home_screen.dart
Class Name: Class Name should be camelCase, like ClassName
Fuction Name: Function name should be like this thisIsFuction(){}
```

Remove these from git cache
```
 git rm -r --cached android/local.properties
```
```
git rm -r --cached .idea
```
```
git rm -r --cached .dart_tool
```
```
git rm -r --cached .flutter-plugins
```
```
git rm -r --cached .flutter-plugins-depende
```


Set Upsetream
```
git config --global --add --bool push.autoSetupRemote true
```

# Running Unit Tests
To run the unit tests, follow these steps:

Step 1. Navigate to the test Directory :
- Make sure you're in the root of the project and navigate to the test folder where the test files are located.
```
cd test
```
Step 2. Run the Unit Tests
- To run the unit tests for your Flutter project, run the following command:
```
flutter test
```
Step 3. Running Specific Test Files :
- If you want to run a specific test file (e.g., login_controller_test.dart), you can use the following command:
```
flutter test test/controllers/login_controller_test.dart
```
This will automatically detect and run all the test files inside the test directory and output the results to the terminal.

Step 4. Viewing Test Results :
- After running the tests, the terminal will display the results, including whether the tests passed or failed. If a test fails, the terminal will show the error message that caused the failure.

# Additional Information
- Debugging
If you encounter any issues, you can debug the application using the flutter run command with the --debug flag for more detailed logs:
```
flutter run --debug
```
You can also use flutter analyze to check for any issues with the project setup or code quality:
```
flutter analyze
```

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Visitors Count

<img align="left" src = "https://profile-counter.glitch.me/assignment/count.svg" alt ="Loading">