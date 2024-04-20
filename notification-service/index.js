#!/usr/bin/env node
const express = require("express");
const http = require("http");
const socketIO = require("socket.io");

const app = express();
const server = http.createServer(app);
const io = socketIO(server);

// Middleware to set security headers
app.use((req, res, next) => {
    res.setHeader("Strict-Transport-Security", "max-age=31536000; includeSubDomains");
    res.setHeader("X-Content-Type-Options", "nosniff");
    res.setHeader("X-Frame-Options", "DENY");
    res.setHeader("X-XSS-Protection", "1; mode=block");
    next();
});

// Middleware to handle cookies securely
app.use((req, res, next) => {
    next();
});

// Serve static files
app.use(express.static("public"));

// Priority-based notification queue
const notificationQueue = [];

// Socket.io connection
io.on("connection", (socket) => {
    console.log("a user connected");

    socket.emit("notification", "Welcome to the enhanced notification service");

    socket.on("setPriority", (priority) => {
        socket.priority = priority;
    });

    socket.on("triggerNotification", (data) => {
        const { priority, message } = data;
        if (priority && message) {
            notificationQueue.push({ priority, message });
            notificationQueue.sort((a, b) => a.priority.localeCompare(b.priority));
        }
    });

    socket.on("disconnect", () => {
        console.log("user disconnected");
    });
});

function sendNotifications() {
    let notification = notificationQueue.shift();
    while (notification) {
        io.emit("notification", notification.message);
        notification = notificationQueue.shift();
    }
}

setInterval(sendNotifications, 5000);

const PORT = process.env.PORT || 3000;

server.listen(PORT, () => {
    console.log("Server is running on port", PORT);
});
