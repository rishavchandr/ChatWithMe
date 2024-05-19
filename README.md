# Chat-With-Me

Chat-With-Me is a basic chat application for iOS that allows users to communicate with each other. The app uses Firebase for authentication and as a datastore for messages. It supports simple, real-time text messaging without the use of WebSockets.

## Features
- User Sign-Up
- User Login
- Real-time text messaging

## Screenshots
<div style="display:flex; align-items:center;justify-content:center; gap:6px;">
  <div>
  <strong>Sign Up</strong>:
    <br/>
<img src="https://github.com/rishavchandr/chatWithMe/assets/110689353/586437ab-e2ef-4752-978d-e5d9e7391036" width="200px">
  </div>

  <div>
  <strong>login</strong>:
  <br/>
<img src="https://github.com/rishavchandr/chatWithMe/assets/110689353/f7e93bcc-2631-4f43-816d-ec96fdd5887e" width="200px">
  </div>
</div>

## Installation

### Prerequisites
- Xcode installed on your macOS
- Install firebase sdk form ios dependencies .
- A Firebase project set up (you can set up a Firebase project)

### Steps

1. **Clone the repository:**
    ```bash
    git clone https://github.com/rishavchandr/chatWithMe.git
    cd chatWithMe
    ```

2. **Install dependencies:**
    ```bash
    pod install
    ```

3. **Open the project:**
    Open the `.xcworkspace` file in Xcode:
    ```bash
    open ChatWithMe.xcworkspace
    ```

4. **Configure Firebase:**
    - Download the `GoogleService-Info.plist` from your Firebase project.
    - Add the `GoogleService-Info.plist` file to your Xcode project (make sure it's included in the target).

5. **Build and run the project:**
    Select the target device or simulator in Xcode and press `Command + R` to build and run the app.

## Usage
- **Sign Up:**
    - Open the app and navigate to the sign-up screen.
    - Enter your email and password to create a new account.

- **Login:**
    - Navigate to the login screen.
    - Enter your email and password to log in.

- **Chat:**
    - Once logged in, you can start chatting in real-time with other users who are also logged in.

## Contributing
Feel free to submit pull requests or open issues to improve this app. Contributions are always welcome!


