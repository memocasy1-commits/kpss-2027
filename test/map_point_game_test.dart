import 'package:flutter_test/flutter_test.dart';
import 'package:kpss_soru_bankasi/data/map_point_game_data.dart';

void main() {
  group('MapPointGameData Tests', () {
    test('Question pool is loaded and contains 200 questions across all categories', () {
      expect(MapPointGameData.questions.length, equals(200));
      expect(MapPointGameData.categories.length, greaterThanOrEqualTo(7));
    });

    test('All questions have valid coordinates within Turkey bounding box', () {
      for (final q in MapPointGameData.questions) {
        expect(q.id.isNotEmpty, isTrue, reason: 'ID empty in ${q.targetName}');
        expect(q.targetName.isNotEmpty, isTrue, reason: 'Target name empty in ${q.id}');
        expect(q.question.isNotEmpty, isTrue, reason: 'Question prompt empty in ${q.id}');
        expect(q.explanation.isNotEmpty, isTrue, reason: 'Explanation empty in ${q.id}');

        // Lat: 35.8 to 42.2, Lon: 25.5 to 44.9
        expect(q.targetLat, inInclusiveRange(35.5, 42.5),
            reason: '${q.targetName} Lat out of range: ${q.targetLat}');
        expect(q.targetLon, inInclusiveRange(25.5, 45.0),
            reason: '${q.targetName} Lon out of range: ${q.targetLon}');

        // Norm coords should be between 0.0 and 1.0 (with slight tolerance)
        expect(q.normX, inInclusiveRange(0.0, 1.0),
            reason: '${q.targetName} normX out of bounds: ${q.normX}');
        expect(q.normY, inInclusiveRange(0.0, 1.0),
            reason: '${q.targetName} normY out of bounds: ${q.normY}');
      }
    });

    test('Haversine distance calculates reasonable distance between Ankara and Istanbul', () {
      // Ankara: ~39.93 Lat, 32.85 Lon
      // Istanbul: ~41.00 Lat, 28.97 Lon
      // Distance is ~350 km (as the crow flies)
      final dist = MapPointGameData.calculateDistanceKm(39.93, 32.85, 41.00, 28.97);
      expect(dist, inInclusiveRange(330.0, 370.0));
    });

    test('Coordinate projection inversion returns matching values', () {
      const originalLat = 39.93;
      const originalLon = 32.85;

      final normX = (originalLon - 25.66) / (44.82 - 25.66);
      final normY = (42.10 - originalLat) / (42.10 - 35.81);

      final recoveredLon = MapPointGameData.lonFromNormX(normX);
      final recoveredLat = MapPointGameData.latFromNormY(normY);

      expect(recoveredLon, closeTo(originalLon, 0.01));
      expect(recoveredLat, closeTo(originalLat, 0.01));
    });
  });
}
