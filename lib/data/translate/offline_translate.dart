import '../content/catalog.dart';
import '../models/models.dart';

enum TranslationOrigin { curriculum, dictionary, cloud }

class TranslationHit {
  const TranslationHit({
    required this.source,
    required this.target,
    required this.gloss,
    required this.confidence,
    required this.origin,
    this.scenarioId,
  });

  final String source;
  final String target;

  /// Diller arası güvenli pivot anlamı (müfredatta İngilizce açıklama).
  final String gloss;
  final double confidence;
  final TranslationOrigin origin;
  final String? scenarioId;
}

/// 30 dil arasında doğrulanmış müfredat ve sözlük verisiyle çeviri.
///
/// Serbest metin üretmez: giriş doğrulanmış bir sözlük girdisi veya müfredat
/// cümlesiyle eşleşmezse `null` döner. Müfredat cümleleri ortak İngilizce anlam
/// anahtarı üzerinden eşleştirildiği için 30×30 dil yönünün tamamı çalışır.
class OfflineTranslate {
  static TranslationHit? translate({
    required String input,
    required LearnLang from,
    required LearnLang to,
  }) {
    final query = _norm(input);
    if (query.isEmpty) return null;

    final dictionary = _dictionaryMatch(query, from);
    if (dictionary != null) {
      final translated = dictionary[to];
      if (translated == null) return null;
      return TranslationHit(
        source: input.trim(),
        target: translated,
        gloss: dictionary[LearnLang.en]!,
        confidence: 1,
        origin: TranslationOrigin.dictionary,
      );
    }

    final sourceMatch = _curriculumMatch(query, from);
    if (sourceMatch == null) return null;
    final targetMatch = _phraseForMeaning(sourceMatch.meaning, to);
    if (targetMatch == null) return null;

    return TranslationHit(
      source: sourceMatch.phrase.target,
      target: targetMatch.phrase.target,
      gloss: sourceMatch.meaning,
      confidence: sourceMatch.exact ? 1 : .86,
      origin: TranslationOrigin.curriculum,
      scenarioId: targetMatch.scenarioId,
    );
  }

  /// Eski çağrılar için uyumluluk: arayüz dilinden hedef öğrenme diline çevirir.
  static TranslationHit? lookup({
    required String input,
    required LearnLang learn,
    required UiLang ui,
  }) {
    final from = LearnLang.values.firstWhere(
      (language) => language.name == ui.name,
      orElse: () => LearnLang.en,
    );
    return translate(input: input, from: from, to: learn);
  }

  static List<String> suggestions(LearnLang language) => _dictionary
      .map((row) => row[language])
      .whereType<String>()
      .toList(growable: false);

  static Map<LearnLang, String>? _dictionaryMatch(
    String query,
    LearnLang from,
  ) {
    for (final row in _dictionary) {
      if (_norm(row[from] ?? '') == query) return row;
    }
    return null;
  }

  static _CurriculumMatch? _curriculumMatch(String query, LearnLang from) {
    _CurriculumMatch? partial;
    for (final scenario in Catalog.forLang(from)) {
      for (final phrase in scenario.phrases) {
        final target = _norm(phrase.target);
        final meaning = phrase.glossFor(UiLang.en);
        if (target == query) {
          return _CurriculumMatch(
            phrase: phrase,
            meaning: meaning,
            scenarioId: scenario.id,
            exact: true,
          );
        }
        // Kısa tek hecelerde yanlış eşleşmeyi önle. Kısmi eşleşme hiçbir zaman
        // yeni metin üretmez; yalnızca müfredattaki tam cümleyi döndürür.
        if (query.runes.length >= 3 && target.contains(query)) {
          partial ??= _CurriculumMatch(
            phrase: phrase,
            meaning: meaning,
            scenarioId: scenario.id,
            exact: false,
          );
        }
      }
    }
    return partial;
  }

  static _CurriculumMatch? _phraseForMeaning(
    String meaning,
    LearnLang language,
  ) {
    final normalizedMeaning = _norm(meaning);
    for (final scenario in Catalog.forLang(language)) {
      for (final phrase in scenario.phrases) {
        if (_norm(phrase.glossFor(UiLang.en)) == normalizedMeaning) {
          return _CurriculumMatch(
            phrase: phrase,
            meaning: meaning,
            scenarioId: scenario.id,
            exact: true,
          );
        }
      }
    }
    return null;
  }

  static String _norm(String value) => value
      .toLowerCase()
      .replaceAll(RegExp(r'[^\p{L}\p{N}\s]', unicode: true), ' ')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();

