class ClueQuestion {
  final String id;
  final String category; // 'tarih', 'cografya', 'vatandaslik'
  final String title;
  final String clue1;
  final String clue2;
  final String clue3;
  final List<String> options;
  final String answer;
  final String explanation;

  const ClueQuestion({
    required this.id,
    required this.category,
    required this.title,
    required this.clue1,
    required this.clue2,
    required this.clue3,
    required this.options,
    required this.answer,
    required this.explanation,
  });

  factory ClueQuestion.fromJson(Map<String, dynamic> json) {
    return ClueQuestion(
      id: json['id'] as String? ?? '',
      category: json['category'] as String? ?? 'tarih',
      title: json['title'] as String? ?? '🔍 Gizemli Bilgi',
      clue1: json['clue1'] as String? ?? '',
      clue2: json['clue2'] as String? ?? '',
      clue3: json['clue3'] as String? ?? '',
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      answer: json['answer'] as String? ?? '',
      explanation: json['explanation'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'category': category,
        'title': title,
        'clue1': clue1,
        'clue2': clue2,
        'clue3': clue3,
        'options': options,
        'answer': answer,
        'explanation': explanation,
      };
}
