import { Server } from "socket.io";
import express from 'express';

const app = express();
const io = new Server(3000);

const users = {};

console.log("Server starting...");

// Health check endpoint
app.get('/health', (req, res) => {
  res.status(200).send('OK');
});

// Health check endpoint
app.get('/', (req, res) => {
  res.status(200).send('OK');
});

io.on("connection", (socket) => {
  console.log("User connected:", socket.id);

  socket.on("new-user", (name) => {
    users[socket.id] = name;
    console.log(`${name} connected`);
    socket.broadcast.emit("user-connected", name);
  });

  socket.on("send-chat-message", (message) => {
    console.log(`Message from ${users[socket.id]}: ${message}`);
    socket.broadcast.emit("chat-message", {
      message: message,
      name: users[socket.id],
    });
  });

  socket.on("disconnect", () => {
    console.log(`${users[socket.id]} disconnected`);
    socket.broadcast.emit("user-disconnected", users[socket.id]);
    delete users[socket.id];
  });
});

// Start the express server on port 3001
app.listen(3001, () => console.log('Express server started on port 3001'));