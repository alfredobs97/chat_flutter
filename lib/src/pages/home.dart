import 'package:chat_flutter_in_the_dark/src/bloc/chat/chat_bloc.dart';
import 'package:chat_flutter_in_the_dark/src/pages/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LISTADO DE CHATS'), backgroundColor: Colors.lime[800],),
      body: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          if (state is FetchingChats) return Center(child: CircularProgressIndicator());
          if (state is ErrorFetchingChats) return Center(child: Text('Error'));
          if (state is FetchedChats)
            return ListView.builder(
              itemCount: state.chats.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatPage(chat: state.chats[index])),
                ),
                child: Container(
                  height: 100,
                  color: Colors.lime[300],
                  child: Center(
                      child:
                          Text(state.chats[index].title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
                ),
              ),
            );
          return SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){},
      ),
    );
  }
}
