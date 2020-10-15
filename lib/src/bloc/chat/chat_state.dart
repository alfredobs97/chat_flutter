part of 'chat_bloc.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

class FetchingChats extends ChatState {}

class FetchedChats extends ChatState {
  final List<ChatModel> chats;
  FetchedChats({this.chats});
}

class ErrorFetchingChats extends ChatState {}
