import 'dart:convert';

class ChatModel {
  String id;
  final String title;
  ChatModel({
    this.id,
    this.title,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ChatModel(
      id: map['id'],
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) => ChatModel.fromMap(json.decode(source));

  @override
  String toString() => 'ChatModel(id: $id, title: $title)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is ChatModel &&
      o.id == id &&
      o.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}
