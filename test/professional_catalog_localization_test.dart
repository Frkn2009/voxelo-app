import 'package:flutter_test/flutter_test.dart';
import 'package:voxelith/data/content/catalog.dart';
import 'package:voxelith/data/content/professional_catalog.dart';
import 'package:voxelith/data/models/models.dart';

void main() {
  final english = ProfessionalCatalog.build(LearnLang.en);
  for (final lang in [
    LearnLang.de,
    LearnLang.fr,
    LearnLang.es,
    LearnLang.nl,
    LearnLang.ar,
  ]) {
    test('${lang.name}: full source parity and catalog lookup', () {
      final scenarios = ProfessionalCatalog.build(lang);
      expect(scenarios.length, 8);
      final ids = <String>{};
      for (var i = 0; i < english.length; i++) {
        final base = english[i];
        final scene = scenarios[i];
        expect(scene.id, base.id.replaceFirst('en_', '${lang.name}_'));
        expect(ids.add(scene.id), isTrue);
        expect(scene.lang, lang);
        expect(scene.cefr, base.cefr);
        expect(scene.minutes, base.minutes);
        expect(scene.title(UiLang.tr), base.title(UiLang.tr));
        expect(scene.phrases.length, base.phrases.length);
        expect(scene.turns.length, base.turns.length);
        expect(scene.clipLine, scene.phrases.first.target);
        expect(Catalog.byId(scene.id)?.id, scene.id);
        for (var j = 0; j < scene.phrases.length; j++) {
          final phrase = scene.phrases[j];
          expect(
            phrase.id,
            base.phrases[j].id.replaceFirst('en_', '${lang.name}_'),
          );
          expect(ids.add(phrase.id), isTrue);
          expect(phrase.gloss, base.phrases[j].gloss);
          expect(phrase.target, isNot(base.phrases[j].target));
          expect(phrase.target.trim(), isNotEmpty);
          expect(Catalog.phraseById(phrase.id)?.target, phrase.target);
        }
        for (var j = 0; j < scene.turns.length; j++) {
          final turn = scene.turns[j];
          expect(scene.phrases.map((p) => p.target), contains(turn.expected));
          expect(turn.prompt, isNot(base.turns[j].prompt));
          expect(turn.scaffold == null, base.turns[j].scaffold == null);
          if (turn.scaffold != null) {
            expect(turn.scaffold, isNot(base.turns[j].scaffold));
          }
        }
        expect(scene.grammarNote == null, base.grammarNote == null);
        if (scene.grammarNote case final note?) {
          expect(note.ruleFor(UiLang.tr), isNotEmpty);
          expect(
            note.ruleFor(UiLang.tr),
            isNot(base.grammarNote!.ruleFor(UiLang.tr)),
          );
          expect(note.goodExample, isNot(note.badExample));
        }
      }
      expect(scenarios.expand((s) => s.phrases).length, 47);
    });
  }
  test('unsupported language keeps the existing empty result', () {
    expect(ProfessionalCatalog.build(LearnLang.ja), isEmpty);
  });
  test('English source networking exception is preserved', () {
    final networking = english.singleWhere((s) => s.id == 'en_pro_networking');
    expect(networking.phrases.length, 5);
    expect(networking.grammarNote, isNull);
  });
}
