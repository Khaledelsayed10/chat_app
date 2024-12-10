part of 'chat_cubit.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatSaccess extends ChatState {
  List<Message> messages;

  ChatSaccess({required this.messages});
}
