// ignore_for_file: public_member_api_docs, sort_constructors_first
class TodoModel {
  String title;
  String description;
  bool isDone;
  DateTime createdDate;
  TodoModel({
    required this.title,
    required this.description,
    required this.isDone,
    required this.createdDate,
  });
}
