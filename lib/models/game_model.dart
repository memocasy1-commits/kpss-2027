class ChronologyItem {
  final String id;
  final String title;
  final String yearOrEra;
  final int sortOrder; // Relative or absolute chronological index
  final String detail; // Gold key fact for KPSS
  final String category; // 'tarih', 'turkce', 'cografya', 'vatandaslik'

  const ChronologyItem({
    required this.id,
    required this.title,
    required this.yearOrEra,
    required this.sortOrder,
    required this.detail,
    required this.category,
  });
}

class ChronologyLevel {
  final String id;
  final String title;
  final String description;
  final String category; // 'tarih', 'turkce', 'cografya', 'vatandaslik'
  final String difficulty; // 'Kolay', 'Orta', 'Zor'
  final List<ChronologyItem> items; // Correctly sorted target order

  const ChronologyLevel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.difficulty,
    required this.items,
  });
}
