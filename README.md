# Simple ToDo List App 📱
A simple, intuitive to-do list app built with Flutter. This app allows users to add, view, toggle completion status. It keeps the data locally when the app is closed.

# Languages and frameworks 📑
 * Flutter: version 3.24.5
 * Dart
   
## Packages & Plugins & Dependencies 🔎
 * Get (For State Management)
 * Shared Prefrences (for Caching)
 * Flutter Test (for unit testing)
 * Mockito (used in unit testing)

## Features 🥇
 * Add Tasks: Quickly add new tasks to your list.
 * Toggle Task Completion: Mark tasks as completed or not completed.
 * Persistent Storage: Tasks are stored locally using SharedPreferences, so they persist across app restarts.
 * User-Friendly Interface: Simple and clean design for easy use.

## IDEs 💻
 * VS code
 * Android Studio

## Get the App 📱
 * Get the apk of the app from [**Drive**](https://drive.google.com/file/d/1-esJne1M4qnIHXZZwMDvN_6noo_f6j0t/view?usp=sharing)

## Setup 💽
To get a local copy up and running, follow these instructions.

Prerequisites

 * Flutter SDK: Ensure Flutter is installed on your system. Follow Flutter installation guide
 * Android Studio or Visual Studio Code for development and testing.
 * clone the repository
 * and run the app on any plugged physical device or emulator.

## Installation
   ``` bash 
      # Clone the repository
      git clone https://github.com/Mohamed-said-salah/todo-list-app.git
      cd todo_list
   ```
   ``` bash
      # Install dependencies
      flutter pub get
   ```
   ``` bash
      # Run the application on a physical device or emulator
      flutter run
   ```

   ``` bash
      # Build the APK
      flutter build apk --release
   ```

## Project Structure
   ``` bash
      .
      └── lib/
          ├── controllers/
          │   └── task_controller.dart
          ├── models/
          │   └── task_model.dart
          ├── screens/
          │   └── todo_screen.dart
          ├── widgets/
          │   └── task_tile.dart
          └── main.dart
   ```

## ScreenShots 🖼️
<div align='center'>
  <img height="460px" src="https://github.com/user-attachments/assets/89f9be44-35f0-4418-9354-3ea6870edd97">
<hr/>
</div>
