import '../models/models.dart';

/// İkinci AI turundan uyarlanmış, Japonca için 12 ek B1/B2 profesyonel/gerçek
/// hayat senaryosu. Keigo (謙譲語/尊敬語) iş bağlamlarında tutarlı kullanılır.
class ExpandedCatalogJa {
  static List<Scenario> build(LearnLang language) =>
      language == LearnLang.ja ? _scenarios : const [];

  static final List<Scenario> _scenarios = [
    Scenario(
      id: 'ja_exp_job_interview',
      lang: LearnLang.ja,
      cefr: Cefr.b1,
      minutes: 10,
      titles: {UiLang.tr: 'İş görüşmesi', UiLang.en: 'Job interview'},
      clipLine: '本日はお時間をいただき、ありがとうございます。',
      phrases: [
        Phrase(
          id: 'ja_exp_interview_0',
          target: '本日はお時間をいただき、ありがとうございます。',
          gloss: {UiLang.tr: 'Bugün bana vakit ayırdığınız için teşekkür ederim.'},
        ),
        Phrase(
          id: 'ja_exp_interview_1',
          target: 'これまでの職務について、簡潔にご説明いたします。',
          gloss: {UiLang.tr: 'Şimdiye kadarki iş deneyimimi kısaca anlatacağım.'},
        ),
        Phrase(
          id: 'ja_exp_interview_2',
          target: '御社の事業に強く魅力を感じております。',
          gloss: {UiLang.tr: 'Şirketinizin işine güçlü bir ilgi duyuyorum.'},
        ),
        Phrase(
          id: 'ja_exp_interview_3',
          target: '短所は、時に細部に入り込みすぎることです。チェックリストで補っています。',
          gloss: {UiLang.tr: 'Zayıf yönüm bazen ayrıntıya fazla dalmam; bunu kontrol listesiyle telafi ediyorum.'},
        ),
        Phrase(
          id: 'ja_exp_interview_4',
          target: '入社時期は、ご相談可能でしょうか。',
          gloss: {UiLang.tr: 'Başlama tarihini konuşabilir miyiz?'},
        ),
        Phrase(
          id: 'ja_exp_interview_5',
          target: '評価制度について、伺ってもよろしいでしょうか。',
          gloss: {UiLang.tr: 'Değerlendirme sistemini sorabilir miyim?'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: '志望動機を教えてください。',
          expected: '顧客課題を整理する仕事に、強みを活かせると考えております。',
        ),
        SpeakTurn(
          prompt: '困難だった案件はありますか。',
          expected: '納期が迫った際、範囲を切り分けて共有しました。',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Kendi eyleminizi alçaltan 謙譲語 (kenjougo): 説明する → ご説明いたします, 聞く → 伺う. Karşı tarafın eylemi için 尊敬語 kullanılır.',
        },
        goodExample: 'ご説明いたします。伺ってもよろしいでしょうか。',
        badExample: '説明するよ。聞いていい？',
      ),
    ),
    Scenario(
      id: 'ja_exp_team_meeting',
      lang: LearnLang.ja,
      cefr: Cefr.b1,
      minutes: 9,
      titles: {UiLang.tr: 'Ekip toplantısı', UiLang.en: 'Team meeting'},
      clipLine: 'では、アジェンダに入ります。',
      phrases: [
        Phrase(id: 'ja_exp_meeting_0', target: 'では、アジェンダに入ります。', gloss: {UiLang.tr: 'O zaman gündeme geçiyoruz.'}),
        Phrase(
          id: 'ja_exp_meeting_1',
          target: '私の担当は、API遅延が残っています。明日までに日付を出します。',
          gloss: {UiLang.tr: 'Benim tarafımda API gecikmesi var, yarına kadar tarih vereceğim.'},
        ),
        Phrase(id: 'ja_exp_meeting_2', target: 'この件は後回しにしてもよろしいでしょうか。', gloss: {UiLang.tr: 'Bu konuyu sona bırakabilir miyiz?'}),
        Phrase(id: 'ja_exp_meeting_3', target: '決定事項を共有します。木曜16時です。', gloss: {UiLang.tr: 'Kararı paylaşıyorum: perşembe saat 16.'}),
        Phrase(
          id: 'ja_exp_meeting_4',
          target: '異議はありませんが、リスクも残しておきたいです。',
          gloss: {UiLang.tr: 'İtirazım yok ama riski de not etmek istiyorum.'},
        ),
        Phrase(id: 'ja_exp_meeting_5', target: '5分だけ延長しても大丈夫でしょうか。', gloss: {UiLang.tr: 'Sadece 5 dakika uzatabilir miyiz?'}),
      ],
      turns: const [
        SpeakTurn(prompt: 'ブロッカーがある方はいますか。', expected: 'デザイン確認待ちです。明日リマインドします。'),
        SpeakTurn(prompt: 'では、担当はお願いします。', expected: '承知しました、今週中に更新を共有します。'),
      ],
      grammarNote: GrammarNote(
        rule: {UiLang.tr: 'İzin/teklif kalıbı: 〜てもよろしいでしょうか. 〜てもいい? daha arkadaşça, iş ortamında kullanılmaz.'},
        goodExample: '後回しにしてもよろしいでしょうか。',
        badExample: '後でいいっしょ。',
      ),
    ),
    Scenario(
      id: 'ja_exp_bank',
      lang: LearnLang.ja,
      cefr: Cefr.a2,
      minutes: 8,
      titles: {UiLang.tr: 'Bankada hesap', UiLang.en: 'Bank account'},
      clipLine: '普通預金の口座を開設したいのですが。',
      phrases: [
        Phrase(id: 'ja_exp_bank_0', target: '普通預金の口座を開設したいのですが。', gloss: {UiLang.tr: 'Vadesiz hesap açmak istiyorum.'}),
        Phrase(id: 'ja_exp_bank_1', target: '身分証と住所確認書類を持ってまいりました。', gloss: {UiLang.tr: 'Kimlik ve adres belgemi getirdim.'}),
        Phrase(id: 'ja_exp_bank_2', target: 'カードの年会費はいくらでしょうか。', gloss: {UiLang.tr: 'Kartın yıllık ücreti nedir?'}),
        Phrase(id: 'ja_exp_bank_3', target: 'インターネットバンキングもお願いします。', gloss: {UiLang.tr: 'İnternet bankacılığını da rica ediyorum.'}),
        Phrase(id: 'ja_exp_bank_4', target: '振込限度額を教えていただけますか。', gloss: {UiLang.tr: 'Havale limitini söyler misiniz?'}),
        Phrase(id: 'ja_exp_bank_5', target: '明細はメールで受け取れますか。', gloss: {UiLang.tr: 'Ekstreyi e-posta ile alabilir miyim?'}),
      ],
      turns: const [
        SpeakTurn(prompt: '口座の種類はどちらになさいますか。', expected: '給与受取用の普通預金でお願いします。'),
        SpeakTurn(prompt: 'こちらにご署名ください。', expected: 'はい、こちらでよろしいでしょうか。'),
      ],
      grammarNote: GrammarNote(
        rule: {UiLang.tr: '〜たいのですが yarıda bırakan, yumuşak bir istek biçimidir; gişede 〜たいです\'ten daha nazik durur.'},
        goodExample: '口座を開設したいのですが。',
        badExample: '口座を作れ。',
      ),
    ),
    Scenario(
      id: 'ja_exp_apartment',
      lang: LearnLang.ja,
      cefr: Cefr.a2,
      minutes: 8,
      titles: {UiLang.tr: 'Ev bakma', UiLang.en: 'Apartment viewing'},
      clipLine: '広告を見て参りました。まだ空いていますか。',
      phrases: [
        Phrase(id: 'ja_exp_apartment_0', target: '広告を見て参りました。まだ空いていますか。', gloss: {UiLang.tr: 'İlanı görüp geldim, hâlâ boş mu?'}),
        Phrase(id: 'ja_exp_apartment_1', target: '管理費に共熱費は含まれますか。', gloss: {UiLang.tr: 'Aidat ısıtmayı kapsıyor mu?'}),
        Phrase(id: 'ja_exp_apartment_2', target: '敷金は何か月分でしょうか。', gloss: {UiLang.tr: 'Depozito kaç aylık?'}),
        Phrase(id: 'ja_exp_apartment_3', target: '契約は一年からですか。短期は可能でしょうか。', gloss: {UiLang.tr: 'Sözleşme bir yıldan mı başlıyor? Kısa süreli olur mu?'}),
        Phrase(id: 'ja_exp_apartment_4', target: '在宅勤務なので、静かな環境か伺いたいです。', gloss: {UiLang.tr: 'Evden çalışıyorum, sessiz bir yer mi diye sormak istiyorum.'}),
        Phrase(id: 'ja_exp_apartment_5', target: '返事は明日までにお伝えします。', gloss: {UiLang.tr: 'Cevabımı yarına kadar bildiririm.'}),
      ],
      turns: const [
        SpeakTurn(prompt: 'ご入居はいつ頃をお考えですか。', expected: '月初を希望しています。荷物は少なめです。'),
        SpeakTurn(prompt: 'ペット不可とのことです。', expected: '承知しました、問題ありません。'),
      ],
      grammarNote: GrammarNote(
        rule: {UiLang.tr: 'Miktar sorusu 何か月分 (kaç aylık); いくら fiyat sorar, süre değil.'},
        goodExample: '敷金は何か月分でしょうか。',
        badExample: '敷金はいくら月？',
      ),
    ),
    Scenario(
      id: 'ja_exp_doctor',
      lang: LearnLang.ja,
      cefr: Cefr.a2,
      minutes: 8,
      titles: {UiLang.tr: 'Doktorda', UiLang.en: "At the doctor's"},
      clipLine: '三日前から熱があって、夜に咳が出ます。',
      phrases: [
        Phrase(id: 'ja_exp_doctor_0', target: '三日前から熱があって、夜に咳が出ます。', gloss: {UiLang.tr: 'Üç gündür ateşim var, gece öksürüyorum.'}),
        Phrase(id: 'ja_exp_doctor_1', target: 'ペニシリンアレルギーはありません。', gloss: {UiLang.tr: 'Penisilin alerjim yok.'}),
        Phrase(id: 'ja_exp_doctor_2', target: 'この薬は眠くなりますか。', gloss: {UiLang.tr: 'Bu ilaç uyku getirir mi?'}),
        Phrase(id: 'ja_exp_doctor_3', target: '診断書は必要でしょうか。', gloss: {UiLang.tr: 'Rapor gerekir mi?'}),
        Phrase(id: 'ja_exp_doctor_4', target: '再診はいつ頃がよいですか。', gloss: {UiLang.tr: 'Kontrole ne zaman geleyim?'}),
        Phrase(id: 'ja_exp_doctor_5', target: '薬局は建物の外でしょうか。', gloss: {UiLang.tr: 'Eczane bina dışında mı?'}),
      ],
      turns: const [
        SpeakTurn(prompt: '痛みはどこですか。急に始まりましたか。', expected: '胸の右側です。昨夜からです。'),
        SpeakTurn(prompt: '血液検査をお願いします。', expected: 'はい、どちらに伺えばよいですか。'),
      ],
      grammarNote: GrammarNote(
        rule: {UiLang.tr: 'Belirtiyi 普通形+ます ile anlatın (熱がある, 咳が出る); kendi teşhisinizi koymayın.'},
        goodExample: '夜に咳が出ます。',
        badExample: '肺炎だと思います。',
      ),
    ),
    Scenario(
      id: 'ja_exp_business_lunch',
      lang: LearnLang.ja,
      cefr: Cefr.b1,
      minutes: 10,
      titles: {UiLang.tr: 'İş yemeği', UiLang.en: 'Business lunch'},
      clipLine: 'お店はご希望に合わせて選びました。',
      phrases: [
        Phrase(id: 'ja_exp_lunch_0', target: 'お店はご希望に合わせて選びました。', gloss: {UiLang.tr: 'Mekânı sizin tercihinize göre seçtim.'}),
        Phrase(id: 'ja_exp_lunch_1', target: 'アレルギーや苦手なものはございますか。', gloss: {UiLang.tr: 'Alerjiniz ya da sevmediğiniz bir şey var mı?'}),
        Phrase(id: 'ja_exp_lunch_2', target: 'ご注文の前に、本日の論点だけ確認できますでしょうか。', gloss: {UiLang.tr: 'Sipariş vermeden önce bugünün konularını netleştirebilir miyiz?'}),
        Phrase(id: 'ja_exp_lunch_3', target: '細かい数字は後ほどメールにいたします。', gloss: {UiLang.tr: 'Ayrıntılı rakamları sonra mail ile göndereceğim.'}),
        Phrase(id: 'ja_exp_lunch_4', target: '本日はこちらでご馳走させてください。', gloss: {UiLang.tr: 'Bugün ikram etmeme izin verin.'}),
        Phrase(id: 'ja_exp_lunch_5', target: '有意義なお時間をありがとうございました。', gloss: {UiLang.tr: 'Verimli bir zaman için teşekkür ederim.'}),
      ],
      turns: const [
        SpeakTurn(prompt: 'まだ価格が高い印象です。', expected: 'フェーズを二つに分ける案はいかがでしょうか。'),
        SpeakTurn(prompt: '検討します。', expected: 'かしこまりました、来週改めてご連絡します。'),
      ],
      grammarNote: GrammarNote(
        rule: {UiLang.tr: 'Hesabı üstlenme: ご馳走させてください (izinli/alçaltan biçim); ご馳走します daha az nazik durabilir.'},
        goodExample: 'こちらでご馳走させてください。',
        badExample: '俺が払うよ。',
      ),
    ),
    Scenario(
      id: 'ja_exp_complaint',
      lang: LearnLang.ja,
      cefr: Cefr.b1,
      minutes: 9,
      titles: {UiLang.tr: 'Şikâyet', UiLang.en: 'Complaint'},
      clipLine: '注文番号は1842です。まだ届いておりません。',
      phrases: [
        Phrase(id: 'ja_exp_complaint_0', target: '注文番号は1842です。まだ届いておりません。', gloss: {UiLang.tr: 'Sipariş numaram 1842, hâlâ ulaşmadı.'}),
        Phrase(id: 'ja_exp_complaint_1', target: 'お約束の日は昨日でした。', gloss: {UiLang.tr: 'Söz verilen tarih dündü.'}),
        Phrase(id: 'ja_exp_complaint_2', target: '送料の返金をご検討いただけますでしょうか。', gloss: {UiLang.tr: 'Kargo ücretinin iadesini değerlendirebilir misiniz?'}),
        Phrase(id: 'ja_exp_complaint_3', target: '上長の方におつなぎすべきでしょうか。', gloss: {UiLang.tr: 'Bir üst yetkiliye mi bağlanmalıyım?'}),
        Phrase(id: 'ja_exp_complaint_4', target: '書面でご確認をいただけますか。', gloss: {UiLang.tr: 'Yazılı olarak teyit alabilir miyim?'}),
        Phrase(id: 'ja_exp_complaint_5', target: '本日中に確かな日時が必要です。', gloss: {UiLang.tr: 'Bugün içinde kesin bir tarih gerekiyor.'}),
      ],
      turns: const [
        SpeakTurn(prompt: 'ご不便をおかけし、申し訳ございません。確認いたします。', expected: 'ありがとうございます。時刻も残してください。'),
        SpeakTurn(prompt: '明日14時までのお届けとなります。', expected: '承知しました、お待ちしています。'),
      ],
      grammarNote: GrammarNote(
        rule: {UiLang.tr: 'Karşıdan eylem ricası: ご〜いただけますでしょうか (ご検討いただけますでしょうか); emir kipi kullanılmaz.'},
        goodExample: 'ご検討いただけますでしょうか。',
        badExample: '返金しろ。',
      ),
    ),
    Scenario(
      id: 'ja_exp_business_trip',
      lang: LearnLang.ja,
      cefr: Cefr.a2,
      minutes: 8,
      titles: {UiLang.tr: 'İş seyahati', UiLang.en: 'Business trip'},
      clipLine: '予約番号はこちらです。搭乗券をお願いします。',
      phrases: [
        Phrase(id: 'ja_exp_trip_0', target: '予約番号はこちらです。搭乗券をお願いします。', gloss: {UiLang.tr: 'Rezervasyon numaram bu, biniş kartı lütfen.'}),
        Phrase(id: 'ja_exp_trip_1', target: '機内持ち込みのサイズは大丈夫でしょうか。', gloss: {UiLang.tr: 'El bagajı boyutuna uygun mu?'}),
        Phrase(id: 'ja_exp_trip_2', target: '遅延で乗り継ぎに間に合うか心配です。', gloss: {UiLang.tr: 'Gecikme yüzünden aktarmayı yakalar mıyım diye endişeliyim.'}),
        Phrase(id: 'ja_exp_trip_3', target: '領収書は会社名でお願いします。', gloss: {UiLang.tr: 'Fatura şirket adına lütfen.'}),
        Phrase(id: 'ja_exp_trip_4', target: 'ラウンジの入口はどちらですか。', gloss: {UiLang.tr: 'Lounge girişi nerede?'}),
        Phrase(id: 'ja_exp_trip_5', target: 'タクシーの領収書を保管する必要があります。', gloss: {UiLang.tr: 'Taksi fişini saklamam gerekiyor.'}),
      ],
      turns: const [
        SpeakTurn(prompt: '窓側と通路側、どちらがよろしいですか。', expected: '通路側で、出入り口に近いと助かります。'),
        SpeakTurn(prompt: '12番ゲート、40分後です。', expected: 'ありがとうございます、向かいます。'),
      ],
      grammarNote: GrammarNote(
        rule: {UiLang.tr: 'Aktarma kaygısı: 間に合うか心配です. 間に合う = yetişmek, zamanında varmak.'},
        goodExample: '乗り継ぎに間に合うか心配です。',
        badExample: '乗り継ぎを負けます。',
      ),
    ),
    Scenario(
      id: 'ja_exp_client_call',
      lang: LearnLang.ja,
      cefr: Cefr.b1,
      minutes: 9,
      titles: {UiLang.tr: 'Müşteri telefonu', UiLang.en: 'Client phone call'},
      clipLine: '今、お電話よろしいでしょうか。5分だけいただきます。',
      phrases: [
        Phrase(id: 'ja_exp_call_0', target: '今、お電話よろしいでしょうか。5分だけいただきます。', gloss: {UiLang.tr: 'Şimdi konuşabilir misiniz? Sadece 5 dakika alacağım.'}),
        Phrase(id: 'ja_exp_call_1', target: '昨日のメールの3点目が、少し不明確です。', gloss: {UiLang.tr: 'Dünkü mailin 3. maddesi biraz net değil.'}),
        Phrase(id: 'ja_exp_call_2', target: '追加なのか、現行範囲なのか、切り分けたいです。', gloss: {UiLang.tr: 'Ek iş mi, mevcut kapsam mı, netleştirmek istiyorum.'}),
        Phrase(id: 'ja_exp_call_3', target: '認識違いがあれば、ご指摘ください。', gloss: {UiLang.tr: 'Yanlış anladıysam lütfen düzeltin.'}),
        Phrase(id: 'ja_exp_call_4', target: '金曜に草案、月曜にご意見、という理解です。', gloss: {UiLang.tr: 'Anladığım kadarıyla: cuma taslak, pazartesi yorumunuz.'}),
        Phrase(id: 'ja_exp_call_5', target: '記録のため、ただいまメールします。', gloss: {UiLang.tr: 'Kayıt için şimdi mail atıyorum.'}),
      ],
      turns: const [
        SpeakTurn(prompt: 'この機能がないとリリースできません。', expected: 'では他の項目をずらして、これを前倒ししましょう。'),
        SpeakTurn(prompt: 'では、文書化してください。', expected: 'かしこまりました、すぐにまとめます。'),
      ],
      grammarNote: GrammarNote(
        rule: {UiLang.tr: 'Telefon izni: önce 今よろしいでしょうか. Direkt konuya girmek B2 seviyesinde bile riskli kaçar.'},
        goodExample: '今、お電話よろしいでしょうか。',
        badExample: 'ちょっといい？今からスコープ。',
      ),
    ),
    Scenario(
      id: 'ja_exp_hr_salary',
      lang: LearnLang.ja,
      cefr: Cefr.b2,
      minutes: 11,
      titles: {UiLang.tr: 'Maaş görüşmesi', UiLang.en: 'Salary conversation'},
      clipLine: '評価と市場水準について、お話しできますでしょうか。',
      phrases: [
        Phrase(id: 'ja_exp_salary_0', target: '評価と市場水準について、お話しできますでしょうか。', gloss: {UiLang.tr: 'Değerlendirme ve piyasa seviyesi hakkında konuşabilir miyiz?'}),
        Phrase(id: 'ja_exp_salary_1', target: '半年間で3件を納期内に届けました。', gloss: {UiLang.tr: 'Altı ayda üç projeyi zamanında teslim ettim.'}),
        Phrase(id: 'ja_exp_salary_2', target: '希望は15パーセントです。根拠もご説明できます。', gloss: {UiLang.tr: 'Beklentim yüzde 15, gerekçesini de anlatabilirim.'}),
        Phrase(id: 'ja_exp_salary_3', target: '現在の肩書きが、実務とずれていると感じています。', gloss: {UiLang.tr: 'Şu anki unvanın işi yansıtmadığını düşünüyorum.'}),
        Phrase(id: 'ja_exp_salary_4', target: '今期が難しければ、実施時期を明確にしたいです。', gloss: {UiLang.tr: 'Bu dönem zorsa, uygulama tarihini netleştirmek istiyorum.'}),
        Phrase(id: 'ja_exp_salary_5', target: '決定事項は文書でいただきたいです。', gloss: {UiLang.tr: 'Kararı yazılı olarak almak isterim.'}),
      ],
      turns: const [
        SpeakTurn(prompt: '今期は予算が厳しいです。', expected: '中間での見直しや、等級の調整は可能でしょうか。'),
        SpeakTurn(prompt: '3月に再検討しましょう。', expected: 'では3月をカレンダーに入れ、基準を今日揃えましょう。'),
      ],
      grammarNote: GrammarNote(
        rule: {UiLang.tr: 'İK\'da duygu fiili yumuşak: ずれていると感じています. 不満です (memnuniyetsizim) konuşmayı kapatır.'},
        goodExample: '肩書きが実務とずれていると感じています。',
        badExample: '待遇に不満です。',
      ),
    ),
    Scenario(
      id: 'ja_exp_daily_errands',
      lang: LearnLang.ja,
      cefr: Cefr.a2,
      minutes: 7,
      titles: {UiLang.tr: 'Market ve kargo', UiLang.en: 'Errands and deliveries'},
      clipLine: 'このパンを二つと、レシートをお願いします。',
      phrases: [
        Phrase(id: 'ja_exp_errands_0', target: 'このパンを二つと、レシートをお願いします。', gloss: {UiLang.tr: 'Bu ekmekten iki tane ve fiş lütfen.'}),
        Phrase(id: 'ja_exp_errands_1', target: 'グルテンフリーの棚はどこですか。', gloss: {UiLang.tr: 'Glütensiz reyon nerede?'}),
        Phrase(id: 'ja_exp_errands_2', target: '不在時は隣人に渡さず、メモを残してください。', gloss: {UiLang.tr: 'Yokken komşuya bırakmayın, not bırakın.'}),
        Phrase(id: 'ja_exp_errands_3', target: '現金がないのでカードでお願いします。', gloss: {UiLang.tr: 'Nakit param yok, kartla lütfen.'}),
        Phrase(id: 'ja_exp_errands_4', target: '返品は14日以内でよろしいですか。', gloss: {UiLang.tr: 'İade 14 gün içinde mi olmalı?'}),
        Phrase(id: 'ja_exp_errands_5', target: '袋は結構です。持参しています。', gloss: {UiLang.tr: 'Poşet istemiyorum, kendim getirdim.'}),
      ],
      turns: const [
        SpeakTurn(prompt: 'ポイントカードはお持ちですか。', expected: 'いいえ、今回は大丈夫です。'),
        SpeakTurn(prompt: 'お札の崩しができないのでカードで。', expected: 'かしこまりました、カードでお願いします。'),
      ],
      grammarNote: GrammarNote(
        rule: {UiLang.tr: '結構です nazikçe "hayır teşekkürler" der (袋は結構です); いらない kaba kaçar.'},
        goodExample: '袋は結構です。',
        badExample: '袋いらない。',
      ),
    ),
    Scenario(
      id: 'ja_exp_networking',
      lang: LearnLang.ja,
      cefr: Cefr.b1,
      minutes: 9,
      titles: {UiLang.tr: 'Networking', UiLang.en: 'Networking'},
      clipLine: 'フィンテックでプロダクトマネージャーをしております、佐藤です。',
      phrases: [
        Phrase(id: 'ja_exp_networking_0', target: 'フィンテックでプロダクトマネージャーをしております、佐藤です。', gloss: {UiLang.tr: 'Ben Sato, fintech\'te ürün yöneticisiyim.'}),
        Phrase(id: 'ja_exp_networking_1', target: '先ほどの決済の例が、非常に分かりやすかったです。', gloss: {UiLang.tr: 'Az önceki ödeme örneği çok anlaşılırdı.'}),
        Phrase(id: 'ja_exp_networking_2', target: '御社でも似た課題はございますか。', gloss: {UiLang.tr: 'Sizde de benzer bir sorun var mı?'}),
        Phrase(id: 'ja_exp_networking_3', target: '名刺が切れてしまい、LinkedInでご連絡してもよろしいでしょうか。', gloss: {UiLang.tr: 'Kartvizitim bitti, LinkedIn\'den ulaşabilir miyim?'}),
        Phrase(id: 'ja_exp_networking_4', target: '2分だけお時間いただけますか。', gloss: {UiLang.tr: 'Sadece 2 dakikanızı alabilir miyim?'}),
        Phrase(id: 'ja_exp_networking_5', target: 'ご紹介できる方がいれば、おつなぎします。', gloss: {UiLang.tr: 'Tanıştırabileceğim biri varsa sizi bağlarım.'}),
      ],
      turns: const [
        SpeakTurn(prompt: 'どのようなお仕事を。', expected: '中小企業の請求回収を楽にするプロダクトです。'),
        SpeakTurn(prompt: '興味があります。ご連絡ください。', expected: 'ありがとうございます、ぜひご連絡します。'),
      ],
      grammarNote: GrammarNote(
        rule: {UiLang.tr: 'しております しています\'ten bir kademe resmidir; networking\'de güvenli kimlik cümlesi kurar.'},
        goodExample: 'プロダクトマネージャーをしております。',
        badExample: 'PMやってます。',
      ),
    ),
  ];
}
