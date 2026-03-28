# Notes App 📝
A simple and efficient Flutter application for managing your daily notes and goals.

## 🚀 Features
- **Persistent Storage:** Uses [hive_ce](https://pub.dev/packages/hive_ce) to save your notes locally, so they stay even if you close the app.
- **State Management:** Powered by [BLoC/Cubit](https://pub.dev/packages/flutter_bloc) for a clean and reactive UI.
- **Smooth UI:** Modern design with customized text controllers and scroll behavior.
- **CRUD Operations:** Create, Read, Update, and Delete notes easily.

## 🛠️ Tech Stack
- **Flutter** (Framework)
- **Dart** (Language)
- **hive_ce** (NoSQL Local Database)
- **Flutter BLoC** (State Management)

## 📸 Screenshots
<p align="center">
  <img src="./screenshots\Screenshot_1774728899.png" width="300" />
  <img src="./screenshots\Screenshot_1774728903.png" width="300" />
</p>
<p align="center">
  <img src="./screenshots\Screenshot_1774728920.png" width="300" />
  <img src="./screenshots\Screenshot_1774728922.png" width="300" />
</p>

## ⚙️ How to run
1. Clone the repository:

    ''git clone https://github.com/Elgedawi/goals_app''
    
2.Install dependencies:

    ''flutter pub get''
3.Run build_runner to generate Hive adapters:

    ''dart run build_runner build''
4.Run the app:

    ''flutter run''