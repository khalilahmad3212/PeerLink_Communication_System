import 'package:peerlink_mobileapp/res/app_url/app_url.dart';
import 'package:peerlink_mobileapp/user_preference/user_preference_controller.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketIOService {
  // Socket.io client instance
  io.Socket? socket;
  final UserPreference userPreference = UserPreference();

  // Function to establish connection with the server
  Future<void> connect(String serverUrl, String token) async {
    // Create a socket connection with the provided URI and authentication
    String? token;
    await userPreference.getUser().then(
      (value) {
        token = value.accessToken;
      },
    );
    socket = io.io(AppUrl.baseUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
      'query': {'token': token},
    });

    // Set up event listeners for various socket events
    socket!.onConnect((_) {
      print('Connected');
    });

    socket!.onDisconnect((_) {
      print('Disconnected');
    });

    socket!.on('message', (data) {
      print('Message received: $data');
      // Handle message received event here
    });

    // Connect to the server
    socket!.connect();
  }

  // Function to send a message
  void sendMessage(String message) {
    if (socket != null && socket!.connected) {
      // Emit a message event to the server with the message data
      socket!.emit('sendMessage', message);
    } else {
      print('Socket not connected');
    }
  }

  // Function to close the socket connection
  void disconnect() {
    if (socket != null && socket!.connected) {
      socket!.disconnect();
    }
  }
}
