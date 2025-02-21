# Flutter Client Application

A comprehensive Flutter application designed to manage user addictions, diaries, and profile settings. This project leverages modern Flutter practices, including state management with Provider, routing with GoRouter, and persistent storage using SharedPreferences.

## Table of Contents

- [Features](#features)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Folder Structure](#folder-structure)

## Features

- **User Authentication**: Secure login and logout functionality.
- **Addiction Management**: Users can view, add, and manage their addictions.
- **Diary Entries**: Users can create and manage diary entries.
- **Profile Settings**: Users can update their profile information and settings.
- **Theme Customization**: Users can switch between light, dark, and system default themes.
- **Persistent Storage**: User preferences and data are stored using SharedPreferences for a consistent experience.

## Technologies Used

- **Flutter**: The UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
- **Dart**: The programming language used to build the application.
- **Provider**: A state management solution for Flutter.
- **GoRouter**: A declarative routing package for Flutter.
- **SharedPreferences**: A simple key-value storage solution for persisting user preferences.

## Installation

To get started with this project, follow these steps:

1. **Clone the repository**:

   ```bash
   git clone https://github.com/Not-Today-App/client.git
   cd client
   ```

2. **Install dependencies**:
   Make sure you have Flutter installed on your machine. Then run:

   ```bash
   flutter pub get
   ```

3. **Run the application**:
   You can run the application on an emulator or a physical device:
   ```bash
   flutter run
   ```

## Folder Structure

The project follows MVVM for better maintainability:

```lib/
├── config/            # Configuration files and dependency injection
├── data/              # Data layer (repositories, services)
│   ├── repositories/
│   └── services/
├── domain/            # Domain models
│   └── models/
├── routing/           # Routing and navigation
├── ui/                # User interface components
│   ├── auth/          # Authentication screens
│   ├── main/          # Main application screens
│   ├── core/          # Core UI components and themes
│   └── widgets/       # Reusable widgets
└── main.dart          # Entry point of the application
```
