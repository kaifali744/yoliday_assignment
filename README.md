# yoliday_assignment

A new Flutter project.

Apk download link : [here](https://drive.google.com/file/d/1AOcPgUb8LS1qxhU81cgC0vRKAR-krLcc/view?usp=sharing)

# Portfolio App (Figma to Flutter)

A pixel-perfect mobile application implementation based on a provided Figma design. This project demonstrates high-fidelity UI conversion, responsive layout handling, and clean architecture principles in Flutter.

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)

## 📱 Screenshots

|                 Portfolio Screen                  |
|:-------------------------------------------------:|
| <img src="assets/screenshots/1.jpg" width="200"/> | 

> *Note: Screenshots are located in `assets/screenshots/`.*

## ✨ Features

* **Pixel-Perfect Design:** Closely adheres to the Figma specifications using `flutter_screenutil` for responsiveness across different screen sizes.
* **Custom Bottom Navigation:** Implemented a custom navigation bar with top-aligned indicators and active state styling (Orange highlight) to match specific design requirements.
* **Search Functionality:** Real-time filtering of project cards based on title text.
* **Dynamic Tab Bar:** Left-aligned, scrollable TabBar that handles spacing correctly on all devices using `TabAlignment.start`.
* **System UI Handling:** Configured `SystemChrome` to ensure the Android navigation bar is white and does not obscure app content on modern devices.
* **Modular Architecture:** Code is split into reusable widgets, constants, and models for maintainability.

## 🛠 Tech Stack & Packages

* **Framework:** Flutter (Dart)
* **Responsiveness:** [`flutter_screenutil`](https://pub.dev/packages/flutter_screenutil)
* **Icons:** [`flutter_svg`](https://pub.dev/packages/flutter_svg)
* **Fonts:** Custom local fonts (No Google Fonts dependency, as per instructions).

---

## ⚙️ Setup Instructions

1.  **Clone this repository**
    ```bash
    git clone <your_repo_url>
    cd yoliday_assignment
    ```

2.  **Install dependencies**
    ```bash
    flutter pub get
    ```

3.  **Run the app**
    ```bash
    flutter run
    ```

4.  **If you face any issues with Hive, clean and rebuild:**
    ```bash
    flutter clean
    flutter pub get
    flutter run
    ```

## 📦 Build Release APK

* To generate a release APK, run the following command:
    ```bash
    flutter build apk --release

* The output file can be found at:
    ```swift
    build/app/outputs/flutter-apk/app-release.apk
  
## 💡 Implementation Details & Decisions

Font Management: As requested, Google Fonts were avoided. Fonts are loaded locally via pubspec.yaml to ensure the app looks correct even when offline.

Search Logic: Search is implemented using local state management (setState) for immediate feedback, filtering the static list of ProjectModel.

Navigation Bar: The requirement for the indicator to be above the icon required a custom Container approach rather than the standard BottomNavigationBar widget.

SafeArea Fixes: Added SafeArea and SystemUiOverlayStyle configurations to ensure the app looks clean on modern Android devices with gesture navigation bars.

## ‍👨💻 Developer
**Mohammad Kaif Ali**

Flutter Developer

## Contact
- **LinkedIn**: [My LinkedIn Profile](https://www.linkedin.com/in/mohammad-kaif-ali-3a19671a0)
- **Twitter**: [My Twitter/X Profile](https://x.com/kaifali744)
- **Email**: [Email me](mailto:kaifali744@gmail.com)

## 📂 Project Structure

The project follows a scalable directory structure to ensure separation of concerns:

```text
lib/
├── constants/
│   └── colors.dart         # Centralized color palette (AppColors)
├── models/
│   └── project_model.dart  # Data model for Project Cards
├── screens/
│   ├── main_wrapper.dart   # Handles Bottom Navigation logic & System UI
│   └── portfolio_screen.dart # Main UI with Tabs and Search logic
├── widgets/
│   ├── custom_bottom_nav.dart # Extracted Nav Logic
│   └── project_card.dart      # Reusable Card Widget
└── main.dart               # Entry point & Theme config
