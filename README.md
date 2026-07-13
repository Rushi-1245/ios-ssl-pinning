# 🔐 Network Security - SSL Pinning in SwiftUI

A production-inspired iOS application demonstrating secure networking using **SSL Certificate Pinning** and **Public Key Pinning** with SwiftUI and URLSession.

The project showcases how to protect API communication against Man-in-the-Middle (MITM) attacks by validating the server's identity before exchanging sensitive data.

---

## ✨ Features

- 🔒 SSL Certificate Pinning
- 🔑 Public Key Pinning
- 🔄 Multiple Public Key Hash Support (Certificate Rotation)
- 🌍 Environment Configuration (Development / Staging / Production)
- 🏗️ MVVM Architecture
- 📡 Protocol-Oriented Networking
- 💉 Dependency Injection
- 📱 SwiftUI User Interface
- 🖥️ Local HTTPS Server using Node.js & Express
- 🛡️ Custom URLSessionDelegate for SSL Validation

---

## 🛠 Tech Stack

- Swift 6
- SwiftUI
- URLSession
- CryptoKit
- Security Framework
- Node.js
- Express
- OpenSSL

---

## 📂 Project Structure

```
iOS-SSLPinning
│
├── NetworkSecurity
│   ├── App
│   ├── Core
│   │   ├── Configuration
│   │   ├── Networking
│   │   ├── Security
│   │   └── Utilities
│   └── Features
│
└── LocalServer
    ├── certificates
    ├── package.json
    └── server.js
```

---

## 🚀 Getting Started

### Clone the repository

```bash
git clone https://github.com/YOUR_USERNAME/iOS-SSLPinning.git
```

### Start the Local HTTPS Server

```bash
cd LocalServer
npm install
npm start
```

### Run the iOS App

1. Open `NetworkSecurity.xcodeproj`
2. Select an iOS Simulator or physical device.
3. Build and run the project.
4. Tap **Fetch User** to test the secure HTTPS connection.

---

## 📄 License

This project is created for learning and portfolio purposes.
