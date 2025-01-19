# AI Chatbot

This repository contains an AI-powered chatbot application that generates text based on user prompts.

## Features
- **Flask Backend**: Handles API requests and integrates with external AI services.
- **Dart Frontend**: Provides a user interface for interacting with the chatbot.
- **Dockerized Deployment**: Facilitates easy setup and deployment using Docker.

## Prerequisites
- **Docker**: Ensure Docker is installed on your system.
- **Flutter**: Install Flutter for building and running the Dart frontend.

## Setup and Installation

### 1. Clone the Repository:
```bash
# Clone the repository
git clone https://github.com/Akshat-sGit/ai_chatbot.git
cd ai_chatbot
```

### 2. Backend Setup:
```bash
# Navigate to the backend directory
cd backend

# Build the Docker image
docker build -t ai_chatbot_backend .

# Run the Docker container
docker run -p 5001:5001 ai_chatbot_backend
```

### 3. Frontend Setup:
```bash
# Navigate to the frontend directory
cd ../frontend

# Install all dependencies
flutter pub get

# Run the Flutter application
flutter run
```

## Usage
- Access the chatbot interface through the Flutter application.
- Enter a prompt to receive AI-generated responses.

## Contributing
Contributions are welcome! Please fork the repository and create a pull request with your changes.
