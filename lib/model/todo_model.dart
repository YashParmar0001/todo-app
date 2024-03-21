class Todo {
  final int id;
  final String text;
  final bool isDone;

  const Todo({
    required this.id,
    required this.text,
    required this.isDone,
  });

  @override
  String toString() {
    return 'Todo{ id: $id, text: $text, isDone: $isDone,}';
  }

  Todo copyWith({
    String? text,
    bool? isDone,
  }) {
    return Todo(
      id: id,
      text: text ?? this.text,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'text': text,
      'isDone': isDone,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] as int,
      text: map['text'] as String,
      isDone: map['isDone'] as bool,
    );
  }
}
