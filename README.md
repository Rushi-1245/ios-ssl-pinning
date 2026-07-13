# 🔐 Network Security - SSL Pinning in SwiftUI

A production-inspired iOS application demonstrating secure networking using **SSL Certificate Pinning** and **Public Key Pinning** with **SwiftUI**, **URLSession**, and Apple's **Security Framework**.

This project showcases how to secure HTTPS communication by validating the server's identity before exchanging sensitive data, helping protect applications against **Man-in-the-Middle (MITM)** attacks.

> **Portfolio Project:** Built to demonstrate modern iOS networking, security best practices, protocol-oriented programming, dependency injection, and SwiftUI architecture.

---

# ✨ Features

- 🔒 SSL Certificate Pinning
- 🔑 Public Key Pinning
- 🔄 Multiple Public Key Hash Support (Certificate Rotation)
- 🌍 Environment Configuration (Development / Staging / Production)
- 🏗 MVVM Architecture
- 📡 Protocol-Oriented Networking
- 💉 Dependency Injection
- 📱 SwiftUI User Interface
- 🖥 Local HTTPS Server using Node.js & Express
- 🛡 Custom URLSessionDelegate for SSL Validation
- 🔐 SHA-256 Public Key Fingerprinting
- 📦 Generic Network Layer
- ⚡ Async/Await Networking

---

# 🏛 Architecture

```text
SwiftUI View
      │
      ▼
ViewModel
      │
      ▼
APIClient
      │
      ▼
URLSession
      │
      ▼
SSLPinningManager
      │
      ▼
PinningValidator
      │
 ┌────┴──────────┐
 ▼               ▼
Certificate   PublicKey
 Validator     Validator
```

---

# 🔒 Certificate Pinning Flow

```text
App
 │
 ▼
HTTPS Request
 │
 ▼
Receive Server Certificate
 │
 ▼
Load Bundled Certificate
 │
 ▼
Compare Certificates
 │
 ├── Match ✅
 │      │
 │      ▼
 │ Continue Request
 │
 └── No Match ❌
        │
        ▼
 Cancel Connection
```

---

# 🔑 Public Key Pinning Flow

```text
App
 │
 ▼
HTTPS Request
 │
 ▼
Receive Server Certificate
 │
 ▼
Extract Public Key
 │
 ▼
Generate SHA-256 Hash
 │
 ▼
Compare with Trusted Hashes
 │
 ├── Match ✅
 │      │
 │      ▼
 │ Continue Request
 │
 └── No Match ❌
        │
        ▼
 Cancel Connection
```

---

# 🛠 Tech Stack

## iOS

- Swift 6
- SwiftUI
- URLSession
- Security Framework
- CryptoKit

## Local Server

- Node.js
- Express
- HTTPS
- OpenSSL

---

# 📂 Project Structure

```text
iOS-SSLPinning
│
├── NetworkSecurity
│   │
│   ├── App
│   │
│   ├── Core
│   │   ├── Configuration
│   │   ├── Networking
│   │   ├── Security
│   │   └── Utilities
│   │
│   └── Features
│       └── Home
│
├── LocalServer
│   ├── certificates
│   ├── package.json
│   └── server.js
│
└── README.md
```

---

# 🚀 Getting Started

## 1. Clone the Repository

```bash
git clone https://github.com/Rushi-1245/ios-ssl-pinning.git
```

---

## 2. Install Dependencies

```bash
cd LocalServer
npm install
```

---

## 3. Start the HTTPS Server

```bash
npm start
```

The HTTPS server will be available at:

```text
https://<YOUR_LOCAL_IP>:3000
```

---

## 4. Configure the Development Environment

Update your local IP address inside the `Environment.swift` file.

Example:

```swift
case .development:
    return "https://192.168.0.171:3000"
```

---

## 5. Open the iOS Project

Open:

```text
NetworkSecurity.xcodeproj
```

Build and run the application.

Tap **Fetch User** to test the secure HTTPS connection.

---

# 🔐 Security Components

## Certificate Loader

Loads the trusted certificate bundled with the application.

---

## SSL Pinning Manager

Custom `URLSessionDelegate` responsible for validating the server trust before allowing HTTPS communication.

---

## Certificate Validator

Validates the server certificate against the bundled certificate.

---

## Public Key Validator

Extracts the server's public key, generates its SHA-256 fingerprint, and validates it against trusted public key hashes.

---

## SHA256 Hasher

Generates SHA-256 hashes used for Public Key Pinning.

---

# 📚 What You'll Learn

- SSL/TLS Fundamentals
- HTTPS Communication
- Certificate Pinning
- Public Key Pinning
- SHA-256 Hashing
- URLSessionDelegate
- Security Framework
- CryptoKit
- SwiftUI Networking
- Dependency Injection
- Protocol-Oriented Programming
- MVVM Architecture

---

# 🚧 Future Improvements

- Runtime switching between Certificate Pinning and Public Key Pinning
- Certificate expiration monitoring
- Remote certificate updates
- CI/CD with GitHub Actions
- Automated UI Tests
- Additional networking examples

---

# 🤝 Contributing

Contributions, suggestions, and improvements are welcome.

Feel free to fork the repository and submit a pull request.

---

# 📄 License

This project is created for learning, demonstration, and portfolio purposes.

If you found this project useful, consider giving it a ⭐ on GitHub.
