class Poetry {
  final int id;
  String name;
  String genre;
  String author;
  String dynasty;
  String content;
  String translatedText;
  int time;

  Poetry(this.id, this.name, this.genre, this.author, this.dynasty,
      this.content, this.translatedText, this.time);

  factory Poetry.fromJson(Map<String, dynamic> poetry) => Poetry(
      _toInt(poetry['id']),
      poetry['name'],
      poetry['genre'],
      poetry['author'],
      poetry['dynasty'],
      poetry['content'],
      poetry['translatedText'],
      poetry['time']);

  Map toJson() => {
        'id': id,
        'name': name,
        'genre': genre,
        'author': author,
        'dynasty': dynasty,
        'content': content,
        'translatedText': translatedText,
        'time': time
      };
}

int _toInt(id) => id is int ? id : int.parse(id);
