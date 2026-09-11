import 'i18n.dart';
import '../../data/models/models.dart';

/// Uses the existing I18n language -> English -> first-value fallback.
extension EditorialStrings on I18n {
  String get editorialEyebrow =>
      t({'tr': 'HER GÜN, BİRAZ DAHA', 'en': 'A LITTLE MORE, EVERY DAY'});
  String get editorialHomeTitle => t({
    'tr': 'Söyleyeceklerin\nbiriksin.',
    'en': 'Find the words\nfor your world.',
  });
  String get editorialHomeBody => t({
    'tr': 'Gerçek hayattan kısa derslerle kendi ritminde ilerle.',
    'en': 'Move at your own pace with short lessons from real life.',
  });
  String get editorialPath =>
      t({'tr': 'Ders akışın', 'en': 'Your lesson path'});
  String get editorialStart => t({'tr': 'Derse başla', 'en': 'Start lesson'});
  String get editorialReview =>
      t({'tr': 'Yeniden çalış', 'en': 'Practise again'});
  String get editorialDone => t({'tr': 'Tamamlandı', 'en': 'Completed'});
  String get editorialReady => t({'tr': 'Sıradaki adım', 'en': 'Next step'});
  String get editorialEmpty => t({
    'tr': 'Bu dil ve seviye için henüz ders yok.',
    'en': 'No lessons are available for this language and level yet.',
  });
  String get editorialCompleteTitle => t({
    'tr': 'Bir adım daha.\nSana ait.',
    'en': 'One more step.\nAll yours.',
  });
  String get editorialCompleteBody => t({
    'tr': 'Bugünkü emeğin, yarınki konuşmana dönüşecek.',
    'en': 'Today’s practice becomes tomorrow’s conversation.',
  });
  String get editorialHomeCta =>
      t({'tr': 'Ders akışına dön', 'en': 'Back to your lessons'});
  String get editorialOnboardingTitle => t({
    'tr': 'Yeni bir dil.\nKendi ritmin.',
    'en': 'A new language.\nYour own rhythm.',
  });
  String get editorialOnboardingBody => t({
    'tr': 'Kısa bir konuşmayla başla. Her gün kendine biraz daha alan aç.',
    'en':
        'Start with a short conversation. Make a little room for yourself each day.',
  });
  String get editorialUiLanguage =>
      t({'tr': 'Arayüz dili', 'en': 'Interface language'});
  String get editorialLearnLanguage => t({
    'tr': 'Hangi dili öğrenmek istersin?',
    'en': 'Which language would you like to learn?',
  });
  String get editorialLevel =>
      t({'tr': 'Şu anki seviyen', 'en': 'Your current level'});
  String get editorialBegin =>
      t({'tr': 'Yolculuğuma başla', 'en': 'Start my journey'});
  String get editorialSaving => t({'tr': 'Kaydediliyor', 'en': 'Saving'});
  String get editorialSaveError => t({
    'tr': 'Tercihlerin kaydedilemedi. Lütfen yeniden dene.',
    'en': 'Your preferences could not be saved. Please try again.',
  });
  String get editorialOnboardingNote => t({
    'tr': 'Seçimlerini daha sonra profilinden değiştirebilirsin.',
    'en': 'You can change these choices later in your profile.',
  });
  String editorialMinutes(int count) =>
      t({'tr': '$count dakika', 'en': '$count min'});
  String editorialXp(int count) => t({'tr': '+$count XP', 'en': '+$count XP'});
  String editorialPractised(int count) =>
      t({'tr': '$count ifade çalışıldı', 'en': '$count phrases practised'});
  String editorialProgress(int done, int total) => t({
    'tr': '$total dersin $done tanesi tamamlandı',
    'en': '$done of $total lessons completed',
  });
  String editorialLevelLabel(Cefr level) => switch (level) {
    Cefr.a1 => t({'tr': 'A1 · Yeni başlıyorum', 'en': 'A1 · Just starting'}),
    Cefr.a2 => t({
      'tr': 'A2 · Temelleri biliyorum',
      'en': 'A2 · I know the basics',
    }),
    Cefr.b1 => t({
      'tr': 'B1 · Sohbet edebiliyorum',
      'en': 'B1 · I can have a conversation',
    }),
    Cefr.b2 => t({
      'tr': 'B2 · Kendimi rahatça ifade ediyorum',
      'en': 'B2 · I express myself confidently',
    }),
  };
}
