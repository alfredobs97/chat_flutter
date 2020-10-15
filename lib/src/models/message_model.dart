import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String text;
  final Timestamp created;

  MessageModel({
    this.text,
    this.created,
  });

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'created': created?.millisecondsSinceEpoch,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return MessageModel(
      text: map['text'],
      created: map['created'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) => MessageModel.fromMap(json.decode(source));

  @override
  String toString() => 'MessageModel(text: $text, created: $created)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is MessageModel &&
      o.text == text &&
      o.created == created;
  }

  @override
  int get hashCode => text.hashCode ^ created.hashCode;
}
