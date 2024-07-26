# Chat App

A fully-featured chat application built with Flutter. This app allows users to send and receive messages in real-time, create chat rooms, and manage their profiles. It leverages Firebase for backend services including authentication, database, and storage.

## Features

- **User Authentication**: Sign up and log in with email and password.
- **Real-Time Messaging**: Send and receive messages instantly.
- **Chat Rooms**: Create and join chat rooms.
- **Profile Management**: Update profile information and profile picture.
- **Push Notifications**: Receive notifications for new messages.

## Installation

1. **Clone the repository**:
    ```bash
    git clone https://github.com/yourusername/chat-app.git
    cd chat-app
    ```

2. **Install dependencies**:
    ```bash
    flutter pub get
    ```

3. **Set up Firebase**:
    - Create a Firebase project at [Firebase Console](https://console.firebase.google.com/).
    - Add an Android app to your Firebase project.
    - Follow the instructions to download the `google-services.json` file.
    - Place the `google-services.json` file in the `android/app` directory.
    - Add an iOS app to your Firebase project.
    - Follow the instructions to download the `GoogleService-Info.plist` file.
    - Place the `GoogleService-Info.plist` file in the `ios/Runner` directory.

4. **Run the app**:
    ```bash
    flutter run
    ```

## Configuration

To configure Firebase, update the following files with your Firebase project credentials:

- `android/app/google-services.json`
- `ios/Runner/GoogleService-Info.plist`

You may also need to enable Firebase authentication, Firestore, and Firebase Storage from the Firebase Console.

## Dependencies

- [firebase_core](https://pub.dev/packages/firebase_core)
- [firebase_auth](https://pub.dev/packages/firebase_auth)
- [cloud_firestore](https://pub.dev/packages/cloud_firestore)
- [firebase_storage](https://pub.dev/packages/firebase_storage)
- [provider](https://pub.dev/packages/provider)
- [flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications)

## Contributing

Contributions are welcome! Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch with a descriptive name.
3. Make your changes.
4. Submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contact

If you have any questions or suggestions, feel free to contact me at [angelarabadzhiev82@gmail.com](mailto:angelarabadzhuev82@gmail.com).

---

Thank you for checking out this project! If you liked it, please give it a ⭐️ on [GitHub](https://github.com/yourusername/chat-app).
