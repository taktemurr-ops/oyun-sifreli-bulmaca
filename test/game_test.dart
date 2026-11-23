import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_sifreli_bulmaca/oyun_sifreli_bulmaca.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(sifreliConfig.title.length, 33);
    expect(sifreliConfig.tagline.length, 33);
    for (final s in sifreliConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(sifreliConfig.gameId, sifreliId);
    expect(sifreliRules.gameId, sifreliId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(sifreliRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: sifreliId, optionalMechanics: sifreliRules.optionalMechanics);
    for (final l in ['tr', 'en']) {
      sifreliRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(sifreliRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}
