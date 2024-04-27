class TaskModel {
  final int? id;
  final String? title;
  final String? content;

  TaskModel({
    this.id,
    this.title,
    this.content,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        title: json["title"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
      };
}
