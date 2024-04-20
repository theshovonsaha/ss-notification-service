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

## License

The MIT License (MIT)

Copyright (c) 2022 Shovon Saha
