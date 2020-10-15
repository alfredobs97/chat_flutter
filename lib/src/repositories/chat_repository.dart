import 'package:chat_flutter_in_the_dark/src/models/chat_model.dart';
import 'package:chat_flutter_in_the_dark/src/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRepository {
  final firestore = FirebaseFirestore.instance;

  Future<List<ChatModel>> getChats() async {
    final query = await firestore.collection('chats').get();

    return query.docs
        .map(
          (doc) => ChatModel.fromMap(doc.data())..id = doc.id,
        )
        .toList();
  }

  Stream<List<MessageModel>> getMessages(String chatId) async* {
    final stream = firestore.collection('chats').doc(chatId).collection('messages').orderBy('created').snapshots();

    yield* stream.map((event) => event.docs.map((doc) => MessageModel.fromMap(doc.data())).toList());
  }

  void sendMessage(String chatId, String content) => firestore
      .collection('chats')
      .doc(chatId)
      .collection('messages')
      .add({'text': content, 'created': Timestamp.now()});
}
