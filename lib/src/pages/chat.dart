import 'package:chat_flutter_in_the_dark/src/models/chat_model.dart';
import 'package:chat_flutter_in_the_dark/src/models/message_model.dart';
import 'package:chat_flutter_in_the_dark/src/repositories/chat_repository.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final ChatModel chat;

  ChatPage({Key key, @required this.chat}) : super(key: key);

  final _messageController = TextEditingController();
  final _chatRepository = ChatRepository();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(this.chat.title), backgroundColor: Colors.lime[800],),
        body: Column(
          children: [
            Text('Chat con usuario', style: TextStyle(fontSize: 18)),
            SizedBox(height: 30),
            StreamBuilder<List<MessageModel>>(
                stream: _chatRepository.getMessages(chat.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) return CircularProgressIndicator();
                  if (snapshot.hasError) return Text('error');
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          height: 50,
                          color: Colors.grey[200],
                          child: Center(child: Text(snapshot.data[index].text)),
                        ),
                      ),
                    ),
                  );
                }),
            Row(children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: 'Escribe tu mensaje', border: OutlineInputBorder()),
                    controller: _messageController,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: (){
                  _chatRepository.sendMessage(chat.id, _messageController.text);
                  _messageController.clear();
                },
              )
            ])
          ],
        ),
      ),
    );
  }
}
