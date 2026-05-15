import 'package:objectbox/objectbox.dart';

@Entity()
class TaskModel {
  @Id()
  int? id;
  final String? title;
  final String? content;

  TaskModel({this.id, this.title, this.content});

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      TaskModel(id: json["id"], title: json["title"], content: json["content"]);

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "content": content,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          content == other.content;

  @override
  int get hashCode => Object.hash(id, title, content);
}
