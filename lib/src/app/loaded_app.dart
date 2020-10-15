import 'package:chat_flutter_in_the_dark/src/bloc/chat/chat_bloc.dart';
import 'package:chat_flutter_in_the_dark/src/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc()..add(GetChats()),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
