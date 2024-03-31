const io = require("socket.io")(3000);

const users = {};

console.log("Server starting...");

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
