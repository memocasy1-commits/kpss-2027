class MatchingItem {
  final String id;
  final String category; // 'tarih', 'cografya', 'vatandaslik'
  final String prompt; // Eser, Olay, İlke, Şehir, Oluşum vb.
  final String match; // Yazar, Sonuç, Tanım, Mahkeme vb.
  final String explanation; // Altın Bilgi

  const MatchingItem({
    required this.id,
    required this.category,
    required this.prompt,
    required this.match,
    required this.explanation,
  });

  factory MatchingItem.fromJson(Map<String, dynamic> json) {
    return MatchingItem(
      id: json['id'] as String? ?? '',
      category: json['category'] as String? ?? 'tarih',
      prompt: json['prompt'] as String? ?? '',
      match: json['match'] as String? ?? '',
      explanation: json['explanation'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'category': category,
        'prompt': prompt,
        'match': match,
        'explanation': explanation,
      };
}
