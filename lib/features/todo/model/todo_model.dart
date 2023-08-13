// ignore_for_file: public_member_api_docs, sort_constructors_first

class Todo {
  final int? id;
  final String title;
  final String decription;
  final bool isDone;
  final String date;
  final String time;
  Todo({
    this.id,
    required this.title,
    required this.decription,
    required this.isDone,
    required this.date,
    required this.time,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": id,
      'title': title,
      'description': decription,
      'isDone': isDone ? 1 : 0,
      'date': date,
      'time': time,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> map) {
    return Todo(
      id: map["id"] as int,
      title: map['title'] as String,
      decription: map['description'] as String,
      isDone: map['isDone'] == 1 ? true : false,
      date: map['date'] as String,
      time: map['time'] as String,
    );
  }

  Todo copyWith({
    String? title,
    String? decription,
    bool? isDone,
    String? date,
    String? time,
  }) {
    return Todo(
      title: title ?? this.title,
      decription: decription ?? this.decription,
      isDone: isDone ?? this.isDone,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }
}
