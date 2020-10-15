import 'package:flutter/material.dart';

class LoadingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(child: CircularProgressIndicator()),
    );
  }
}
