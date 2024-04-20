# Notification Service

## Overview

The Notification Service is a Node.js-based application designed to provide real-time notification capabilities. It utilizes Socket.io for real-time communication between the server and clients, enabling seamless delivery of notifications based on priority and custom event-based triggers.

## Features

- **Priority-Based Notification System**: Allows clients to prioritize notifications as high, medium, or low.
- **Custom Event-Based Triggers**: Enables clients to trigger notifications based on specific events or conditions within their applications.
- **Security**: Configurable security settings including headers and cookie handling to ensure secure communication between the server and clients.

## Installation and Setup

### Prerequisites

- Node.js and npm installed on your system.
- A domain or IP address for deployment (optional).

### Installation Steps

1. Clone the repository:

    ```bash
    git clone https://github.com/your-username/notification-service.git
    cd notification-service
    ```

2. Install dependencies:

    ```bash
    npm install
    ```

3. Start the service:

    ```bash
    npm start
    ```

The service will start running on the specified port (default is 3000).

## Usage

### Enqueue Notifications

To enqueue notifications with a specific priority, send a POST request to the `/enqueue` endpoint with the following JSON payload:

```json
{
  "priority": "high",
  "message": "Test notification"
}
```

### You can use tools like curl or Postman to send POST requests to the endpoint:
```
curl -X POST -H "Content-Type: application/json" -d '{"priority": "high", "message": "Test notification"}' http://localhost:3000/enqueue
```
### Custom Event-Based Triggers
Clients can trigger notifications based on specific events using the triggerNotification event. The following data should be emitted along with the event:


### Security Configuration
The service includes middleware to set security headers and handle cookies securely. You can customize these settings according to your application's requirements in the index.js file.

### Testing
For testing the notification service, refer to the Notification Test App section below.

```
### Notification Test App README

```markdown
# Notification Test App

## Overview

The Notification Test App is a simple Node.js application designed to test the Notification Service. It connects to the Notification Service using Socket.io and triggers notifications based on priority and custom events to verify the functionality of the service.

## Features

- **Connect to Notification Service**: Connects to the Notification Service using Socket.io.
- **Set Priority**: Sets the notification priority to high.
- **Trigger Notifications**: Triggers high-priority notifications to the Notification Service.
- **Receive Notifications**: Listens for incoming notifications from the Notification Service.

## Installation and Setup

### Prerequisites

- Node.js and npm installed on your system.

### Installation Steps

1. Clone the repository:

    ```bash
    git clone https://github.com/your-username/notification-test-app.git
    cd notification-test-app
    ```

2. Install dependencies:

    ```bash
    npm install
    ```

3. Start the test application:

    ```bash
    npm start
    ```

The test application will connect to the Notification Service and start testing the notification functionality.

## Usage

### Customization

You can modify the test application code (`index.js`) to test other priority levels and custom event-based triggers as per your requirements.

### Starting the Test Application

Run the following command to start the test application:

```bash
npm start
```

## License

The MIT License (MIT)

Copyright (c) 2022 Shovon Saha
