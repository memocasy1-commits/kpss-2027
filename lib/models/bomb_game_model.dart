class BombQuestion {
  final String id;
  final String statement;
  final bool isTrue;
  final String category; // 'tarih', 'cografya', 'vatandaslik'
  final String explanation; // Sınav odaklı açıklama / altın bilgi

  const BombQuestion({
    required this.id,
    required this.statement,
    required this.isTrue,
    required this.category,
    required this.explanation,
  });

  factory BombQuestion.fromJson(Map<String, dynamic> json) {
    return BombQuestion(
      id: json['id'] as String? ?? '',
      statement: json['statement'] as String? ?? '',
      isTrue: json['isTrue'] as bool? ?? false,
      category: json['category'] as String? ?? 'tarih',
      explanation: json['explanation'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'statement': statement,
    'isTrue': isTrue,
    'category': category,
    'explanation': explanation,
  };
}
