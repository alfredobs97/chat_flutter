import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_flutter_in_the_dark/src/models/chat_model.dart';
import 'package:chat_flutter_in_the_dark/src/repositories/chat_repository.dart';
import 'package:meta/meta.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository _chatRepository;

  ChatBloc({ChatRepository chatRepository})
      : _chatRepository = chatRepository ?? ChatRepository(),
        super(ChatInitial());

  @override
  Stream<ChatState> mapEventToState(
    ChatEvent event,
  ) async* {
    if (event is GetChats) yield* _mapGetChatsToState();
  }

  Stream<ChatState> _mapGetChatsToState() async* {
    yield FetchingChats();
    try {
      final chats = await _chatRepository.getChats();
      yield FetchedChats(chats: chats);
    } catch (e) {
      yield ErrorFetchingChats();
    }
  }
}