  /// İnsan tarafından doğrulanmış çekirdek seyahat sözlüğü. Her satırda 30
  /// dilin tamamı bulunur; eksik dil İngilizceyle doldurulmaz.
  static const List<Map<LearnLang, String>> _dictionary = [
    {
      LearnLang.en: 'hello',
      LearnLang.es: 'hola',
      LearnLang.de: 'hallo',
      LearnLang.fr: 'bonjour',
      LearnLang.nl: 'hallo',
      LearnLang.ar: 'مرحبا',
      LearnLang.pt: 'olá',
      LearnLang.it: 'ciao',
      LearnLang.ru: 'привет',
      LearnLang.zh: '你好',
      LearnLang.ja: 'こんにちは',
      LearnLang.ko: '안녕하세요',
      LearnLang.tr: 'merhaba',
      LearnLang.pl: 'cześć',
      LearnLang.sv: 'hej',
      LearnLang.da: 'hej',
      LearnLang.no: 'hei',
      LearnLang.fi: 'hei',
      LearnLang.el: 'γεια σας',
      LearnLang.cs: 'dobrý den',
      LearnLang.ro: 'bună',
      LearnLang.hu: 'szia',
      LearnLang.hi: 'नमस्ते',
      LearnLang.th: 'สวัสดี',
      LearnLang.vi: 'xin chào',
      LearnLang.id: 'halo',
      LearnLang.uk: 'привіт',
      LearnLang.he: 'שלום',
      LearnLang.fa: 'سلام',
      LearnLang.sw: 'jambo',
    },
    {
      LearnLang.en: 'please',
      LearnLang.es: 'por favor',
      LearnLang.de: 'bitte',
      LearnLang.fr: 's’il vous plaît',
      LearnLang.nl: 'alstublieft',
      LearnLang.ar: 'من فضلك',
      LearnLang.pt: 'por favor',
      LearnLang.it: 'per favore',
      LearnLang.ru: 'пожалуйста',
      LearnLang.zh: '请',
      LearnLang.ja: 'お願いします',
      LearnLang.ko: '부탁합니다',
      LearnLang.tr: 'lütfen',
      LearnLang.pl: 'proszę',
      LearnLang.sv: 'snälla',
      LearnLang.da: 'vær venlig',
      LearnLang.no: 'vær så snill',
      LearnLang.fi: 'ole hyvä',
      LearnLang.el: 'παρακαλώ',
      LearnLang.cs: 'prosím',
      LearnLang.ro: 'vă rog',
      LearnLang.hu: 'kérem',
      LearnLang.hi: 'कृपया',
      LearnLang.th: 'กรุณา',
      LearnLang.vi: 'làm ơn',
      LearnLang.id: 'tolong',
      LearnLang.uk: 'будь ласка',
      LearnLang.he: 'בבקשה',
      LearnLang.fa: 'لطفاً',
      LearnLang.sw: 'tafadhali',
    },
    {
      LearnLang.en: 'thank you',
      LearnLang.es: 'gracias',
      LearnLang.de: 'danke',
      LearnLang.fr: 'merci',
      LearnLang.nl: 'dank u',
      LearnLang.ar: 'شكرا',
      LearnLang.pt: 'obrigado',
      LearnLang.it: 'grazie',
      LearnLang.ru: 'спасибо',
      LearnLang.zh: '谢谢',
      LearnLang.ja: 'ありがとう',
      LearnLang.ko: '감사합니다',
      LearnLang.tr: 'teşekkürler',
      LearnLang.pl: 'dziękuję',
      LearnLang.sv: 'tack',
      LearnLang.da: 'tak',
      LearnLang.no: 'takk',
      LearnLang.fi: 'kiitos',
      LearnLang.el: 'ευχαριστώ',
      LearnLang.cs: 'děkuji',
      LearnLang.ro: 'mulțumesc',
      LearnLang.hu: 'köszönöm',
      LearnLang.hi: 'धन्यवाद',
      LearnLang.th: 'ขอบคุณ',
      LearnLang.vi: 'cảm ơn',
      LearnLang.id: 'terima kasih',
      LearnLang.uk: 'дякую',
      LearnLang.he: 'תודה',
      LearnLang.fa: 'ممنون',
      LearnLang.sw: 'asante',
    },
    {
      LearnLang.en: 'water',
      LearnLang.es: 'agua',
      LearnLang.de: 'wasser',
      LearnLang.fr: 'eau',
      LearnLang.nl: 'water',
      LearnLang.ar: 'ماء',
      LearnLang.pt: 'água',
      LearnLang.it: 'acqua',
      LearnLang.ru: 'вода',
      LearnLang.zh: '水',
      LearnLang.ja: '水',
      LearnLang.ko: '물',
      LearnLang.tr: 'su',
      LearnLang.pl: 'woda',
      LearnLang.sv: 'vatten',
      LearnLang.da: 'vand',
      LearnLang.no: 'vann',
      LearnLang.fi: 'vesi',
      LearnLang.el: 'νερό',
      LearnLang.cs: 'voda',
      LearnLang.ro: 'apă',
      LearnLang.hu: 'víz',
      LearnLang.hi: 'पानी',
      LearnLang.th: 'น้ำ',
      LearnLang.vi: 'nước',
      LearnLang.id: 'air',
      LearnLang.uk: 'вода',
      LearnLang.he: 'מים',
      LearnLang.fa: 'آب',
      LearnLang.sw: 'maji',
    },
    {
      LearnLang.en: 'help',
      LearnLang.es: 'ayuda',
      LearnLang.de: 'hilfe',
      LearnLang.fr: 'aide',
      LearnLang.nl: 'hulp',
      LearnLang.ar: 'مساعدة',
      LearnLang.pt: 'ajuda',
      LearnLang.it: 'aiuto',
      LearnLang.ru: 'помощь',
      LearnLang.zh: '帮助',
      LearnLang.ja: '助け',
      LearnLang.ko: '도움',
      LearnLang.tr: 'yardım',
      LearnLang.pl: 'pomoc',
      LearnLang.sv: 'hjälp',
      LearnLang.da: 'hjælp',
      LearnLang.no: 'hjelp',
      LearnLang.fi: 'apu',
      LearnLang.el: 'βοήθεια',
      LearnLang.cs: 'pomoc',
      LearnLang.ro: 'ajutor',
      LearnLang.hu: 'segítség',
      LearnLang.hi: 'मदद',
      LearnLang.th: 'ช่วยเหลือ',
      LearnLang.vi: 'giúp đỡ',
      LearnLang.id: 'bantuan',
      LearnLang.uk: 'допомога',
      LearnLang.he: 'עזרה',
      LearnLang.fa: 'کمک',
      LearnLang.sw: 'msaada',
    },
    {
      LearnLang.en: 'station',
      LearnLang.es: 'estación',
      LearnLang.de: 'bahnhof',
      LearnLang.fr: 'gare',
      LearnLang.nl: 'station',
      LearnLang.ar: 'محطة',
      LearnLang.pt: 'estação',
      LearnLang.it: 'stazione',
      LearnLang.ru: 'станция',
      LearnLang.zh: '车站',
      LearnLang.ja: '駅',
      LearnLang.ko: '역',
      LearnLang.tr: 'istasyon',
      LearnLang.pl: 'stacja',
      LearnLang.sv: 'station',
      LearnLang.da: 'station',
      LearnLang.no: 'stasjon',
      LearnLang.fi: 'asema',
      LearnLang.el: 'σταθμός',
      LearnLang.cs: 'nádraží',
      LearnLang.ro: 'stație',
      LearnLang.hu: 'állomás',
      LearnLang.hi: 'स्टेशन',
      LearnLang.th: 'สถานี',
      LearnLang.vi: 'nhà ga',
      LearnLang.id: 'stasiun',
      LearnLang.uk: 'станція',
      LearnLang.he: 'תחנה',
      LearnLang.fa: 'ایستگاه',
      LearnLang.sw: 'kituo',
    },
    // --- Sayılar 1-10 ---
    {LearnLang.en: 'one', LearnLang.es: 'uno', LearnLang.de: 'eins', LearnLang.fr: 'un', LearnLang.nl: 'een', LearnLang.ar: 'واحد', LearnLang.pt: 'um', LearnLang.it: 'uno', LearnLang.ru: 'один', LearnLang.zh: '一', LearnLang.ja: '一', LearnLang.ko: '일', LearnLang.tr: 'bir', LearnLang.pl: 'jeden', LearnLang.sv: 'ett', LearnLang.da: 'en', LearnLang.no: 'en', LearnLang.fi: 'yksi', LearnLang.el: 'ένα', LearnLang.cs: 'jeden', LearnLang.ro: 'unu', LearnLang.hu: 'egy', LearnLang.hi: 'एक', LearnLang.th: 'หนึ่ง', LearnLang.vi: 'một', LearnLang.id: 'satu', LearnLang.uk: 'один', LearnLang.he: 'אחת', LearnLang.fa: 'یک', LearnLang.sw: 'moja'},
    {LearnLang.en: 'two', LearnLang.es: 'dos', LearnLang.de: 'zwei', LearnLang.fr: 'deux', LearnLang.nl: 'twee', LearnLang.ar: 'اثنان', LearnLang.pt: 'dois', LearnLang.it: 'due', LearnLang.ru: 'два', LearnLang.zh: '二', LearnLang.ja: '二', LearnLang.ko: '이', LearnLang.tr: 'iki', LearnLang.pl: 'dwa', LearnLang.sv: 'två', LearnLang.da: 'to', LearnLang.no: 'to', LearnLang.fi: 'kaksi', LearnLang.el: 'δύο', LearnLang.cs: 'dva', LearnLang.ro: 'doi', LearnLang.hu: 'kettő', LearnLang.hi: 'दो', LearnLang.th: 'สอง', LearnLang.vi: 'hai', LearnLang.id: 'dua', LearnLang.uk: 'два', LearnLang.he: 'שתיים', LearnLang.fa: 'دو', LearnLang.sw: 'mbili'},
    {LearnLang.en: 'three', LearnLang.es: 'tres', LearnLang.de: 'drei', LearnLang.fr: 'trois', LearnLang.nl: 'drie', LearnLang.ar: 'ثلاثة', LearnLang.pt: 'três', LearnLang.it: 'tre', LearnLang.ru: 'три', LearnLang.zh: '三', LearnLang.ja: '三', LearnLang.ko: '삼', LearnLang.tr: 'üç', LearnLang.pl: 'trzy', LearnLang.sv: 'tre', LearnLang.da: 'tre', LearnLang.no: 'tre', LearnLang.fi: 'kolme', LearnLang.el: 'τρία', LearnLang.cs: 'tři', LearnLang.ro: 'trei', LearnLang.hu: 'három', LearnLang.hi: 'तीन', LearnLang.th: 'สาม', LearnLang.vi: 'ba', LearnLang.id: 'tiga', LearnLang.uk: 'три', LearnLang.he: 'שלוש', LearnLang.fa: 'سه', LearnLang.sw: 'tatu'},
    {LearnLang.en: 'four', LearnLang.es: 'cuatro', LearnLang.de: 'vier', LearnLang.fr: 'quatre', LearnLang.nl: 'vier', LearnLang.ar: 'أربعة', LearnLang.pt: 'quatro', LearnLang.it: 'quattro', LearnLang.ru: 'четыре', LearnLang.zh: '四', LearnLang.ja: '四', LearnLang.ko: '사', LearnLang.tr: 'dört', LearnLang.pl: 'cztery', LearnLang.sv: 'fyra', LearnLang.da: 'fire', LearnLang.no: 'fire', LearnLang.fi: 'neljä', LearnLang.el: 'τέσσερα', LearnLang.cs: 'čtyři', LearnLang.ro: 'patru', LearnLang.hu: 'négy', LearnLang.hi: 'चार', LearnLang.th: 'สี่', LearnLang.vi: 'bốn', LearnLang.id: 'empat', LearnLang.uk: 'чотири', LearnLang.he: 'ארבע', LearnLang.fa: 'چهار', LearnLang.sw: 'nne'},
    {LearnLang.en: 'five', LearnLang.es: 'cinco', LearnLang.de: 'fünf', LearnLang.fr: 'cinq', LearnLang.nl: 'vijf', LearnLang.ar: 'خمسة', LearnLang.pt: 'cinco', LearnLang.it: 'cinque', LearnLang.ru: 'пять', LearnLang.zh: '五', LearnLang.ja: '五', LearnLang.ko: '오', LearnLang.tr: 'beş', LearnLang.pl: 'pięć', LearnLang.sv: 'fem', LearnLang.da: 'fem', LearnLang.no: 'fem', LearnLang.fi: 'viisi', LearnLang.el: 'πέντε', LearnLang.cs: 'pět', LearnLang.ro: 'cinci', LearnLang.hu: 'öt', LearnLang.hi: 'पाँच', LearnLang.th: 'ห้า', LearnLang.vi: 'năm', LearnLang.id: 'lima', LearnLang.uk: 'п’ять', LearnLang.he: 'חמש', LearnLang.fa: 'پنج', LearnLang.sw: 'tano'},
    {LearnLang.en: 'six', LearnLang.es: 'seis', LearnLang.de: 'sechs', LearnLang.fr: 'six', LearnLang.nl: 'zes', LearnLang.ar: 'ستة', LearnLang.pt: 'seis', LearnLang.it: 'sei', LearnLang.ru: 'шесть', LearnLang.zh: '六', LearnLang.ja: '六', LearnLang.ko: '육', LearnLang.tr: 'altı', LearnLang.pl: 'sześć', LearnLang.sv: 'sex', LearnLang.da: 'seks', LearnLang.no: 'seks', LearnLang.fi: 'kuusi', LearnLang.el: 'έξι', LearnLang.cs: 'šest', LearnLang.ro: 'șase', LearnLang.hu: 'hat', LearnLang.hi: 'छह', LearnLang.th: 'หก', LearnLang.vi: 'sáu', LearnLang.id: 'enam', LearnLang.uk: 'шість', LearnLang.he: 'שש', LearnLang.fa: 'شش', LearnLang.sw: 'sita'},
    {LearnLang.en: 'seven', LearnLang.es: 'siete', LearnLang.de: 'sieben', LearnLang.fr: 'sept', LearnLang.nl: 'zeven', LearnLang.ar: 'سبعة', LearnLang.pt: 'sete', LearnLang.it: 'sette', LearnLang.ru: 'семь', LearnLang.zh: '七', LearnLang.ja: '七', LearnLang.ko: '칠', LearnLang.tr: 'yedi', LearnLang.pl: 'siedem', LearnLang.sv: 'sju', LearnLang.da: 'syv', LearnLang.no: 'sju', LearnLang.fi: 'seitsemän', LearnLang.el: 'εφτά', LearnLang.cs: 'sedm', LearnLang.ro: 'șapte', LearnLang.hu: 'hét', LearnLang.hi: 'सात', LearnLang.th: 'เจ็ด', LearnLang.vi: 'bảy', LearnLang.id: 'tujuh', LearnLang.uk: 'сім', LearnLang.he: 'שבע', LearnLang.fa: 'هفت', LearnLang.sw: 'saba'},
    {LearnLang.en: 'eight', LearnLang.es: 'ocho', LearnLang.de: 'acht', LearnLang.fr: 'huit', LearnLang.nl: 'acht', LearnLang.ar: 'ثمانية', LearnLang.pt: 'oito', LearnLang.it: 'otto', LearnLang.ru: 'восемь', LearnLang.zh: '八', LearnLang.ja: '八', LearnLang.ko: '팔', LearnLang.tr: 'sekiz', LearnLang.pl: 'osiem', LearnLang.sv: 'åtta', LearnLang.da: 'otte', LearnLang.no: 'åtte', LearnLang.fi: 'kahdeksan', LearnLang.el: 'οχτώ', LearnLang.cs: 'osm', LearnLang.ro: 'opt', LearnLang.hu: 'nyolc', LearnLang.hi: 'आठ', LearnLang.th: 'แปด', LearnLang.vi: 'tám', LearnLang.id: 'delapan', LearnLang.uk: 'вісім', LearnLang.he: 'שמונה', LearnLang.fa: 'هشت', LearnLang.sw: 'nane'},
    {LearnLang.en: 'nine', LearnLang.es: 'nueve', LearnLang.de: 'neun', LearnLang.fr: 'neuf', LearnLang.nl: 'negen', LearnLang.ar: 'تسعة', LearnLang.pt: 'nove', LearnLang.it: 'nove', LearnLang.ru: 'девять', LearnLang.zh: '九', LearnLang.ja: '九', LearnLang.ko: '구', LearnLang.tr: 'dokuz', LearnLang.pl: 'dziewięć', LearnLang.sv: 'nio', LearnLang.da: 'ni', LearnLang.no: 'ni', LearnLang.fi: 'yhdeksän', LearnLang.el: 'εννέα', LearnLang.cs: 'devět', LearnLang.ro: 'nouă', LearnLang.hu: 'kilenc', LearnLang.hi: 'नौ', LearnLang.th: 'เก้า', LearnLang.vi: 'chín', LearnLang.id: 'sembilan', LearnLang.uk: 'дев’ять', LearnLang.he: 'תשע', LearnLang.fa: 'نه', LearnLang.sw: 'tisa'},
    {LearnLang.en: 'ten', LearnLang.es: 'diez', LearnLang.de: 'zehn', LearnLang.fr: 'dix', LearnLang.nl: 'tien', LearnLang.ar: 'عشرة', LearnLang.pt: 'dez', LearnLang.it: 'dieci', LearnLang.ru: 'десять', LearnLang.zh: '十', LearnLang.ja: '十', LearnLang.ko: '십', LearnLang.tr: 'on', LearnLang.pl: 'dziesięć', LearnLang.sv: 'tio', LearnLang.da: 'ti', LearnLang.no: 'ti', LearnLang.fi: 'kymmenen', LearnLang.el: 'δέκα', LearnLang.cs: 'deset', LearnLang.ro: 'zece', LearnLang.hu: 'tíz', LearnLang.hi: 'दस', LearnLang.th: 'สิบ', LearnLang.vi: 'mười', LearnLang.id: 'sepuluh', LearnLang.uk: 'десять', LearnLang.he: 'עשר', LearnLang.fa: 'ده', LearnLang.sw: 'kumi'},
    // --- Haftanın günleri ---
    {LearnLang.en: 'Monday', LearnLang.es: 'lunes', LearnLang.de: 'Montag', LearnLang.fr: 'lundi', LearnLang.nl: 'maandag', LearnLang.ar: 'الاثنين', LearnLang.pt: 'segunda-feira', LearnLang.it: 'lunedì', LearnLang.ru: 'понедельник', LearnLang.zh: '星期一', LearnLang.ja: '月曜日', LearnLang.ko: '월요일', LearnLang.tr: 'pazartesi', LearnLang.pl: 'poniedziałek', LearnLang.sv: 'måndag', LearnLang.da: 'mandag', LearnLang.no: 'mandag', LearnLang.fi: 'maanantai', LearnLang.el: 'Δευτέρα', LearnLang.cs: 'pondělí', LearnLang.ro: 'luni', LearnLang.hu: 'hétfő', LearnLang.hi: 'सोमवार', LearnLang.th: 'วันจันทร์', LearnLang.vi: 'thứ hai', LearnLang.id: 'Senin', LearnLang.uk: 'понеділок', LearnLang.he: 'יום שני', LearnLang.fa: 'دوشنبه', LearnLang.sw: 'Jumatatu'},
    {LearnLang.en: 'Tuesday', LearnLang.es: 'martes', LearnLang.de: 'Dienstag', LearnLang.fr: 'mardi', LearnLang.nl: 'dinsdag', LearnLang.ar: 'الثلاثاء', LearnLang.pt: 'terça-feira', LearnLang.it: 'martedì', LearnLang.ru: 'вторник', LearnLang.zh: '星期二', LearnLang.ja: '火曜日', LearnLang.ko: '화요일', LearnLang.tr: 'salı', LearnLang.pl: 'wtorek', LearnLang.sv: 'tisdag', LearnLang.da: 'tirsdag', LearnLang.no: 'tirsdag', LearnLang.fi: 'tiistai', LearnLang.el: 'Τρίτη', LearnLang.cs: 'úterý', LearnLang.ro: 'marți', LearnLang.hu: 'kedd', LearnLang.hi: 'मंगलवार', LearnLang.th: 'วันอังคาร', LearnLang.vi: 'thứ ba', LearnLang.id: 'Selasa', LearnLang.uk: 'вівторок', LearnLang.he: 'יום שלישי', LearnLang.fa: 'سه‌شنبه', LearnLang.sw: 'Jumanne'},
    {LearnLang.en: 'Wednesday', LearnLang.es: 'miércoles', LearnLang.de: 'Mittwoch', LearnLang.fr: 'mercredi', LearnLang.nl: 'woensdag', LearnLang.ar: 'الأربعاء', LearnLang.pt: 'quarta-feira', LearnLang.it: 'mercoledì', LearnLang.ru: 'среда', LearnLang.zh: '星期三', LearnLang.ja: '水曜日', LearnLang.ko: '수요일', LearnLang.tr: 'çarşamba', LearnLang.pl: 'środa', LearnLang.sv: 'onsdag', LearnLang.da: 'onsdag', LearnLang.no: 'onsdag', LearnLang.fi: 'keskiviikko', LearnLang.el: 'Τετάρτη', LearnLang.cs: 'středa', LearnLang.ro: 'miercuri', LearnLang.hu: 'szerda', LearnLang.hi: 'बुधवार', LearnLang.th: 'วันพุธ', LearnLang.vi: 'thứ tư', LearnLang.id: 'Rabu', LearnLang.uk: 'середа', LearnLang.he: 'יום רביעי', LearnLang.fa: 'چهارشنبه', LearnLang.sw: 'Jumatano'},
    {LearnLang.en: 'Thursday', LearnLang.es: 'jueves', LearnLang.de: 'Donnerstag', LearnLang.fr: 'jeudi', LearnLang.nl: 'donderdag', LearnLang.ar: 'الخميس', LearnLang.pt: 'quinta-feira', LearnLang.it: 'giovedì', LearnLang.ru: 'четверг', LearnLang.zh: '星期四', LearnLang.ja: '木曜日', LearnLang.ko: '목요일', LearnLang.tr: 'perşembe', LearnLang.pl: 'czwartek', LearnLang.sv: 'torsdag', LearnLang.da: 'torsdag', LearnLang.no: 'torsdag', LearnLang.fi: 'torstai', LearnLang.el: 'Πέμπτη', LearnLang.cs: 'čtvrtek', LearnLang.ro: 'joi', LearnLang.hu: 'csütörtök', LearnLang.hi: 'गुरुवार', LearnLang.th: 'วันพฤหัสบดี', LearnLang.vi: 'thứ năm', LearnLang.id: 'Kamis', LearnLang.uk: 'четвер', LearnLang.he: 'יום חמישי', LearnLang.fa: 'پنجشنبه', LearnLang.sw: 'Alhamisi'},
    {LearnLang.en: 'Friday', LearnLang.es: 'viernes', LearnLang.de: 'Freitag', LearnLang.fr: 'vendredi', LearnLang.nl: 'vrijdag', LearnLang.ar: 'الجمعة', LearnLang.pt: 'sexta-feira', LearnLang.it: 'venerdì', LearnLang.ru: 'пятница', LearnLang.zh: '星期五', LearnLang.ja: '金曜日', LearnLang.ko: '금요일', LearnLang.tr: 'cuma', LearnLang.pl: 'piątek', LearnLang.sv: 'fredag', LearnLang.da: 'fredag', LearnLang.no: 'fredag', LearnLang.fi: 'perjantai', LearnLang.el: 'Παρασκευή', LearnLang.cs: 'pátek', LearnLang.ro: 'vineri', LearnLang.hu: 'péntek', LearnLang.hi: 'शुक्रवार', LearnLang.th: 'วันศุกร์', LearnLang.vi: 'thứ sáu', LearnLang.id: 'Jumat', LearnLang.uk: 'п’ятниця', LearnLang.he: 'יום שישי', LearnLang.fa: 'جمعه', LearnLang.sw: 'Ijumaa'},
    {LearnLang.en: 'Saturday', LearnLang.es: 'sábado', LearnLang.de: 'Samstag', LearnLang.fr: 'samedi', LearnLang.nl: 'zaterdag', LearnLang.ar: 'السبت', LearnLang.pt: 'sábado', LearnLang.it: 'sabato', LearnLang.ru: 'суббота', LearnLang.zh: '星期六', LearnLang.ja: '土曜日', LearnLang.ko: '토요일', LearnLang.tr: 'cumartesi', LearnLang.pl: 'sobota', LearnLang.sv: 'lördag', LearnLang.da: 'lørdag', LearnLang.no: 'lørdag', LearnLang.fi: 'lauantai', LearnLang.el: 'Σάββατο', LearnLang.cs: 'sobota', LearnLang.ro: 'sâmbătă', LearnLang.hu: 'szombat', LearnLang.hi: 'शनिवार', LearnLang.th: 'วันเสาร์', LearnLang.vi: 'thứ bảy', LearnLang.id: 'Sabtu', LearnLang.uk: 'субота', LearnLang.he: 'שבת', LearnLang.fa: 'شنبه', LearnLang.sw: 'Jumamosi'},
    {LearnLang.en: 'Sunday', LearnLang.es: 'domingo', LearnLang.de: 'Sonntag', LearnLang.fr: 'dimanche', LearnLang.nl: 'zondag', LearnLang.ar: 'الأحد', LearnLang.pt: 'domingo', LearnLang.it: 'domenica', LearnLang.ru: 'воскресенье', LearnLang.zh: '星期日', LearnLang.ja: '日曜日', LearnLang.ko: '일요일', LearnLang.tr: 'pazar', LearnLang.pl: 'niedziela', LearnLang.sv: 'söndag', LearnLang.da: 'søndag', LearnLang.no: 'søndag', LearnLang.fi: 'sunnuntai', LearnLang.el: 'Κυριακή', LearnLang.cs: 'neděle', LearnLang.ro: 'duminică', LearnLang.hu: 'vasárnap', LearnLang.hi: 'रविवार', LearnLang.th: 'วันอาทิตย์', LearnLang.vi: 'chủ nhật', LearnLang.id: 'Minggu', LearnLang.uk: 'неділя', LearnLang.he: 'יום ראשון', LearnLang.fa: 'یکشنبه', LearnLang.sw: 'Jumapili'},
    // --- Renkler ---
    {LearnLang.en: 'red', LearnLang.es: 'rojo', LearnLang.de: 'rot', LearnLang.fr: 'rouge', LearnLang.nl: 'rood', LearnLang.ar: 'أحمر', LearnLang.pt: 'vermelho', LearnLang.it: 'rosso', LearnLang.ru: 'красный', LearnLang.zh: '红色', LearnLang.ja: '赤', LearnLang.ko: '빨간색', LearnLang.tr: 'kırmızı', LearnLang.pl: 'czerwony', LearnLang.sv: 'röd', LearnLang.da: 'rød', LearnLang.no: 'rød', LearnLang.fi: 'punainen', LearnLang.el: 'κόκκινο', LearnLang.cs: 'červená', LearnLang.ro: 'roșu', LearnLang.hu: 'piros', LearnLang.hi: 'लाल', LearnLang.th: 'สีแดง', LearnLang.vi: 'đỏ', LearnLang.id: 'merah', LearnLang.uk: 'червоний', LearnLang.he: 'אדום', LearnLang.fa: 'قرمز', LearnLang.sw: 'nyekundu'},
    {LearnLang.en: 'blue', LearnLang.es: 'azul', LearnLang.de: 'blau', LearnLang.fr: 'bleu', LearnLang.nl: 'blauw', LearnLang.ar: 'أزرق', LearnLang.pt: 'azul', LearnLang.it: 'blu', LearnLang.ru: 'синий', LearnLang.zh: '蓝色', LearnLang.ja: '青', LearnLang.ko: '파란색', LearnLang.tr: 'mavi', LearnLang.pl: 'niebieski', LearnLang.sv: 'blå', LearnLang.da: 'blå', LearnLang.no: 'blå', LearnLang.fi: 'sininen', LearnLang.el: 'μπλε', LearnLang.cs: 'modrá', LearnLang.ro: 'albastru', LearnLang.hu: 'kék', LearnLang.hi: 'नीला', LearnLang.th: 'สีน้ำเงิน', LearnLang.vi: 'xanh dương', LearnLang.id: 'biru', LearnLang.uk: 'синій', LearnLang.he: 'כחול', LearnLang.fa: 'آبی', LearnLang.sw: 'buluu'},
    {LearnLang.en: 'green', LearnLang.es: 'verde', LearnLang.de: 'grün', LearnLang.fr: 'vert', LearnLang.nl: 'groen', LearnLang.ar: 'أخضر', LearnLang.pt: 'verde', LearnLang.it: 'verde', LearnLang.ru: 'зелёный', LearnLang.zh: '绿色', LearnLang.ja: '緑', LearnLang.ko: '초록색', LearnLang.tr: 'yeşil', LearnLang.pl: 'zielony', LearnLang.sv: 'grön', LearnLang.da: 'grøn', LearnLang.no: 'grønn', LearnLang.fi: 'vihreä', LearnLang.el: 'πράσινο', LearnLang.cs: 'zelená', LearnLang.ro: 'verde', LearnLang.hu: 'zöld', LearnLang.hi: 'हरा', LearnLang.th: 'สีเขียว', LearnLang.vi: 'xanh lá', LearnLang.id: 'hijau', LearnLang.uk: 'зелений', LearnLang.he: 'ירוק', LearnLang.fa: 'سبز', LearnLang.sw: 'kijani'},
    {LearnLang.en: 'yellow', LearnLang.es: 'amarillo', LearnLang.de: 'gelb', LearnLang.fr: 'jaune', LearnLang.nl: 'geel', LearnLang.ar: 'أصفر', LearnLang.pt: 'amarelo', LearnLang.it: 'giallo', LearnLang.ru: 'жёлтый', LearnLang.zh: '黄色', LearnLang.ja: '黄色', LearnLang.ko: '노란색', LearnLang.tr: 'sarı', LearnLang.pl: 'żółty', LearnLang.sv: 'gul', LearnLang.da: 'gul', LearnLang.no: 'gul', LearnLang.fi: 'keltainen', LearnLang.el: 'κίτρινο', LearnLang.cs: 'žlutá', LearnLang.ro: 'galben', LearnLang.hu: 'sárga', LearnLang.hi: 'पीला', LearnLang.th: 'สีเหลือง', LearnLang.vi: 'vàng', LearnLang.id: 'kuning', LearnLang.uk: 'жовтий', LearnLang.he: 'צהוב', LearnLang.fa: 'زرد', LearnLang.sw: 'njano'},
    {LearnLang.en: 'black', LearnLang.es: 'negro', LearnLang.de: 'schwarz', LearnLang.fr: 'noir', LearnLang.nl: 'zwart', LearnLang.ar: 'أسود', LearnLang.pt: 'preto', LearnLang.it: 'nero', LearnLang.ru: 'чёрный', LearnLang.zh: '黑色', LearnLang.ja: '黒', LearnLang.ko: '검정색', LearnLang.tr: 'siyah', LearnLang.pl: 'czarny', LearnLang.sv: 'svart', LearnLang.da: 'sort', LearnLang.no: 'svart', LearnLang.fi: 'musta', LearnLang.el: 'μαύρο', LearnLang.cs: 'černá', LearnLang.ro: 'negru', LearnLang.hu: 'fekete', LearnLang.hi: 'काला', LearnLang.th: 'สีดำ', LearnLang.vi: 'đen', LearnLang.id: 'hitam', LearnLang.uk: 'чорний', LearnLang.he: 'שחור', LearnLang.fa: 'سیاه', LearnLang.sw: 'nyeusi'},
    {LearnLang.en: 'white', LearnLang.es: 'blanco', LearnLang.de: 'weiß', LearnLang.fr: 'blanc', LearnLang.nl: 'wit', LearnLang.ar: 'أبيض', LearnLang.pt: 'branco', LearnLang.it: 'bianco', LearnLang.ru: 'белый', LearnLang.zh: '白色', LearnLang.ja: '白', LearnLang.ko: '흰색', LearnLang.tr: 'beyaz', LearnLang.pl: 'biały', LearnLang.sv: 'vit', LearnLang.da: 'hvid', LearnLang.no: 'hvit', LearnLang.fi: 'valkoinen', LearnLang.el: 'άσπρο', LearnLang.cs: 'bílá', LearnLang.ro: 'alb', LearnLang.hu: 'fehér', LearnLang.hi: 'सफ़ेद', LearnLang.th: 'สีขาว', LearnLang.vi: 'trắng', LearnLang.id: 'putih', LearnLang.uk: 'білий', LearnLang.he: 'לבן', LearnLang.fa: 'سفید', LearnLang.sw: 'nyeupe'},
    // --- Aile ---
    {LearnLang.en: 'mother', LearnLang.es: 'madre', LearnLang.de: 'Mutter', LearnLang.fr: 'mère', LearnLang.nl: 'moeder', LearnLang.ar: 'أم', LearnLang.pt: 'mãe', LearnLang.it: 'madre', LearnLang.ru: 'мать', LearnLang.zh: '母亲', LearnLang.ja: '母', LearnLang.ko: '어머니', LearnLang.tr: 'anne', LearnLang.pl: 'matka', LearnLang.sv: 'mor', LearnLang.da: 'mor', LearnLang.no: 'mor', LearnLang.fi: 'äiti', LearnLang.el: 'μητέρα', LearnLang.cs: 'matka', LearnLang.ro: 'mamă', LearnLang.hu: 'anya', LearnLang.hi: 'माँ', LearnLang.th: 'แม่', LearnLang.vi: 'mẹ', LearnLang.id: 'ibu', LearnLang.uk: 'мати', LearnLang.he: 'אמא', LearnLang.fa: 'مادر', LearnLang.sw: 'mama'},
    {LearnLang.en: 'father', LearnLang.es: 'padre', LearnLang.de: 'Vater', LearnLang.fr: 'père', LearnLang.nl: 'vader', LearnLang.ar: 'أب', LearnLang.pt: 'pai', LearnLang.it: 'padre', LearnLang.ru: 'отец', LearnLang.zh: '父亲', LearnLang.ja: '父', LearnLang.ko: '아버지', LearnLang.tr: 'baba', LearnLang.pl: 'ojciec', LearnLang.sv: 'far', LearnLang.da: 'far', LearnLang.no: 'far', LearnLang.fi: 'isä', LearnLang.el: 'πατέρας', LearnLang.cs: 'otec', LearnLang.ro: 'tată', LearnLang.hu: 'apa', LearnLang.hi: 'पिता', LearnLang.th: 'พ่อ', LearnLang.vi: 'bố', LearnLang.id: 'ayah', LearnLang.uk: 'батько', LearnLang.he: 'אבא', LearnLang.fa: 'پدر', LearnLang.sw: 'baba'},
    {LearnLang.en: 'brother', LearnLang.es: 'hermano', LearnLang.de: 'Bruder', LearnLang.fr: 'frère', LearnLang.nl: 'broer', LearnLang.ar: 'أخ', LearnLang.pt: 'irmão', LearnLang.it: 'fratello', LearnLang.ru: 'брат', LearnLang.zh: '兄弟', LearnLang.ja: '兄弟', LearnLang.ko: '형제', LearnLang.tr: 'erkek kardeş', LearnLang.pl: 'brat', LearnLang.sv: 'bror', LearnLang.da: 'bror', LearnLang.no: 'bror', LearnLang.fi: 'veli', LearnLang.el: 'αδελφός', LearnLang.cs: 'bratr', LearnLang.ro: 'frate', LearnLang.hu: 'fivér', LearnLang.hi: 'भाई', LearnLang.th: 'พี่ชาย', LearnLang.vi: 'anh trai', LearnLang.id: 'saudara laki-laki', LearnLang.uk: 'брат', LearnLang.he: 'אח', LearnLang.fa: 'برادر', LearnLang.sw: 'kaka'},
    {LearnLang.en: 'sister', LearnLang.es: 'hermana', LearnLang.de: 'Schwester', LearnLang.fr: 'sœur', LearnLang.nl: 'zus', LearnLang.ar: 'أخت', LearnLang.pt: 'irmã', LearnLang.it: 'sorella', LearnLang.ru: 'сестра', LearnLang.zh: '姐妹', LearnLang.ja: '姉妹', LearnLang.ko: '자매', LearnLang.tr: 'kız kardeş', LearnLang.pl: 'siostra', LearnLang.sv: 'syster', LearnLang.da: 'søster', LearnLang.no: 'søster', LearnLang.fi: 'sisar', LearnLang.el: 'αδελφή', LearnLang.cs: 'sestra', LearnLang.ro: 'soră', LearnLang.hu: 'nővér', LearnLang.hi: 'बहन', LearnLang.th: 'พี่สาว', LearnLang.vi: 'chị gái', LearnLang.id: 'saudara perempuan', LearnLang.uk: 'сестра', LearnLang.he: 'אחות', LearnLang.fa: 'خواهر', LearnLang.sw: 'dada'},
    // --- Soru kelimeleri ---
    {LearnLang.en: 'what', LearnLang.es: 'qué', LearnLang.de: 'was', LearnLang.fr: 'quoi', LearnLang.nl: 'wat', LearnLang.ar: 'ماذا', LearnLang.pt: 'o que', LearnLang.it: 'cosa', LearnLang.ru: 'что', LearnLang.zh: '什么', LearnLang.ja: '何', LearnLang.ko: '무엇', LearnLang.tr: 'ne', LearnLang.pl: 'co', LearnLang.sv: 'vad', LearnLang.da: 'hvad', LearnLang.no: 'hva', LearnLang.fi: 'mitä', LearnLang.el: 'τι', LearnLang.cs: 'co', LearnLang.ro: 'ce', LearnLang.hu: 'mi', LearnLang.hi: 'क्या', LearnLang.th: 'อะไร', LearnLang.vi: 'gì', LearnLang.id: 'apa', LearnLang.uk: 'що', LearnLang.he: 'מה', LearnLang.fa: 'چی', LearnLang.sw: 'nini'},
    {LearnLang.en: 'where', LearnLang.es: 'dónde', LearnLang.de: 'wo', LearnLang.fr: 'où', LearnLang.nl: 'waar', LearnLang.ar: 'أين', LearnLang.pt: 'onde', LearnLang.it: 'dove', LearnLang.ru: 'где', LearnLang.zh: '哪里', LearnLang.ja: 'どこ', LearnLang.ko: '어디', LearnLang.tr: 'nerede', LearnLang.pl: 'gdzie', LearnLang.sv: 'var', LearnLang.da: 'hvor', LearnLang.no: 'hvor', LearnLang.fi: 'missä', LearnLang.el: 'πού', LearnLang.cs: 'kde', LearnLang.ro: 'unde', LearnLang.hu: 'hol', LearnLang.hi: 'कहाँ', LearnLang.th: 'ที่ไหน', LearnLang.vi: 'ở đâu', LearnLang.id: 'di mana', LearnLang.uk: 'де', LearnLang.he: 'איפה', LearnLang.fa: 'کجا', LearnLang.sw: 'wapi'},
    {LearnLang.en: 'when', LearnLang.es: 'cuándo', LearnLang.de: 'wann', LearnLang.fr: 'quand', LearnLang.nl: 'wanneer', LearnLang.ar: 'متى', LearnLang.pt: 'quando', LearnLang.it: 'quando', LearnLang.ru: 'когда', LearnLang.zh: '什么时候', LearnLang.ja: 'いつ', LearnLang.ko: '언제', LearnLang.tr: 'ne zaman', LearnLang.pl: 'kiedy', LearnLang.sv: 'när', LearnLang.da: 'hvornår', LearnLang.no: 'når', LearnLang.fi: 'milloin', LearnLang.el: 'πότε', LearnLang.cs: 'kdy', LearnLang.ro: 'când', LearnLang.hu: 'mikor', LearnLang.hi: 'कब', LearnLang.th: 'เมื่อไหร่', LearnLang.vi: 'khi nào', LearnLang.id: 'kapan', LearnLang.uk: 'коли', LearnLang.he: 'מתי', LearnLang.fa: 'کی', LearnLang.sw: 'lini'},
    {LearnLang.en: 'who', LearnLang.es: 'quién', LearnLang.de: 'wer', LearnLang.fr: 'qui', LearnLang.nl: 'wie', LearnLang.ar: 'من', LearnLang.pt: 'quem', LearnLang.it: 'chi', LearnLang.ru: 'кто', LearnLang.zh: '谁', LearnLang.ja: '誰', LearnLang.ko: '누구', LearnLang.tr: 'kim', LearnLang.pl: 'kto', LearnLang.sv: 'vem', LearnLang.da: 'hvem', LearnLang.no: 'hvem', LearnLang.fi: 'kuka', LearnLang.el: 'ποιος', LearnLang.cs: 'kdo', LearnLang.ro: 'cine', LearnLang.hu: 'ki', LearnLang.hi: 'कौन', LearnLang.th: 'ใคร', LearnLang.vi: 'ai', LearnLang.id: 'siapa', LearnLang.uk: 'хто', LearnLang.he: 'מי', LearnLang.fa: 'چه کسی', LearnLang.sw: 'nani'},
    {LearnLang.en: 'why', LearnLang.es: 'por qué', LearnLang.de: 'warum', LearnLang.fr: 'pourquoi', LearnLang.nl: 'waarom', LearnLang.ar: 'لماذا', LearnLang.pt: 'por que', LearnLang.it: 'perché', LearnLang.ru: 'почему', LearnLang.zh: '为什么', LearnLang.ja: 'なぜ', LearnLang.ko: '왜', LearnLang.tr: 'neden', LearnLang.pl: 'dlaczego', LearnLang.sv: 'varför', LearnLang.da: 'hvorfor', LearnLang.no: 'hvorfor', LearnLang.fi: 'miksi', LearnLang.el: 'γιατί', LearnLang.cs: 'proč', LearnLang.ro: 'de ce', LearnLang.hu: 'miért', LearnLang.hi: 'क्यों', LearnLang.th: 'ทำไม', LearnLang.vi: 'tại sao', LearnLang.id: 'mengapa', LearnLang.uk: 'чому', LearnLang.he: 'למה', LearnLang.fa: 'چرا', LearnLang.sw: 'kwa nini'},
    {LearnLang.en: 'how', LearnLang.es: 'cómo', LearnLang.de: 'wie', LearnLang.fr: 'comment', LearnLang.nl: 'hoe', LearnLang.ar: 'كيف', LearnLang.pt: 'como', LearnLang.it: 'come', LearnLang.ru: 'как', LearnLang.zh: '怎么', LearnLang.ja: 'どう', LearnLang.ko: '어떻게', LearnLang.tr: 'nasıl', LearnLang.pl: 'jak', LearnLang.sv: 'hur', LearnLang.da: 'hvordan', LearnLang.no: 'hvordan', LearnLang.fi: 'miten', LearnLang.el: 'πώς', LearnLang.cs: 'jak', LearnLang.ro: 'cum', LearnLang.hu: 'hogyan', LearnLang.hi: 'कैसे', LearnLang.th: 'อย่างไร', LearnLang.vi: 'thế nào', LearnLang.id: 'bagaimana', LearnLang.uk: 'як', LearnLang.he: 'איך', LearnLang.fa: 'چطور', LearnLang.sw: 'vipi'},
    // --- Temel fiiller ---
    {LearnLang.en: 'eat', LearnLang.es: 'comer', LearnLang.de: 'essen', LearnLang.fr: 'manger', LearnLang.nl: 'eten', LearnLang.ar: 'يأكل', LearnLang.pt: 'comer', LearnLang.it: 'mangiare', LearnLang.ru: 'есть', LearnLang.zh: '吃', LearnLang.ja: '食べる', LearnLang.ko: '먹다', LearnLang.tr: 'yemek', LearnLang.pl: 'jeść', LearnLang.sv: 'äta', LearnLang.da: 'spise', LearnLang.no: 'spise', LearnLang.fi: 'syödä', LearnLang.el: 'τρώω', LearnLang.cs: 'jíst', LearnLang.ro: 'a mânca', LearnLang.hu: 'enni', LearnLang.hi: 'खाना', LearnLang.th: 'กิน', LearnLang.vi: 'ăn', LearnLang.id: 'makan', LearnLang.uk: 'їсти', LearnLang.he: 'לאכול', LearnLang.fa: 'خوردن', LearnLang.sw: 'kula'},
    {LearnLang.en: 'drink', LearnLang.es: 'beber', LearnLang.de: 'trinken', LearnLang.fr: 'boire', LearnLang.nl: 'drinken', LearnLang.ar: 'يشرب', LearnLang.pt: 'beber', LearnLang.it: 'bere', LearnLang.ru: 'пить', LearnLang.zh: '喝', LearnLang.ja: '飲む', LearnLang.ko: '마시다', LearnLang.tr: 'içmek', LearnLang.pl: 'pić', LearnLang.sv: 'dricka', LearnLang.da: 'drikke', LearnLang.no: 'drikke', LearnLang.fi: 'juoda', LearnLang.el: 'πίνω', LearnLang.cs: 'pít', LearnLang.ro: 'a bea', LearnLang.hu: 'inni', LearnLang.hi: 'पीना', LearnLang.th: 'ดื่ม', LearnLang.vi: 'uống', LearnLang.id: 'minum', LearnLang.uk: 'пити', LearnLang.he: 'לשתות', LearnLang.fa: 'نوشیدن', LearnLang.sw: 'kunywa'},
    {LearnLang.en: 'go', LearnLang.es: 'ir', LearnLang.de: 'gehen', LearnLang.fr: 'aller', LearnLang.nl: 'gaan', LearnLang.ar: 'يذهب', LearnLang.pt: 'ir', LearnLang.it: 'andare', LearnLang.ru: 'идти', LearnLang.zh: '去', LearnLang.ja: '行く', LearnLang.ko: '가다', LearnLang.tr: 'gitmek', LearnLang.pl: 'iść', LearnLang.sv: 'gå', LearnLang.da: 'gå', LearnLang.no: 'gå', LearnLang.fi: 'mennä', LearnLang.el: 'πηγαίνω', LearnLang.cs: 'jít', LearnLang.ro: 'a merge', LearnLang.hu: 'menni', LearnLang.hi: 'जाना', LearnLang.th: 'ไป', LearnLang.vi: 'đi', LearnLang.id: 'pergi', LearnLang.uk: 'йти', LearnLang.he: 'ללכת', LearnLang.fa: 'رفتن', LearnLang.sw: 'kwenda'},
    {LearnLang.en: 'come', LearnLang.es: 'venir', LearnLang.de: 'kommen', LearnLang.fr: 'venir', LearnLang.nl: 'komen', LearnLang.ar: 'يأتي', LearnLang.pt: 'vir', LearnLang.it: 'venire', LearnLang.ru: 'приходить', LearnLang.zh: '来', LearnLang.ja: '来る', LearnLang.ko: '오다', LearnLang.tr: 'gelmek', LearnLang.pl: 'przyjść', LearnLang.sv: 'komma', LearnLang.da: 'komme', LearnLang.no: 'komme', LearnLang.fi: 'tulla', LearnLang.el: 'έρχομαι', LearnLang.cs: 'přijít', LearnLang.ro: 'a veni', LearnLang.hu: 'jönni', LearnLang.hi: 'आना', LearnLang.th: 'มา', LearnLang.vi: 'đến', LearnLang.id: 'datang', LearnLang.uk: 'приходити', LearnLang.he: 'לבוא', LearnLang.fa: 'آمدن', LearnLang.sw: 'kuja'},
    {LearnLang.en: 'want', LearnLang.es: 'querer', LearnLang.de: 'wollen', LearnLang.fr: 'vouloir', LearnLang.nl: 'willen', LearnLang.ar: 'يريد', LearnLang.pt: 'querer', LearnLang.it: 'volere', LearnLang.ru: 'хотеть', LearnLang.zh: '想要', LearnLang.ja: '欲しい', LearnLang.ko: '원하다', LearnLang.tr: 'istemek', LearnLang.pl: 'chcieć', LearnLang.sv: 'vilja', LearnLang.da: 'ville', LearnLang.no: 'ville', LearnLang.fi: 'haluta', LearnLang.el: 'θέλω', LearnLang.cs: 'chtít', LearnLang.ro: 'a vrea', LearnLang.hu: 'akarni', LearnLang.hi: 'चाहना', LearnLang.th: 'ต้องการ', LearnLang.vi: 'muốn', LearnLang.id: 'mau', LearnLang.uk: 'хотіти', LearnLang.he: 'לרצות', LearnLang.fa: 'خواستن', LearnLang.sw: 'kutaka'},
    {LearnLang.en: 'need', LearnLang.es: 'necesitar', LearnLang.de: 'brauchen', LearnLang.fr: 'avoir besoin', LearnLang.nl: 'nodig hebben', LearnLang.ar: 'يحتاج', LearnLang.pt: 'precisar', LearnLang.it: 'avere bisogno', LearnLang.ru: 'нуждаться', LearnLang.zh: '需要', LearnLang.ja: '必要', LearnLang.ko: '필요하다', LearnLang.tr: 'ihtiyaç duymak', LearnLang.pl: 'potrzebować', LearnLang.sv: 'behöva', LearnLang.da: 'have brug for', LearnLang.no: 'trenge', LearnLang.fi: 'tarvita', LearnLang.el: 'χρειάζομαι', LearnLang.cs: 'potřebovat', LearnLang.ro: 'a avea nevoie', LearnLang.hu: 'szükség van', LearnLang.hi: 'ज़रूरत होना', LearnLang.th: 'จำเป็นต้องมี', LearnLang.vi: 'cần', LearnLang.id: 'butuh', LearnLang.uk: 'потребувати', LearnLang.he: 'להזדקק', LearnLang.fa: 'نیاز داشتن', LearnLang.sw: 'kuhitaji'},
    {LearnLang.en: 'see', LearnLang.es: 'ver', LearnLang.de: 'sehen', LearnLang.fr: 'voir', LearnLang.nl: 'zien', LearnLang.ar: 'يرى', LearnLang.pt: 'ver', LearnLang.it: 'vedere', LearnLang.ru: 'видеть', LearnLang.zh: '看', LearnLang.ja: '見る', LearnLang.ko: '보다', LearnLang.tr: 'görmek', LearnLang.pl: 'widzieć', LearnLang.sv: 'se', LearnLang.da: 'se', LearnLang.no: 'se', LearnLang.fi: 'nähdä', LearnLang.el: 'βλέπω', LearnLang.cs: 'vidět', LearnLang.ro: 'a vedea', LearnLang.hu: 'látni', LearnLang.hi: 'देखना', LearnLang.th: 'เห็น', LearnLang.vi: 'nhìn', LearnLang.id: 'lihat', LearnLang.uk: 'бачити', LearnLang.he: 'לראות', LearnLang.fa: 'دیدن', LearnLang.sw: 'kuona'},
    {LearnLang.en: 'speak', LearnLang.es: 'hablar', LearnLang.de: 'sprechen', LearnLang.fr: 'parler', LearnLang.nl: 'spreken', LearnLang.ar: 'يتكلم', LearnLang.pt: 'falar', LearnLang.it: 'parlare', LearnLang.ru: 'говорить', LearnLang.zh: '说', LearnLang.ja: '話す', LearnLang.ko: '말하다', LearnLang.tr: 'konuşmak', LearnLang.pl: 'mówić', LearnLang.sv: 'tala', LearnLang.da: 'tale', LearnLang.no: 'snakke', LearnLang.fi: 'puhua', LearnLang.el: 'μιλάω', LearnLang.cs: 'mluvit', LearnLang.ro: 'a vorbi', LearnLang.hu: 'beszélni', LearnLang.hi: 'बोलना', LearnLang.th: 'พูด', LearnLang.vi: 'nói', LearnLang.id: 'bicara', LearnLang.uk: 'говорити', LearnLang.he: 'לדבר', LearnLang.fa: 'صحبت کردن', LearnLang.sw: 'kuongea'},
    // --- Sıfatlar ---
    {LearnLang.en: 'good', LearnLang.es: 'bueno', LearnLang.de: 'gut', LearnLang.fr: 'bon', LearnLang.nl: 'goed', LearnLang.ar: 'جيد', LearnLang.pt: 'bom', LearnLang.it: 'buono', LearnLang.ru: 'хороший', LearnLang.zh: '好', LearnLang.ja: '良い', LearnLang.ko: '좋은', LearnLang.tr: 'iyi', LearnLang.pl: 'dobry', LearnLang.sv: 'bra', LearnLang.da: 'god', LearnLang.no: 'god', LearnLang.fi: 'hyvä', LearnLang.el: 'καλό', LearnLang.cs: 'dobrý', LearnLang.ro: 'bun', LearnLang.hu: 'jó', LearnLang.hi: 'अच्छा', LearnLang.th: 'ดี', LearnLang.vi: 'tốt', LearnLang.id: 'bagus', LearnLang.uk: 'хороший', LearnLang.he: 'טוב', LearnLang.fa: 'خوب', LearnLang.sw: 'nzuri'},
    {LearnLang.en: 'bad', LearnLang.es: 'malo', LearnLang.de: 'schlecht', LearnLang.fr: 'mauvais', LearnLang.nl: 'slecht', LearnLang.ar: 'سيء', LearnLang.pt: 'mau', LearnLang.it: 'cattivo', LearnLang.ru: 'плохой', LearnLang.zh: '坏', LearnLang.ja: '悪い', LearnLang.ko: '나쁜', LearnLang.tr: 'kötü', LearnLang.pl: 'zły', LearnLang.sv: 'dålig', LearnLang.da: 'dårlig', LearnLang.no: 'dårlig', LearnLang.fi: 'huono', LearnLang.el: 'κακό', LearnLang.cs: 'špatný', LearnLang.ro: 'rău', LearnLang.hu: 'rossz', LearnLang.hi: 'बुरा', LearnLang.th: 'แย่', LearnLang.vi: 'xấu', LearnLang.id: 'buruk', LearnLang.uk: 'поганий', LearnLang.he: 'רע', LearnLang.fa: 'بد', LearnLang.sw: 'mbaya'},
    {LearnLang.en: 'big', LearnLang.es: 'grande', LearnLang.de: 'groß', LearnLang.fr: 'grand', LearnLang.nl: 'groot', LearnLang.ar: 'كبير', LearnLang.pt: 'grande', LearnLang.it: 'grande', LearnLang.ru: 'большой', LearnLang.zh: '大', LearnLang.ja: '大きい', LearnLang.ko: '큰', LearnLang.tr: 'büyük', LearnLang.pl: 'duży', LearnLang.sv: 'stor', LearnLang.da: 'stor', LearnLang.no: 'stor', LearnLang.fi: 'iso', LearnLang.el: 'μεγάλο', LearnLang.cs: 'velký', LearnLang.ro: 'mare', LearnLang.hu: 'nagy', LearnLang.hi: 'बड़ा', LearnLang.th: 'ใหญ่', LearnLang.vi: 'lớn', LearnLang.id: 'besar', LearnLang.uk: 'великий', LearnLang.he: 'גדול', LearnLang.fa: 'بزرگ', LearnLang.sw: 'kubwa'},
    {LearnLang.en: 'small', LearnLang.es: 'pequeño', LearnLang.de: 'klein', LearnLang.fr: 'petit', LearnLang.nl: 'klein', LearnLang.ar: 'صغير', LearnLang.pt: 'pequeno', LearnLang.it: 'piccolo', LearnLang.ru: 'маленький', LearnLang.zh: '小', LearnLang.ja: '小さい', LearnLang.ko: '작은', LearnLang.tr: 'küçük', LearnLang.pl: 'mały', LearnLang.sv: 'liten', LearnLang.da: 'lille', LearnLang.no: 'liten', LearnLang.fi: 'pieni', LearnLang.el: 'μικρό', LearnLang.cs: 'malý', LearnLang.ro: 'mic', LearnLang.hu: 'kicsi', LearnLang.hi: 'छोटा', LearnLang.th: 'เล็ก', LearnLang.vi: 'nhỏ', LearnLang.id: 'kecil', LearnLang.uk: 'маленький', LearnLang.he: 'קטן', LearnLang.fa: 'کوچک', LearnLang.sw: 'ndogo'},
    {LearnLang.en: 'hot', LearnLang.es: 'caliente', LearnLang.de: 'heiß', LearnLang.fr: 'chaud', LearnLang.nl: 'heet', LearnLang.ar: 'حار', LearnLang.pt: 'quente', LearnLang.it: 'caldo', LearnLang.ru: 'горячий', LearnLang.zh: '热', LearnLang.ja: '熱い', LearnLang.ko: '뜨거운', LearnLang.tr: 'sıcak', LearnLang.pl: 'gorący', LearnLang.sv: 'varm', LearnLang.da: 'varm', LearnLang.no: 'varm', LearnLang.fi: 'kuuma', LearnLang.el: 'ζεστό', LearnLang.cs: 'horký', LearnLang.ro: 'fierbinte', LearnLang.hu: 'forró', LearnLang.hi: 'गरम', LearnLang.th: 'ร้อน', LearnLang.vi: 'nóng', LearnLang.id: 'panas', LearnLang.uk: 'гарячий', LearnLang.he: 'חם', LearnLang.fa: 'داغ', LearnLang.sw: 'moto'},
    {LearnLang.en: 'cold', LearnLang.es: 'frío', LearnLang.de: 'kalt', LearnLang.fr: 'froid', LearnLang.nl: 'koud', LearnLang.ar: 'بارد', LearnLang.pt: 'frio', LearnLang.it: 'freddo', LearnLang.ru: 'холодный', LearnLang.zh: '冷', LearnLang.ja: '冷たい', LearnLang.ko: '차가운', LearnLang.tr: 'soğuk', LearnLang.pl: 'zimny', LearnLang.sv: 'kall', LearnLang.da: 'kold', LearnLang.no: 'kald', LearnLang.fi: 'kylmä', LearnLang.el: 'κρύο', LearnLang.cs: 'studený', LearnLang.ro: 'rece', LearnLang.hu: 'hideg', LearnLang.hi: 'ठंडा', LearnLang.th: 'เย็น', LearnLang.vi: 'lạnh', LearnLang.id: 'dingin', LearnLang.uk: 'холодний', LearnLang.he: 'קר', LearnLang.fa: 'سرد', LearnLang.sw: 'baridi'},
    // --- Zaman ---
    {LearnLang.en: 'today', LearnLang.es: 'hoy', LearnLang.de: 'heute', LearnLang.fr: 'aujourd’hui', LearnLang.nl: 'vandaag', LearnLang.ar: 'اليوم', LearnLang.pt: 'hoje', LearnLang.it: 'oggi', LearnLang.ru: 'сегодня', LearnLang.zh: '今天', LearnLang.ja: '今日', LearnLang.ko: '오늘', LearnLang.tr: 'bugün', LearnLang.pl: 'dzisiaj', LearnLang.sv: 'idag', LearnLang.da: 'i dag', LearnLang.no: 'i dag', LearnLang.fi: 'tänään', LearnLang.el: 'σήμερα', LearnLang.cs: 'dnes', LearnLang.ro: 'azi', LearnLang.hu: 'ma', LearnLang.hi: 'आज', LearnLang.th: 'วันนี้', LearnLang.vi: 'hôm nay', LearnLang.id: 'hari ini', LearnLang.uk: 'сьогодні', LearnLang.he: 'היום', LearnLang.fa: 'امروز', LearnLang.sw: 'leo'},
    {LearnLang.en: 'tomorrow', LearnLang.es: 'mañana', LearnLang.de: 'morgen', LearnLang.fr: 'demain', LearnLang.nl: 'morgen', LearnLang.ar: 'غدا', LearnLang.pt: 'amanhã', LearnLang.it: 'domani', LearnLang.ru: 'завтра', LearnLang.zh: '明天', LearnLang.ja: '明日', LearnLang.ko: '내일', LearnLang.tr: 'yarın', LearnLang.pl: 'jutro', LearnLang.sv: 'imorgon', LearnLang.da: 'i morgen', LearnLang.no: 'i morgen', LearnLang.fi: 'huomenna', LearnLang.el: 'αύριο', LearnLang.cs: 'zítra', LearnLang.ro: 'mâine', LearnLang.hu: 'holnap', LearnLang.hi: 'कल', LearnLang.th: 'พรุ่งนี้', LearnLang.vi: 'ngày mai', LearnLang.id: 'besok', LearnLang.uk: 'завтра', LearnLang.he: 'מחר', LearnLang.fa: 'فردا', LearnLang.sw: 'kesho'},
    {LearnLang.en: 'yesterday', LearnLang.es: 'ayer', LearnLang.de: 'gestern', LearnLang.fr: 'hier', LearnLang.nl: 'gisteren', LearnLang.ar: 'أمس', LearnLang.pt: 'ontem', LearnLang.it: 'ieri', LearnLang.ru: 'вчера', LearnLang.zh: '昨天', LearnLang.ja: '昨日', LearnLang.ko: '어제', LearnLang.tr: 'dün', LearnLang.pl: 'wczoraj', LearnLang.sv: 'igår', LearnLang.da: 'i går', LearnLang.no: 'i går', LearnLang.fi: 'eilen', LearnLang.el: 'χθες', LearnLang.cs: 'včera', LearnLang.ro: 'ieri', LearnLang.hu: 'tegnap', LearnLang.hi: 'कल', LearnLang.th: 'เมื่อวาน', LearnLang.vi: 'hôm qua', LearnLang.id: 'kemarin', LearnLang.uk: 'вчора', LearnLang.he: 'אתמול', LearnLang.fa: 'دیروز', LearnLang.sw: 'jana'},
    // --- Zamirler ---
    {LearnLang.en: 'I', LearnLang.es: 'yo', LearnLang.de: 'ich', LearnLang.fr: 'je', LearnLang.nl: 'ik', LearnLang.ar: 'أنا', LearnLang.pt: 'eu', LearnLang.it: 'io', LearnLang.ru: 'я', LearnLang.zh: '我', LearnLang.ja: '私', LearnLang.ko: '나', LearnLang.tr: 'ben', LearnLang.pl: 'ja', LearnLang.sv: 'jag', LearnLang.da: 'jeg', LearnLang.no: 'jeg', LearnLang.fi: 'minä', LearnLang.el: 'εγώ', LearnLang.cs: 'já', LearnLang.ro: 'eu', LearnLang.hu: 'én', LearnLang.hi: 'मैं', LearnLang.th: 'ฉัน', LearnLang.vi: 'tôi', LearnLang.id: 'saya', LearnLang.uk: 'я', LearnLang.he: 'אני', LearnLang.fa: 'من', LearnLang.sw: 'mimi'},
    {LearnLang.en: 'you', LearnLang.es: 'tú', LearnLang.de: 'du', LearnLang.fr: 'tu', LearnLang.nl: 'jij', LearnLang.ar: 'أنت', LearnLang.pt: 'tu', LearnLang.it: 'tu', LearnLang.ru: 'ты', LearnLang.zh: '你', LearnLang.ja: 'あなた', LearnLang.ko: '너', LearnLang.tr: 'sen', LearnLang.pl: 'ty', LearnLang.sv: 'du', LearnLang.da: 'du', LearnLang.no: 'du', LearnLang.fi: 'sinä', LearnLang.el: 'εσύ', LearnLang.cs: 'ty', LearnLang.ro: 'tu', LearnLang.hu: 'te', LearnLang.hi: 'तुम', LearnLang.th: 'คุณ', LearnLang.vi: 'bạn', LearnLang.id: 'kamu', LearnLang.uk: 'ти', LearnLang.he: 'אתה', LearnLang.fa: 'تو', LearnLang.sw: 'wewe'},
    {LearnLang.en: 'he', LearnLang.es: 'él', LearnLang.de: 'er', LearnLang.fr: 'il', LearnLang.nl: 'hij', LearnLang.ar: 'هو', LearnLang.pt: 'ele', LearnLang.it: 'lui', LearnLang.ru: 'он', LearnLang.zh: '他', LearnLang.ja: '彼', LearnLang.ko: '그', LearnLang.tr: 'o', LearnLang.pl: 'on', LearnLang.sv: 'han', LearnLang.da: 'han', LearnLang.no: 'han', LearnLang.fi: 'hän', LearnLang.el: 'αυτός', LearnLang.cs: 'on', LearnLang.ro: 'el', LearnLang.hu: 'ő', LearnLang.hi: 'वह', LearnLang.th: 'เขา', LearnLang.vi: 'anh ấy', LearnLang.id: 'dia', LearnLang.uk: 'він', LearnLang.he: 'הוא', LearnLang.fa: 'او', LearnLang.sw: 'yeye'},
    {LearnLang.en: 'she', LearnLang.es: 'ella', LearnLang.de: 'sie', LearnLang.fr: 'elle', LearnLang.nl: 'zij', LearnLang.ar: 'هي', LearnLang.pt: 'ela', LearnLang.it: 'lei', LearnLang.ru: 'она', LearnLang.zh: '她', LearnLang.ja: '彼女', LearnLang.ko: '그녀', LearnLang.tr: 'o', LearnLang.pl: 'ona', LearnLang.sv: 'hon', LearnLang.da: 'hun', LearnLang.no: 'hun', LearnLang.fi: 'hän', LearnLang.el: 'αυτή', LearnLang.cs: 'ona', LearnLang.ro: 'ea', LearnLang.hu: 'ő', LearnLang.hi: 'वह', LearnLang.th: 'เธอ', LearnLang.vi: 'cô ấy', LearnLang.id: 'dia', LearnLang.uk: 'вона', LearnLang.he: 'היא', LearnLang.fa: 'او', LearnLang.sw: 'yeye'},
    {LearnLang.en: 'we', LearnLang.es: 'nosotros', LearnLang.de: 'wir', LearnLang.fr: 'nous', LearnLang.nl: 'wij', LearnLang.ar: 'نحن', LearnLang.pt: 'nós', LearnLang.it: 'noi', LearnLang.ru: 'мы', LearnLang.zh: '我们', LearnLang.ja: '私たち', LearnLang.ko: '우리', LearnLang.tr: 'biz', LearnLang.pl: 'my', LearnLang.sv: 'vi', LearnLang.da: 'vi', LearnLang.no: 'vi', LearnLang.fi: 'me', LearnLang.el: 'εμείς', LearnLang.cs: 'my', LearnLang.ro: 'noi', LearnLang.hu: 'mi', LearnLang.hi: 'हम', LearnLang.th: 'เรา', LearnLang.vi: 'chúng tôi', LearnLang.id: 'kami', LearnLang.uk: 'ми', LearnLang.he: 'אנחנו', LearnLang.fa: 'ما', LearnLang.sw: 'sisi'},
    {LearnLang.en: 'they', LearnLang.es: 'ellos', LearnLang.de: 'sie', LearnLang.fr: 'ils', LearnLang.nl: 'zij', LearnLang.ar: 'هم', LearnLang.pt: 'eles', LearnLang.it: 'loro', LearnLang.ru: 'они', LearnLang.zh: '他们', LearnLang.ja: '彼ら', LearnLang.ko: '그들', LearnLang.tr: 'onlar', LearnLang.pl: 'oni', LearnLang.sv: 'de', LearnLang.da: 'de', LearnLang.no: 'de', LearnLang.fi: 'he', LearnLang.el: 'αυτοί', LearnLang.cs: 'oni', LearnLang.ro: 'ei', LearnLang.hu: 'ők', LearnLang.hi: 'वे', LearnLang.th: 'พวกเขา', LearnLang.vi: 'họ', LearnLang.id: 'mereka', LearnLang.uk: 'вони', LearnLang.he: 'הם', LearnLang.fa: 'آنها', LearnLang.sw: 'wao'},
    // --- İsimler ---
    {LearnLang.en: 'house', LearnLang.es: 'casa', LearnLang.de: 'Haus', LearnLang.fr: 'maison', LearnLang.nl: 'huis', LearnLang.ar: 'بيت', LearnLang.pt: 'casa', LearnLang.it: 'casa', LearnLang.ru: 'дом', LearnLang.zh: '家', LearnLang.ja: '家', LearnLang.ko: '집', LearnLang.tr: 'ev', LearnLang.pl: 'dom', LearnLang.sv: 'hus', LearnLang.da: 'hus', LearnLang.no: 'hus', LearnLang.fi: 'talo', LearnLang.el: 'σπίτι', LearnLang.cs: 'dům', LearnLang.ro: 'casă', LearnLang.hu: 'ház', LearnLang.hi: 'घर', LearnLang.th: 'บ้าน', LearnLang.vi: 'nhà', LearnLang.id: 'rumah', LearnLang.uk: 'дім', LearnLang.he: 'בית', LearnLang.fa: 'خانه', LearnLang.sw: 'nyumba'},
    {LearnLang.en: 'food', LearnLang.es: 'comida', LearnLang.de: 'Essen', LearnLang.fr: 'nourriture', LearnLang.nl: 'eten', LearnLang.ar: 'طعام', LearnLang.pt: 'comida', LearnLang.it: 'cibo', LearnLang.ru: 'еда', LearnLang.zh: '食物', LearnLang.ja: '食べ物', LearnLang.ko: '음식', LearnLang.tr: 'yemek', LearnLang.pl: 'jedzenie', LearnLang.sv: 'mat', LearnLang.da: 'mad', LearnLang.no: 'mat', LearnLang.fi: 'ruoka', LearnLang.el: 'φαγητό', LearnLang.cs: 'jídlo', LearnLang.ro: 'mâncare', LearnLang.hu: 'étel', LearnLang.hi: 'खाना', LearnLang.th: 'อาหาร', LearnLang.vi: 'thức ăn', LearnLang.id: 'makanan', LearnLang.uk: 'їжа', LearnLang.he: 'אוכל', LearnLang.fa: 'غذا', LearnLang.sw: 'chakula'},
    {LearnLang.en: 'book', LearnLang.es: 'libro', LearnLang.de: 'Buch', LearnLang.fr: 'livre', LearnLang.nl: 'boek', LearnLang.ar: 'كتاب', LearnLang.pt: 'livro', LearnLang.it: 'libro', LearnLang.ru: 'книга', LearnLang.zh: '书', LearnLang.ja: '本', LearnLang.ko: '책', LearnLang.tr: 'kitap', LearnLang.pl: 'książka', LearnLang.sv: 'bok', LearnLang.da: 'bog', LearnLang.no: 'bok', LearnLang.fi: 'kirja', LearnLang.el: 'βιβλίο', LearnLang.cs: 'kniha', LearnLang.ro: 'carte', LearnLang.hu: 'könyv', LearnLang.hi: 'किताब', LearnLang.th: 'หนังสือ', LearnLang.vi: 'sách', LearnLang.id: 'buku', LearnLang.uk: 'книга', LearnLang.he: 'ספר', LearnLang.fa: 'کتاب', LearnLang.sw: 'kitabu'},
    {LearnLang.en: 'car', LearnLang.es: 'coche', LearnLang.de: 'Auto', LearnLang.fr: 'voiture', LearnLang.nl: 'auto', LearnLang.ar: 'سيارة', LearnLang.pt: 'carro', LearnLang.it: 'macchina', LearnLang.ru: 'машина', LearnLang.zh: '车', LearnLang.ja: '車', LearnLang.ko: '차', LearnLang.tr: 'araba', LearnLang.pl: 'samochód', LearnLang.sv: 'bil', LearnLang.da: 'bil', LearnLang.no: 'bil', LearnLang.fi: 'auto', LearnLang.el: 'αυτοκίνητο', LearnLang.cs: 'auto', LearnLang.ro: 'mașină', LearnLang.hu: 'autó', LearnLang.hi: 'कार', LearnLang.th: 'รถ', LearnLang.vi: 'xe', LearnLang.id: 'mobil', LearnLang.uk: 'машина', LearnLang.he: 'מכונית', LearnLang.fa: 'ماشین', LearnLang.sw: 'gari'},
    {LearnLang.en: 'money', LearnLang.es: 'dinero', LearnLang.de: 'Geld', LearnLang.fr: 'argent', LearnLang.nl: 'geld', LearnLang.ar: 'مال', LearnLang.pt: 'dinheiro', LearnLang.it: 'soldi', LearnLang.ru: 'деньги', LearnLang.zh: '钱', LearnLang.ja: 'お金', LearnLang.ko: '돈', LearnLang.tr: 'para', LearnLang.pl: 'pieniądze', LearnLang.sv: 'pengar', LearnLang.da: 'penge', LearnLang.no: 'penger', LearnLang.fi: 'raha', LearnLang.el: 'χρήματα', LearnLang.cs: 'peníze', LearnLang.ro: 'bani', LearnLang.hu: 'pénz', LearnLang.hi: 'पैसा', LearnLang.th: 'เงิน', LearnLang.vi: 'tiền', LearnLang.id: 'uang', LearnLang.uk: 'гроші', LearnLang.he: 'כסף', LearnLang.fa: 'پول', LearnLang.sw: 'pesa'},
    {LearnLang.en: 'city', LearnLang.es: 'ciudad', LearnLang.de: 'Stadt', LearnLang.fr: 'ville', LearnLang.nl: 'stad', LearnLang.ar: 'مدينة', LearnLang.pt: 'cidade', LearnLang.it: 'città', LearnLang.ru: 'город', LearnLang.zh: '城市', LearnLang.ja: '町', LearnLang.ko: '도시', LearnLang.tr: 'şehir', LearnLang.pl: 'miasto', LearnLang.sv: 'stad', LearnLang.da: 'by', LearnLang.no: 'by', LearnLang.fi: 'kaupunki', LearnLang.el: 'πόλη', LearnLang.cs: 'město', LearnLang.ro: 'oraș', LearnLang.hu: 'város', LearnLang.hi: 'शहर', LearnLang.th: 'เมือง', LearnLang.vi: 'thành phố', LearnLang.id: 'kota', LearnLang.uk: 'місто', LearnLang.he: 'עיר', LearnLang.fa: 'شهر', LearnLang.sw: 'jiji'},
    {LearnLang.en: 'country', LearnLang.es: 'país', LearnLang.de: 'Land', LearnLang.fr: 'pays', LearnLang.nl: 'land', LearnLang.ar: 'بلد', LearnLang.pt: 'país', LearnLang.it: 'paese', LearnLang.ru: 'страна', LearnLang.zh: '国家', LearnLang.ja: '国', LearnLang.ko: '나라', LearnLang.tr: 'ülke', LearnLang.pl: 'kraj', LearnLang.sv: 'land', LearnLang.da: 'land', LearnLang.no: 'land', LearnLang.fi: 'maa', LearnLang.el: 'χώρα', LearnLang.cs: 'země', LearnLang.ro: 'țară', LearnLang.hu: 'ország', LearnLang.hi: 'देश', LearnLang.th: 'ประเทศ', LearnLang.vi: 'đất nước', LearnLang.id: 'negara', LearnLang.uk: 'країна', LearnLang.he: 'מדינה', LearnLang.fa: 'کشور', LearnLang.sw: 'nchi'},
    {LearnLang.en: 'person', LearnLang.es: 'persona', LearnLang.de: 'Person', LearnLang.fr: 'personne', LearnLang.nl: 'persoon', LearnLang.ar: 'شخص', LearnLang.pt: 'pessoa', LearnLang.it: 'persona', LearnLang.ru: 'человек', LearnLang.zh: '人', LearnLang.ja: '人', LearnLang.ko: '사람', LearnLang.tr: 'kişi', LearnLang.pl: 'osoba', LearnLang.sv: 'person', LearnLang.da: 'person', LearnLang.no: 'person', LearnLang.fi: 'henkilö', LearnLang.el: 'άτομο', LearnLang.cs: 'osoba', LearnLang.ro: 'persoană', LearnLang.hu: 'személy', LearnLang.hi: 'व्यक्ति', LearnLang.th: 'คน', LearnLang.vi: 'người', LearnLang.id: 'orang', LearnLang.uk: 'людина', LearnLang.he: 'אדם', LearnLang.fa: 'شخص', LearnLang.sw: 'mtu'},
    {LearnLang.en: 'name', LearnLang.es: 'nombre', LearnLang.de: 'Name', LearnLang.fr: 'nom', LearnLang.nl: 'naam', LearnLang.ar: 'اسم', LearnLang.pt: 'nome', LearnLang.it: 'nome', LearnLang.ru: 'имя', LearnLang.zh: '名字', LearnLang.ja: '名前', LearnLang.ko: '이름', LearnLang.tr: 'isim', LearnLang.pl: 'imię', LearnLang.sv: 'namn', LearnLang.da: 'navn', LearnLang.no: 'navn', LearnLang.fi: 'nimi', LearnLang.el: 'όνομα', LearnLang.cs: 'jméno', LearnLang.ro: 'nume', LearnLang.hu: 'név', LearnLang.hi: 'नाम', LearnLang.th: 'ชื่อ', LearnLang.vi: 'tên', LearnLang.id: 'nama', LearnLang.uk: 'ім’я', LearnLang.he: 'שם', LearnLang.fa: 'اسم', LearnLang.sw: 'jina'},
    {LearnLang.en: 'teacher', LearnLang.es: 'profesor', LearnLang.de: 'Lehrer', LearnLang.fr: 'professeur', LearnLang.nl: 'leraar', LearnLang.ar: 'معلم', LearnLang.pt: 'professor', LearnLang.it: 'insegnante', LearnLang.ru: 'учитель', LearnLang.zh: '老师', LearnLang.ja: '先生', LearnLang.ko: '선생님', LearnLang.tr: 'öğretmen', LearnLang.pl: 'nauczyciel', LearnLang.sv: 'lärare', LearnLang.da: 'lærer', LearnLang.no: 'lærer', LearnLang.fi: 'opettaja', LearnLang.el: 'δάσκαλος', LearnLang.cs: 'učitel', LearnLang.ro: 'profesor', LearnLang.hu: 'tanár', LearnLang.hi: 'शिक्षक', LearnLang.th: 'ครู', LearnLang.vi: 'giáo viên', LearnLang.id: 'guru', LearnLang.uk: 'вчитель', LearnLang.he: 'מורה', LearnLang.fa: 'معلم', LearnLang.sw: 'mwalimu'},
    {LearnLang.en: 'child', LearnLang.es: 'niño', LearnLang.de: 'Kind', LearnLang.fr: 'enfant', LearnLang.nl: 'kind', LearnLang.ar: 'طفل', LearnLang.pt: 'criança', LearnLang.it: 'bambino', LearnLang.ru: 'ребёнок', LearnLang.zh: '孩子', LearnLang.ja: '子供', LearnLang.ko: '아이', LearnLang.tr: 'çocuk', LearnLang.pl: 'dziecko', LearnLang.sv: 'barn', LearnLang.da: 'barn', LearnLang.no: 'barn', LearnLang.fi: 'lapsi', LearnLang.el: 'παιδί', LearnLang.cs: 'dítě', LearnLang.ro: 'copil', LearnLang.hu: 'gyerek', LearnLang.hi: 'बच्चा', LearnLang.th: 'เด็ก', LearnLang.vi: 'trẻ em', LearnLang.id: 'anak', LearnLang.uk: 'дитина', LearnLang.he: 'ילד', LearnLang.fa: 'بچه', LearnLang.sw: 'mtoto'},
    {LearnLang.en: 'friend', LearnLang.es: 'amigo', LearnLang.de: 'Freund', LearnLang.fr: 'ami', LearnLang.nl: 'vriend', LearnLang.ar: 'صديق', LearnLang.pt: 'amigo', LearnLang.it: 'amico', LearnLang.ru: 'друг', LearnLang.zh: '朋友', LearnLang.ja: '友達', LearnLang.ko: '친구', LearnLang.tr: 'arkadaş', LearnLang.pl: 'przyjaciel', LearnLang.sv: 'vän', LearnLang.da: 'ven', LearnLang.no: 'venn', LearnLang.fi: 'ystävä', LearnLang.el: 'φίλος', LearnLang.cs: 'přítel', LearnLang.ro: 'prieten', LearnLang.hu: 'barát', LearnLang.hi: 'दोस्त', LearnLang.th: 'เพื่อน', LearnLang.vi: 'bạn bè', LearnLang.id: 'teman', LearnLang.uk: 'друг', LearnLang.he: 'חבר', LearnLang.fa: 'دوست', LearnLang.sw: 'rafiki'},
    // --- Fiiller ---
    {LearnLang.en: 'be', LearnLang.es: 'ser', LearnLang.de: 'sein', LearnLang.fr: 'être', LearnLang.nl: 'zijn', LearnLang.ar: 'يكون', LearnLang.pt: 'ser', LearnLang.it: 'essere', LearnLang.ru: 'быть', LearnLang.zh: '是', LearnLang.ja: 'です', LearnLang.ko: '이다', LearnLang.tr: 'olmak', LearnLang.pl: 'być', LearnLang.sv: 'vara', LearnLang.da: 'være', LearnLang.no: 'være', LearnLang.fi: 'olla', LearnLang.el: 'είμαι', LearnLang.cs: 'být', LearnLang.ro: 'a fi', LearnLang.hu: 'lenni', LearnLang.hi: 'होना', LearnLang.th: 'เป็น', LearnLang.vi: 'là', LearnLang.id: 'menjadi', LearnLang.uk: 'бути', LearnLang.he: 'להיות', LearnLang.fa: 'بودن', LearnLang.sw: 'kuwa'},
    {LearnLang.en: 'do', LearnLang.es: 'hacer', LearnLang.de: 'machen', LearnLang.fr: 'faire', LearnLang.nl: 'doen', LearnLang.ar: 'يفعل', LearnLang.pt: 'fazer', LearnLang.it: 'fare', LearnLang.ru: 'делать', LearnLang.zh: '做', LearnLang.ja: 'する', LearnLang.ko: '하다', LearnLang.tr: 'yapmak', LearnLang.pl: 'robić', LearnLang.sv: 'göra', LearnLang.da: 'gøre', LearnLang.no: 'gjøre', LearnLang.fi: 'tehdä', LearnLang.el: 'κάνω', LearnLang.cs: 'dělat', LearnLang.ro: 'a face', LearnLang.hu: 'csinálni', LearnLang.hi: 'करना', LearnLang.th: 'ทำ', LearnLang.vi: 'làm', LearnLang.id: 'melakukan', LearnLang.uk: 'робити', LearnLang.he: 'לעשות', LearnLang.fa: 'انجام دادن', LearnLang.sw: 'kufanya'},
    {LearnLang.en: 'know', LearnLang.es: 'saber', LearnLang.de: 'wissen', LearnLang.fr: 'savoir', LearnLang.nl: 'weten', LearnLang.ar: 'يعرف', LearnLang.pt: 'saber', LearnLang.it: 'sapere', LearnLang.ru: 'знать', LearnLang.zh: '知道', LearnLang.ja: '知る', LearnLang.ko: '알다', LearnLang.tr: 'bilmek', LearnLang.pl: 'wiedzieć', LearnLang.sv: 'veta', LearnLang.da: 'vide', LearnLang.no: 'vite', LearnLang.fi: 'tietää', LearnLang.el: 'ξέρω', LearnLang.cs: 'vědět', LearnLang.ro: 'a ști', LearnLang.hu: 'tudni', LearnLang.hi: 'जानना', LearnLang.th: 'รู้', LearnLang.vi: 'biết', LearnLang.id: 'tahu', LearnLang.uk: 'знати', LearnLang.he: 'לדעת', LearnLang.fa: 'دانستن', LearnLang.sw: 'kujua'},
    {LearnLang.en: 'think', LearnLang.es: 'pensar', LearnLang.de: 'denken', LearnLang.fr: 'penser', LearnLang.nl: 'denken', LearnLang.ar: 'يفكر', LearnLang.pt: 'pensar', LearnLang.it: 'pensare', LearnLang.ru: 'думать', LearnLang.zh: '想', LearnLang.ja: '思う', LearnLang.ko: '생각하다', LearnLang.tr: 'düşünmek', LearnLang.pl: 'myśleć', LearnLang.sv: 'tänka', LearnLang.da: 'tænke', LearnLang.no: 'tenke', LearnLang.fi: 'ajatella', LearnLang.el: 'σκέφτομαι', LearnLang.cs: 'myslet', LearnLang.ro: 'a gândi', LearnLang.hu: 'gondolni', LearnLang.hi: 'सोचना', LearnLang.th: 'คิด', LearnLang.vi: 'nghĩ', LearnLang.id: 'berpikir', LearnLang.uk: 'думати', LearnLang.he: 'לחשוב', LearnLang.fa: 'فکر کردن', LearnLang.sw: 'kufikiri'},
    {LearnLang.en: 'say', LearnLang.es: 'decir', LearnLang.de: 'sagen', LearnLang.fr: 'dire', LearnLang.nl: 'zeggen', LearnLang.ar: 'يقول', LearnLang.pt: 'dizer', LearnLang.it: 'dire', LearnLang.ru: 'сказать', LearnLang.zh: '说', LearnLang.ja: '言う', LearnLang.ko: '말하다', LearnLang.tr: 'söylemek', LearnLang.pl: 'powiedzieć', LearnLang.sv: 'säga', LearnLang.da: 'sige', LearnLang.no: 'si', LearnLang.fi: 'sanoa', LearnLang.el: 'λέω', LearnLang.cs: 'říct', LearnLang.ro: 'a spune', LearnLang.hu: 'mondani', LearnLang.hi: 'कहना', LearnLang.th: 'พูด', LearnLang.vi: 'nói', LearnLang.id: 'mengatakan', LearnLang.uk: 'сказати', LearnLang.he: 'לומר', LearnLang.fa: 'گفتن', LearnLang.sw: 'kusema'},
    {LearnLang.en: 'sleep', LearnLang.es: 'dormir', LearnLang.de: 'schlafen', LearnLang.fr: 'dormir', LearnLang.nl: 'slapen', LearnLang.ar: 'ينام', LearnLang.pt: 'dormir', LearnLang.it: 'dormire', LearnLang.ru: 'спать', LearnLang.zh: '睡', LearnLang.ja: '寝る', LearnLang.ko: '자다', LearnLang.tr: 'uyumak', LearnLang.pl: 'spać', LearnLang.sv: 'sova', LearnLang.da: 'sove', LearnLang.no: 'sove', LearnLang.fi: 'nukkua', LearnLang.el: 'κοιμάμαι', LearnLang.cs: 'spát', LearnLang.ro: 'a dormi', LearnLang.hu: 'aludni', LearnLang.hi: 'सोना', LearnLang.th: 'นอน', LearnLang.vi: 'ngủ', LearnLang.id: 'tidur', LearnLang.uk: 'спати', LearnLang.he: 'לישון', LearnLang.fa: 'خوابیدن', LearnLang.sw: 'kulala'},
    {LearnLang.en: 'work', LearnLang.es: 'trabajar', LearnLang.de: 'arbeiten', LearnLang.fr: 'travailler', LearnLang.nl: 'werken', LearnLang.ar: 'يعمل', LearnLang.pt: 'trabalhar', LearnLang.it: 'lavorare', LearnLang.ru: 'работать', LearnLang.zh: '工作', LearnLang.ja: '働く', LearnLang.ko: '일하다', LearnLang.tr: 'çalışmak', LearnLang.pl: 'pracować', LearnLang.sv: 'arbeta', LearnLang.da: 'arbejde', LearnLang.no: 'jobbe', LearnLang.fi: 'työskennellä', LearnLang.el: 'δουλεύω', LearnLang.cs: 'pracovat', LearnLang.ro: 'a munci', LearnLang.hu: 'dolgozni', LearnLang.hi: 'काम करना', LearnLang.th: 'ทำงาน', LearnLang.vi: 'làm việc', LearnLang.id: 'bekerja', LearnLang.uk: 'працювати', LearnLang.he: 'לעבוד', LearnLang.fa: 'کار کردن', LearnLang.sw: 'kufanya kazi'},
    {LearnLang.en: 'read', LearnLang.es: 'leer', LearnLang.de: 'lesen', LearnLang.fr: 'lire', LearnLang.nl: 'lezen', LearnLang.ar: 'يقرأ', LearnLang.pt: 'ler', LearnLang.it: 'leggere', LearnLang.ru: 'читать', LearnLang.zh: '读', LearnLang.ja: '読む', LearnLang.ko: '읽다', LearnLang.tr: 'okumak', LearnLang.pl: 'czytać', LearnLang.sv: 'läsa', LearnLang.da: 'læse', LearnLang.no: 'lese', LearnLang.fi: 'lukea', LearnLang.el: 'διαβάζω', LearnLang.cs: 'číst', LearnLang.ro: 'a citi', LearnLang.hu: 'olvasni', LearnLang.hi: 'पढ़ना', LearnLang.th: 'อ่าน', LearnLang.vi: 'đọc', LearnLang.id: 'membaca', LearnLang.uk: 'читати', LearnLang.he: 'לקרוא', LearnLang.fa: 'خواندن', LearnLang.sw: 'kusoma'},
    {LearnLang.en: 'write', LearnLang.es: 'escribir', LearnLang.de: 'schreiben', LearnLang.fr: 'écrire', LearnLang.nl: 'schrijven', LearnLang.ar: 'يكتب', LearnLang.pt: 'escrever', LearnLang.it: 'scrivere', LearnLang.ru: 'писать', LearnLang.zh: '写', LearnLang.ja: '書く', LearnLang.ko: '쓰다', LearnLang.tr: 'yazmak', LearnLang.pl: 'pisać', LearnLang.sv: 'skriva', LearnLang.da: 'skrive', LearnLang.no: 'skrive', LearnLang.fi: 'kirjoittaa', LearnLang.el: 'γράφω', LearnLang.cs: 'psát', LearnLang.ro: 'a scrie', LearnLang.hu: 'írni', LearnLang.hi: 'लिखना', LearnLang.th: 'เขียน', LearnLang.vi: 'viết', LearnLang.id: 'menulis', LearnLang.uk: 'писати', LearnLang.he: 'לכתוב', LearnLang.fa: 'نوشتن', LearnLang.sw: 'kuandika'},
    {LearnLang.en: 'listen', LearnLang.es: 'escuchar', LearnLang.de: 'hören', LearnLang.fr: 'écouter', LearnLang.nl: 'luisteren', LearnLang.ar: 'يستمع', LearnLang.pt: 'ouvir', LearnLang.it: 'ascoltare', LearnLang.ru: 'слушать', LearnLang.zh: '听', LearnLang.ja: '聞く', LearnLang.ko: '듣다', LearnLang.tr: 'dinlemek', LearnLang.pl: 'słuchać', LearnLang.sv: 'lyssna', LearnLang.da: 'lytte', LearnLang.no: 'høre', LearnLang.fi: 'kuunnella', LearnLang.el: 'ακούω', LearnLang.cs: 'poslouchat', LearnLang.ro: 'a asculta', LearnLang.hu: 'hallgatni', LearnLang.hi: 'सुनना', LearnLang.th: 'ฟัง', LearnLang.vi: 'nghe', LearnLang.id: 'mendengarkan', LearnLang.uk: 'слухати', LearnLang.he: 'להקשיב', LearnLang.fa: 'گوش دادن', LearnLang.sw: 'kusikiliza'},
    {LearnLang.en: 'love', LearnLang.es: 'amar', LearnLang.de: 'lieben', LearnLang.fr: 'aimer', LearnLang.nl: 'houden van', LearnLang.ar: 'يحب', LearnLang.pt: 'amar', LearnLang.it: 'amare', LearnLang.ru: 'любить', LearnLang.zh: '爱', LearnLang.ja: '愛する', LearnLang.ko: '사랑하다', LearnLang.tr: 'sevmek', LearnLang.pl: 'kochać', LearnLang.sv: 'älska', LearnLang.da: 'elske', LearnLang.no: 'elske', LearnLang.fi: 'rakastaa', LearnLang.el: 'αγαπώ', LearnLang.cs: 'milovat', LearnLang.ro: 'a iubi', LearnLang.hu: 'szeretni', LearnLang.hi: 'प्यार करना', LearnLang.th: 'รัก', LearnLang.vi: 'yêu', LearnLang.id: 'mencintai', LearnLang.uk: 'любити', LearnLang.he: 'לאהוב', LearnLang.fa: 'دوست داشتن', LearnLang.sw: 'kupenda'},
    // --- Sıfatlar ---
    {LearnLang.en: 'new', LearnLang.es: 'nuevo', LearnLang.de: 'neu', LearnLang.fr: 'nouveau', LearnLang.nl: 'nieuw', LearnLang.ar: 'جديد', LearnLang.pt: 'novo', LearnLang.it: 'nuovo', LearnLang.ru: 'новый', LearnLang.zh: '新', LearnLang.ja: '新しい', LearnLang.ko: '새로운', LearnLang.tr: 'yeni', LearnLang.pl: 'nowy', LearnLang.sv: 'ny', LearnLang.da: 'ny', LearnLang.no: 'ny', LearnLang.fi: 'uusi', LearnLang.el: 'νέο', LearnLang.cs: 'nový', LearnLang.ro: 'nou', LearnLang.hu: 'új', LearnLang.hi: 'नया', LearnLang.th: 'ใหม่', LearnLang.vi: 'mới', LearnLang.id: 'baru', LearnLang.uk: 'новий', LearnLang.he: 'חדש', LearnLang.fa: 'جدید', LearnLang.sw: 'mpya'},
    {LearnLang.en: 'old', LearnLang.es: 'viejo', LearnLang.de: 'alt', LearnLang.fr: 'vieux', LearnLang.nl: 'oud', LearnLang.ar: 'قديم', LearnLang.pt: 'velho', LearnLang.it: 'vecchio', LearnLang.ru: 'старый', LearnLang.zh: '旧', LearnLang.ja: '古い', LearnLang.ko: '오래된', LearnLang.tr: 'eski', LearnLang.pl: 'stary', LearnLang.sv: 'gammal', LearnLang.da: 'gammel', LearnLang.no: 'gammel', LearnLang.fi: 'vanha', LearnLang.el: 'παλιό', LearnLang.cs: 'starý', LearnLang.ro: 'vechi', LearnLang.hu: 'régi', LearnLang.hi: 'पुराना', LearnLang.th: 'เก่า', LearnLang.vi: 'cũ', LearnLang.id: 'lama', LearnLang.uk: 'старий', LearnLang.he: 'ישן', LearnLang.fa: 'قدیمی', LearnLang.sw: 'zamani'},
    {LearnLang.en: 'beautiful', LearnLang.es: 'bonito', LearnLang.de: 'schön', LearnLang.fr: 'beau', LearnLang.nl: 'mooi', LearnLang.ar: 'جميل', LearnLang.pt: 'bonito', LearnLang.it: 'bello', LearnLang.ru: 'красивый', LearnLang.zh: '漂亮', LearnLang.ja: '美しい', LearnLang.ko: '예쁜', LearnLang.tr: 'güzel', LearnLang.pl: 'piękny', LearnLang.sv: 'vacker', LearnLang.da: 'smuk', LearnLang.no: 'vakker', LearnLang.fi: 'kaunis', LearnLang.el: 'όμορφο', LearnLang.cs: 'krásný', LearnLang.ro: 'frumos', LearnLang.hu: 'szép', LearnLang.hi: 'सुंदर', LearnLang.th: 'สวย', LearnLang.vi: 'đẹp', LearnLang.id: 'cantik', LearnLang.uk: 'гарний', LearnLang.he: 'יפה', LearnLang.fa: 'زیبا', LearnLang.sw: 'mzuri'},
    {LearnLang.en: 'easy', LearnLang.es: 'fácil', LearnLang.de: 'einfach', LearnLang.fr: 'facile', LearnLang.nl: 'makkelijk', LearnLang.ar: 'سهل', LearnLang.pt: 'fácil', LearnLang.it: 'facile', LearnLang.ru: 'лёгкий', LearnLang.zh: '容易', LearnLang.ja: '簡単', LearnLang.ko: '쉬운', LearnLang.tr: 'kolay', LearnLang.pl: 'łatwy', LearnLang.sv: 'lätt', LearnLang.da: 'let', LearnLang.no: 'lett', LearnLang.fi: 'helppo', LearnLang.el: 'εύκολο', LearnLang.cs: 'snadný', LearnLang.ro: 'ușor', LearnLang.hu: 'könnyű', LearnLang.hi: 'आसान', LearnLang.th: 'ง่าย', LearnLang.vi: 'dễ', LearnLang.id: 'mudah', LearnLang.uk: 'легкий', LearnLang.he: 'קל', LearnLang.fa: 'آسان', LearnLang.sw: 'rahisi'},
    {LearnLang.en: 'difficult', LearnLang.es: 'difícil', LearnLang.de: 'schwierig', LearnLang.fr: 'difficile', LearnLang.nl: 'moeilijk', LearnLang.ar: 'صعب', LearnLang.pt: 'difícil', LearnLang.it: 'difficile', LearnLang.ru: 'трудный', LearnLang.zh: '难', LearnLang.ja: '難しい', LearnLang.ko: '어려운', LearnLang.tr: 'zor', LearnLang.pl: 'trudny', LearnLang.sv: 'svår', LearnLang.da: 'svær', LearnLang.no: 'vanskelig', LearnLang.fi: 'vaikea', LearnLang.el: 'δύσκολο', LearnLang.cs: 'těžký', LearnLang.ro: 'dificil', LearnLang.hu: 'nehéz', LearnLang.hi: 'मुश्किल', LearnLang.th: 'ยาก', LearnLang.vi: 'khó', LearnLang.id: 'sulit', LearnLang.uk: 'важкий', LearnLang.he: 'קשה', LearnLang.fa: 'سخت', LearnLang.sw: 'ngumu'},
    {LearnLang.en: 'fast', LearnLang.es: 'rápido', LearnLang.de: 'schnell', LearnLang.fr: 'rapide', LearnLang.nl: 'snel', LearnLang.ar: 'سريع', LearnLang.pt: 'rápido', LearnLang.it: 'veloce', LearnLang.ru: 'быстрый', LearnLang.zh: '快', LearnLang.ja: '速い', LearnLang.ko: '빠른', LearnLang.tr: 'hızlı', LearnLang.pl: 'szybki', LearnLang.sv: 'snabb', LearnLang.da: 'hurtig', LearnLang.no: 'rask', LearnLang.fi: 'nopea', LearnLang.el: 'γρήγορο', LearnLang.cs: 'rychlý', LearnLang.ro: 'rapid', LearnLang.hu: 'gyors', LearnLang.hi: 'तेज़', LearnLang.th: 'เร็ว', LearnLang.vi: 'nhanh', LearnLang.id: 'cepat', LearnLang.uk: 'швидкий', LearnLang.he: 'מהיר', LearnLang.fa: 'سریع', LearnLang.sw: 'haraka'},
    {LearnLang.en: 'slow', LearnLang.es: 'lento', LearnLang.de: 'langsam', LearnLang.fr: 'lent', LearnLang.nl: 'langzaam', LearnLang.ar: 'بطيء', LearnLang.pt: 'lento', LearnLang.it: 'lento', LearnLang.ru: 'медленный', LearnLang.zh: '慢', LearnLang.ja: '遅い', LearnLang.ko: '느린', LearnLang.tr: 'yavaş', LearnLang.pl: 'wolny', LearnLang.sv: 'långsam', LearnLang.da: 'langsom', LearnLang.no: 'sakte', LearnLang.fi: 'hidas', LearnLang.el: 'αργό', LearnLang.cs: 'pomalý', LearnLang.ro: 'lent', LearnLang.hu: 'lassú', LearnLang.hi: 'धीमा', LearnLang.th: 'ช้า', LearnLang.vi: 'chậm', LearnLang.id: 'lambat', LearnLang.uk: 'повільний', LearnLang.he: 'איטי', LearnLang.fa: 'آهسته', LearnLang.sw: 'polepole'},
    {LearnLang.en: 'many', LearnLang.es: 'muchos', LearnLang.de: 'viele', LearnLang.fr: 'beaucoup', LearnLang.nl: 'veel', LearnLang.ar: 'كثير', LearnLang.pt: 'muitos', LearnLang.it: 'molti', LearnLang.ru: 'много', LearnLang.zh: '多', LearnLang.ja: '多い', LearnLang.ko: '많은', LearnLang.tr: 'çok', LearnLang.pl: 'dużo', LearnLang.sv: 'många', LearnLang.da: 'mange', LearnLang.no: 'mange', LearnLang.fi: 'monta', LearnLang.el: 'πολλά', LearnLang.cs: 'hodně', LearnLang.ro: 'mulți', LearnLang.hu: 'sok', LearnLang.hi: 'बहुत', LearnLang.th: 'มาก', LearnLang.vi: 'nhiều', LearnLang.id: 'banyak', LearnLang.uk: 'багато', LearnLang.he: 'הרבה', LearnLang.fa: 'زیاد', LearnLang.sw: 'wengi'},
    {LearnLang.en: 'few', LearnLang.es: 'pocos', LearnLang.de: 'wenige', LearnLang.fr: 'peu', LearnLang.nl: 'weinig', LearnLang.ar: 'قليل', LearnLang.pt: 'poucos', LearnLang.it: 'pochi', LearnLang.ru: 'мало', LearnLang.zh: '少', LearnLang.ja: '少ない', LearnLang.ko: '적은', LearnLang.tr: 'az', LearnLang.pl: 'mało', LearnLang.sv: 'få', LearnLang.da: 'få', LearnLang.no: 'få', LearnLang.fi: 'vähän', LearnLang.el: 'λίγα', LearnLang.cs: 'málo', LearnLang.ro: 'puțini', LearnLang.hu: 'kevés', LearnLang.hi: 'थोड़ा', LearnLang.th: 'น้อย', LearnLang.vi: 'ít', LearnLang.id: 'sedikit', LearnLang.uk: 'мало', LearnLang.he: 'מעט', LearnLang.fa: 'کم', LearnLang.sw: 'wachache'},
    {LearnLang.en: 'happy', LearnLang.es: 'feliz', LearnLang.de: 'glücklich', LearnLang.fr: 'heureux', LearnLang.nl: 'blij', LearnLang.ar: 'سعيد', LearnLang.pt: 'feliz', LearnLang.it: 'felice', LearnLang.ru: 'счастливый', LearnLang.zh: '高兴', LearnLang.ja: '嬉しい', LearnLang.ko: '행복한', LearnLang.tr: 'mutlu', LearnLang.pl: 'szczęśliwy', LearnLang.sv: 'lycklig', LearnLang.da: 'glad', LearnLang.no: 'glad', LearnLang.fi: 'onnellinen', LearnLang.el: 'χαρούμενος', LearnLang.cs: 'šťastný', LearnLang.ro: 'fericit', LearnLang.hu: 'boldog', LearnLang.hi: 'खुश', LearnLang.th: 'มีความสุข', LearnLang.vi: 'hạnh phúc', LearnLang.id: 'bahagia', LearnLang.uk: 'щасливий', LearnLang.he: 'שמח', LearnLang.fa: 'خوشحال', LearnLang.sw: 'furaha'},
    {LearnLang.en: 'sad', LearnLang.es: 'triste', LearnLang.de: 'traurig', LearnLang.fr: 'triste', LearnLang.nl: 'verdrietig', LearnLang.ar: 'حزين', LearnLang.pt: 'triste', LearnLang.it: 'triste', LearnLang.ru: 'грустный', LearnLang.zh: '伤心', LearnLang.ja: '悲しい', LearnLang.ko: '슬픈', LearnLang.tr: 'üzgün', LearnLang.pl: 'smutny', LearnLang.sv: 'ledsen', LearnLang.da: 'ked af det', LearnLang.no: 'trist', LearnLang.fi: 'surullinen', LearnLang.el: 'λυπημένος', LearnLang.cs: 'smutný', LearnLang.ro: 'trist', LearnLang.hu: 'szomorú', LearnLang.hi: 'उदास', LearnLang.th: 'เศร้า', LearnLang.vi: 'buồn', LearnLang.id: 'sedih', LearnLang.uk: 'сумний', LearnLang.he: 'עצוב', LearnLang.fa: 'غمگین', LearnLang.sw: 'huzuni'},
    // --- Temel ifadeler ---
    {LearnLang.en: 'yes', LearnLang.es: 'sí', LearnLang.de: 'ja', LearnLang.fr: 'oui', LearnLang.nl: 'ja', LearnLang.ar: 'نعم', LearnLang.pt: 'sim', LearnLang.it: 'sì', LearnLang.ru: 'да', LearnLang.zh: '是', LearnLang.ja: 'はい', LearnLang.ko: '네', LearnLang.tr: 'evet', LearnLang.pl: 'tak', LearnLang.sv: 'ja', LearnLang.da: 'ja', LearnLang.no: 'ja', LearnLang.fi: 'kyllä', LearnLang.el: 'ναι', LearnLang.cs: 'ano', LearnLang.ro: 'da', LearnLang.hu: 'igen', LearnLang.hi: 'हाँ', LearnLang.th: 'ใช่', LearnLang.vi: 'có', LearnLang.id: 'ya', LearnLang.uk: 'так', LearnLang.he: 'כן', LearnLang.fa: 'بله', LearnLang.sw: 'ndiyo'},
    {LearnLang.en: 'no', LearnLang.es: 'no', LearnLang.de: 'nein', LearnLang.fr: 'non', LearnLang.nl: 'nee', LearnLang.ar: 'لا', LearnLang.pt: 'não', LearnLang.it: 'no', LearnLang.ru: 'нет', LearnLang.zh: '不', LearnLang.ja: 'いいえ', LearnLang.ko: '아니요', LearnLang.tr: 'hayır', LearnLang.pl: 'nie', LearnLang.sv: 'nej', LearnLang.da: 'nej', LearnLang.no: 'nei', LearnLang.fi: 'ei', LearnLang.el: 'όχι', LearnLang.cs: 'ne', LearnLang.ro: 'nu', LearnLang.hu: 'nem', LearnLang.hi: 'नहीं', LearnLang.th: 'ไม่', LearnLang.vi: 'không', LearnLang.id: 'tidak', LearnLang.uk: 'ні', LearnLang.he: 'לא', LearnLang.fa: 'نه', LearnLang.sw: 'hapana'},
    {LearnLang.en: 'sorry', LearnLang.es: 'lo siento', LearnLang.de: 'entschuldigung', LearnLang.fr: 'désolé', LearnLang.nl: 'sorry', LearnLang.ar: 'آسف', LearnLang.pt: 'desculpe', LearnLang.it: 'scusa', LearnLang.ru: 'извините', LearnLang.zh: '对不起', LearnLang.ja: 'すみません', LearnLang.ko: '죄송합니다', LearnLang.tr: 'üzgünüm', LearnLang.pl: 'przepraszam', LearnLang.sv: 'förlåt', LearnLang.da: 'undskyld', LearnLang.no: 'unnskyld', LearnLang.fi: 'anteeksi', LearnLang.el: 'συγγνώμη', LearnLang.cs: 'promiňte', LearnLang.ro: 'îmi pare rău', LearnLang.hu: 'sajnálom', LearnLang.hi: 'माफ़ करें', LearnLang.th: 'ขอโทษ', LearnLang.vi: 'xin lỗi', LearnLang.id: 'maaf', LearnLang.uk: 'вибачте', LearnLang.he: 'סליחה', LearnLang.fa: 'ببخشید', LearnLang.sw: 'samahani'},
    {LearnLang.en: 'goodbye', LearnLang.es: 'adiós', LearnLang.de: 'auf wiedersehen', LearnLang.fr: 'au revoir', LearnLang.nl: 'tot ziens', LearnLang.ar: 'وداعا', LearnLang.pt: 'adeus', LearnLang.it: 'arrivederci', LearnLang.ru: 'до свидания', LearnLang.zh: '再见', LearnLang.ja: 'さようなら', LearnLang.ko: '안녕히 가세요', LearnLang.tr: 'hoşça kal', LearnLang.pl: 'do widzenia', LearnLang.sv: 'hejdå', LearnLang.da: 'farvel', LearnLang.no: 'ha det', LearnLang.fi: 'näkemiin', LearnLang.el: 'αντίο', LearnLang.cs: 'na shledanou', LearnLang.ro: 'la revedere', LearnLang.hu: 'viszlát', LearnLang.hi: 'अलविदा', LearnLang.th: 'ลาก่อน', LearnLang.vi: 'tạm biệt', LearnLang.id: 'selamat tinggal', LearnLang.uk: 'до побачення', LearnLang.he: 'להתראות', LearnLang.fa: 'خداحافظ', LearnLang.sw: 'kwaheri'},
    {LearnLang.en: 'ok', LearnLang.es: 'vale', LearnLang.de: 'okay', LearnLang.fr: 'd’accord', LearnLang.nl: 'oké', LearnLang.ar: 'حسنا', LearnLang.pt: 'tudo bem', LearnLang.it: 'va bene', LearnLang.ru: 'хорошо', LearnLang.zh: '好的', LearnLang.ja: '大丈夫', LearnLang.ko: '괜찮아요', LearnLang.tr: 'tamam', LearnLang.pl: 'dobrze', LearnLang.sv: 'okej', LearnLang.da: 'okay', LearnLang.no: 'greit', LearnLang.fi: 'okei', LearnLang.el: 'εντάξει', LearnLang.cs: 'dobře', LearnLang.ro: 'bine', LearnLang.hu: 'rendben', LearnLang.hi: 'ठीक है', LearnLang.th: 'โอเค', LearnLang.vi: 'được', LearnLang.id: 'oke', LearnLang.uk: 'добре', LearnLang.he: 'בסדר', LearnLang.fa: 'باشه', LearnLang.sw: 'sawa'},
    {LearnLang.en: 'now', LearnLang.es: 'ahora', LearnLang.de: 'jetzt', LearnLang.fr: 'maintenant', LearnLang.nl: 'nu', LearnLang.ar: 'الآن', LearnLang.pt: 'agora', LearnLang.it: 'ora', LearnLang.ru: 'сейчас', LearnLang.zh: '现在', LearnLang.ja: '今', LearnLang.ko: '지금', LearnLang.tr: 'şimdi', LearnLang.pl: 'teraz', LearnLang.sv: 'nu', LearnLang.da: 'nu', LearnLang.no: 'nå', LearnLang.fi: 'nyt', LearnLang.el: 'τώρα', LearnLang.cs: 'teď', LearnLang.ro: 'acum', LearnLang.hu: 'most', LearnLang.hi: 'अभी', LearnLang.th: 'ตอนนี้', LearnLang.vi: 'bây giờ', LearnLang.id: 'sekarang', LearnLang.uk: 'зараз', LearnLang.he: 'עכשיו', LearnLang.fa: 'الان', LearnLang.sw: 'sasa'},
  ];
}

class _CurriculumMatch {
  const _CurriculumMatch({
    required this.phrase,
    required this.meaning,
    required this.scenarioId,
    required this.exact,
  });

  final Phrase phrase;
  final String meaning;
  final String scenarioId;
  final bool exact;
}
