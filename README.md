# Fitness Tracker & BMI Analyzer Pro 🏋️‍♂️

A premium, highly interactive Flutter application designed to help users track their fitness journey. This app features a beautiful dark-mode UI, smooth animations, and a fully functional BMI Calculator, Activity Tracker, and Fitness Tips section.

## ✨ Features

### 1. BMI Analyzer (Interactive & Animated)
* **Custom Sliders & Controls:** Sleek slider for height input and elevated tap-buttons for weight.
* **Animated Results:** Calculates BMI and reveals the result with an elastic spring animation (`ScaleTransition`).
* **Dynamic Color-Coding:** The result card automatically shifts gradients based on the category (Blue = Underweight, Green = Normal, Red = Overweight).

### 2. Activity Tracker
* Add daily workout activities (e.g., Running, Cycling) with custom durations.
* **Interactive List:** Tap an activity to mark it complete. It features an `AnimatedContainer` that smoothly transitions to a green success state, strikes through the text, and updates the icon.

### 3. Fitness Tips & Details
* A grid-view of essential fitness tips.
* **Hero Animations:** Tap any tip card, and watch the icon seamlessly fly to the detail screen for a premium user experience.

### 4. Navigation & Architecture
* **Bottom Navigation Bar:** Smoothly switch between the three core screens using an `AnimatedSwitcher`.
* **Drawer Menu:** Side navigation panel for User Profile, Settings, and About App.

## 🛠️ Tech Stack & Requirements Met
* **Framework:** Flutter / Dart
* **UI/UX:** Custom dark theme, `google_fonts` (Poppins), Cards, Custom Icons.
* **State Management:** `setState()`
* **Routing:** Navigation via `push`/`pop`.

## 🚀 How to Run the App Locally

If you are a reviewer or teacher evaluating this project, follow these steps to run the app on your local machine:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Anushkaaa02/mse2.git
   ```
2. **Navigate to the project directory:**
   ```bash
   cd mse2
   ```
3. **Install dependencies:**
   ```bash
   flutter pub get
   ```
4. **Run the app (Emulator or Chrome):**
   ```bash
   flutter run
   ```

---
*Developed as a project submission focusing on clean code, UI aesthetics, and Flutter animations.*
