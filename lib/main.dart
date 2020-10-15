import 'package:chat_flutter_in_the_dark/src/app/error_app.dart';
import 'package:chat_flutter_in_the_dark/src/app/loaded_app.dart';
import 'package:chat_flutter_in_the_dark/src/app/loading_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _initialization = Firebase.initializeApp();
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) return ErrorApp();

          if (snapshot.connectionState == ConnectionState.done) return ChatApp();

          return LoadingApp();
        });
  }
}
