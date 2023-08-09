// ignore_for_file: public_member_api_docs, sort_constructors_first

class Todo {
  final int? id;
  final String title;
  final String decription;
  final int isDone;
  final String date;
  Todo({
    this.id,
    required this.title,
    required this.decription,
    required this.isDone,
    required this.date,
  });

  Todo copyWith(
      [int? id, String? title, String? decription, int? isDone, String? date]) {
    return Todo(
        id: id ?? this.id,
        title: title ?? this.title,
        decription: decription ?? this.decription,
        isDone: isDone ?? 0,
        date: date ?? this.date);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": id,
      'title': title,
      'description': decription,
      'isDone': isDone,
      'date': date,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> map) {
    return Todo(
      id: map["id"] as int,
      title: map['title'] as String,
      decription: map['description'] as String,
      isDone: map['isDone'] as int,
      date: map['date'] as String,
    );
  }
}
