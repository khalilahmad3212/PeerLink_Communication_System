class AppUrl {
  static const String baseUrl = 'http://10.0.2.2:8080/api/v1';

  static const loginApi = '$baseUrl/users/login';
  static const signupApi = '$baseUrl/users/register';
  static const fetchChats = '$baseUrl/chat-app/chats';
  static String fetchMessages(String chatId) =>
      '$baseUrl/chat-app/messages/$chatId';
  static const fetchUsers = '$baseUrl/chat-app/chats/users';
  static String createChat(String receiverId) =>
      '$baseUrl/chat-app/chats/c/$receiverId';
  static String createGroupChat = '$baseUrl/chat-app/chats/group';
  static String deleteChat(String chatId) =>
      '$baseUrl/chat-app/chats/remove/$chatId';
  static String sendMessage(String chatId) =>
      '$baseUrl/chat-app/messages/$chatId';
}
