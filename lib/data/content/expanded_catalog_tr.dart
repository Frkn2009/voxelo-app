import '../models/models.dart';

/// İkinci AI turundan uyarlanmış, Türkçe'yi hedef dil olarak öğrenenler için
/// 12 ek B1/B2 profesyonel/gerçek hayat senaryosu. Var olan `tr_` temel
/// setiyle (turistik A1) çakışmaması için id'ler `tr_exp_` önekini kullanır.
class ExpandedCatalogTr {
  static List<Scenario> build(LearnLang language) =>
      language == LearnLang.tr ? _scenarios : const [];

  static final List<Scenario> _scenarios = [
    Scenario(
      id: 'tr_exp_job_interview',
      lang: LearnLang.tr,
      cefr: Cefr.b1,
      minutes: 10,
      titles: {
        UiLang.tr: 'İş görüşmesi',
        UiLang.en: 'Job interview',
      },
      clipLine: 'Görüşmeye çağırdığınız için teşekkür ederim.',
      phrases: [
        Phrase(
          id: 'tr_exp_interview_0',
          target: 'Görüşmeye çağırdığınız için teşekkür ederim.',
          gloss: {
            UiLang.tr: 'Görüşmeye çağırdığınız için teşekkür ederim.',
            UiLang.en: 'Thank you for inviting me to this interview.',
          },
        ),
        Phrase(
          id: 'tr_exp_interview_1',
          target: 'Beş yıldır ürün ekiplerinde çalışıyorum.',
          gloss: {
            UiLang.tr: 'Beş yıldır ürün ekiplerinde çalışıyorum.',
            UiLang.en: "I've been working in product teams for five years.",
          },
        ),
        Phrase(
          id: 'tr_exp_interview_2',
          target: 'Bu pozisyonda en çok müşteri sorunlarını netleştirmeyi önemsiyorum.',
          gloss: {
            UiLang.tr: 'Bu pozisyonda en çok müşteri sorunlarını netleştirmeyi önemsiyorum.',
            UiLang.en: 'What matters most to me in this role is clarifying customer problems.',
          },
        ),
        Phrase(
          id: 'tr_exp_interview_3',
          target: 'Zayıf yönüm bazen ayrıntıda kaybolmam; bunun için kontrol listesi kullanıyorum.',
          gloss: {
            UiLang.tr: 'Zayıf yönüm bazen ayrıntıda kaybolmam; bunun için kontrol listesi kullanıyorum.',
            UiLang.en: 'My weak point is sometimes getting lost in detail; I use a checklist for that.',
          },
        ),
        Phrase(
          id: 'tr_exp_interview_4',
          target: 'İşe ne zaman başlamamı beklersiniz?',
          gloss: {
            UiLang.tr: 'İşe ne zaman başlamamı beklersiniz?',
            UiLang.en: 'When would you expect me to start?',
          },
        ),
        Phrase(
          id: 'tr_exp_interview_5',
          target: 'Maaş aralığınızı paylaşabilir misiniz?',
          gloss: {
            UiLang.tr: 'Maaş aralığınızı paylaşabilir misiniz?',
            UiLang.en: 'Could you share your salary range?',
          },
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Neden bizim şirketimizi tercih ettiniz?',
          expected: 'Sektörünüzdeki yaklaşımınız yaptığım işe denk düşüyor.',
        ),
        SpeakTurn(
          prompt: 'Stresli bir teslim haftasını nasıl yönetirsiniz?',
          expected: 'Önce kapsamı keserim, sonra riskleri yazılı paylaşırım.',
        ),
        SpeakTurn(
          prompt: 'Başka sorunuz var mı?',
          expected: 'Ekiple tanışma imkânı olur mu?',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Nazik soru: "-abilir misiniz?" — iş görüşmesinde emir kipi kullanılmaz, istek kipi + "misiniz" resmi ve güvenlidir.',
        },
        goodExample: 'Maaş aralığını paylaşabilir misiniz?',
        badExample: 'Maaşı söyleyin.',
      ),
    ),
    Scenario(
      id: 'tr_exp_team_meeting',
      lang: LearnLang.tr,
      cefr: Cefr.b1,
      minutes: 9,
      titles: {
        UiLang.tr: 'Ekip toplantısı',
        UiLang.en: 'Team meeting',
      },
      clipLine: 'Hızlıca gündeme geçelim.',
      phrases: [
        Phrase(
          id: 'tr_exp_meeting_0',
          target: 'Hızlıca gündeme geçelim.',
          gloss: {UiLang.tr: 'Hızlıca gündeme geçelim.', UiLang.en: "Let's get straight to the agenda."},
        ),
        Phrase(
          id: 'tr_exp_meeting_1',
          target: 'Benim tarafımda API gecikmesi var, yarına net tarih vereceğim.',
          gloss: {
            UiLang.tr: 'Benim tarafımda API gecikmesi var, yarına net tarih vereceğim.',
            UiLang.en: "There's an API delay on my side, I'll give a firm date by tomorrow.",
          },
        ),
        Phrase(
          id: 'tr_exp_meeting_2',
          target: 'Bu maddeyi sona bırakabilir miyiz?',
          gloss: {UiLang.tr: 'Bu maddeyi sona bırakabilir miyiz?', UiLang.en: 'Can we leave this item for the end?'},
        ),
        Phrase(
          id: 'tr_exp_meeting_3',
          target: 'Kararı not alıyorum: perşembe, saat 16:00.',
          gloss: {UiLang.tr: 'Kararı not alıyorum: perşembe, saat 16:00.', UiLang.en: "I'm noting the decision: Thursday, 4pm."},
        ),
        Phrase(
          id: 'tr_exp_meeting_4',
          target: 'İtirazım yok, ama riski de yazalım.',
          gloss: {UiLang.tr: 'İtirazım yok, ama riski de yazalım.', UiLang.en: "I have no objection, but let's log the risk too."},
        ),
        Phrase(
          id: 'tr_exp_meeting_5',
          target: 'Toplantıyı beş dakika uzatmamız gerekir mi?',
          gloss: {UiLang.tr: 'Toplantıyı beş dakika uzatmamız gerekir mi?', UiLang.en: 'Do we need to extend the meeting by five minutes?'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Blokajı olan var mı?',
          expected: 'Tasarım onayı bekliyorum, yarın hatırlatırım.',
        ),
        SpeakTurn(
          prompt: 'O zaman bu maddenin sahibi sensin.',
          expected: 'Tamam, üstleniyorum ve bu hafta güncelleme paylaşırım.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '"-yor" eki toplantıda süren işi anlatır. "Bekliyorum" der, "beklerim" demezsiniz — ikincisi belirsiz bir gelecek anlamı taşır.',
        },
        goodExample: 'Tasarım onayı bekliyorum, yarın hatırlatırım.',
        badExample: 'Tasarım onayı beklerim.',
      ),
    ),
    Scenario(
      id: 'tr_exp_bank',
      lang: LearnLang.tr,
      cefr: Cefr.a2,
      minutes: 8,
      titles: {UiLang.tr: 'Bankada hesap açma', UiLang.en: 'Opening a bank account'},
      clipLine: 'Vadesiz hesap açmak istiyorum.',
      phrases: [
        Phrase(
          id: 'tr_exp_bank_0',
          target: 'Vadesiz hesap açmak istiyorum.',
          gloss: {UiLang.tr: 'Vadesiz hesap açmak istiyorum.', UiLang.en: 'I want to open a checking account.'},
        ),
        Phrase(
          id: 'tr_exp_bank_1',
          target: 'Kimliğim ve adres belgem yanımda.',
          gloss: {UiLang.tr: 'Kimliğim ve adres belgem yanımda.', UiLang.en: 'I have my ID and proof of address with me.'},
        ),
        Phrase(
          id: 'tr_exp_bank_2',
          target: 'Kart ücreti yıllık ne kadar?',
          gloss: {UiLang.tr: 'Kart ücreti yıllık ne kadar?', UiLang.en: 'How much is the card fee per year?'},
        ),
        Phrase(
          id: 'tr_exp_bank_3',
          target: 'İnternet bankacılığını da açalım lütfen.',
          gloss: {UiLang.tr: 'İnternet bankacılığını da açalım lütfen.', UiLang.en: "Let's also set up online banking, please."},
        ),
        Phrase(
          id: 'tr_exp_bank_4',
          target: 'Havale limiti nedir?',
          gloss: {UiLang.tr: 'Havale limiti nedir?', UiLang.en: 'What is the transfer limit?'},
        ),
        Phrase(
          id: 'tr_exp_bank_5',
          target: 'Dekontu e-posta ile alabilir miyim?',
          gloss: {UiLang.tr: 'Dekontu e-posta ile alabilir miyim?', UiLang.en: 'Can I get the receipt by e-mail?'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Hesap türü hangisi olsun?',
          expected: 'Bireysel vadesiz olsun, maaşım buraya yatsın.',
        ),
        SpeakTurn(
          prompt: 'İmzanızı şuraya alabilir miyim?',
          expected: 'Tabii, buyurun.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {UiLang.tr: '"İstiyorum" + fiil-isim kalıbı hizmet isterken yeterlidir, emir kipine gerek yoktur.'},
        goodExample: 'Hesap açmak istiyorum.',
        badExample: 'Hesabı aç.',
      ),
    ),
    Scenario(
      id: 'tr_exp_apartment',
      lang: LearnLang.tr,
      cefr: Cefr.a2,
      minutes: 8,
      titles: {UiLang.tr: 'Ev bakma', UiLang.en: 'Viewing an apartment'},
      clipLine: 'İlanı görüp geldim, daire hâlâ boş mu?',
      phrases: [
        Phrase(
          id: 'tr_exp_apartment_0',
          target: 'İlanı görüp geldim, daire hâlâ boş mu?',
          gloss: {UiLang.tr: 'İlanı görüp geldim, daire hâlâ boş mu?', UiLang.en: "I saw the listing — is the apartment still available?"},
        ),
        Phrase(
          id: 'tr_exp_apartment_1',
          target: 'Aidat ısıtmayı kapsıyor mu?',
          gloss: {UiLang.tr: 'Aidat ısıtmayı kapsıyor mu?', UiLang.en: 'Does the maintenance fee include heating?'},
        ),
        Phrase(
          id: 'tr_exp_apartment_2',
          target: 'Depozito kaç kira?',
          gloss: {UiLang.tr: 'Depozito kaç kira?', UiLang.en: 'How many months of rent is the deposit?'},
        ),
        Phrase(
          id: 'tr_exp_apartment_3',
          target: 'Sözleşme bir yıl mı, daha kısa olur mu?',
          gloss: {UiLang.tr: 'Sözleşme bir yıl mı, daha kısa olur mu?', UiLang.en: 'Is the contract one year, or can it be shorter?'},
        ),
        Phrase(
          id: 'tr_exp_apartment_4',
          target: 'Komşular sessiz mi? Evden çalışıyorum.',
          gloss: {UiLang.tr: 'Komşular sessiz mi? Evden çalışıyorum.', UiLang.en: 'Are the neighbours quiet? I work from home.'},
        ),
        Phrase(
          id: 'tr_exp_apartment_5',
          target: 'Kararımı yarın ileteceğim.',
          gloss: {UiLang.tr: 'Kararımı yarın ileteceğim.', UiLang.en: "I'll let you know my decision tomorrow."},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Ne zaman taşınmak istiyorsunuz?',
          expected: 'Ay başı uygun, eşyam az.',
        ),
        SpeakTurn(
          prompt: 'Ev sahibi evcil hayvan istemiyor.',
          expected: 'Anladım, bende evcil hayvan yok zaten.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {UiLang.tr: 'Evet-hayır sorusunda "mı/mi" eki fiile bitişik ama ayrı yazılır: "boş mu?"'},
        goodExample: 'Daire hâlâ boş mu?',
        badExample: 'Daire hâlâ boşmu?',
      ),
    ),
    Scenario(
      id: 'tr_exp_doctor',
      lang: LearnLang.tr,
      cefr: Cefr.a2,
      minutes: 8,
      titles: {UiLang.tr: 'Doktorda', UiLang.en: "At the doctor's"},
      clipLine: 'Üç gündür ateşim var, gece öksürüyorum.',
      phrases: [
        Phrase(
          id: 'tr_exp_doctor_0',
          target: 'Üç gündür ateşim var, gece öksürüyorum.',
          gloss: {UiLang.tr: 'Üç gündür ateşim var, gece öksürüyorum.', UiLang.en: "I've had a fever for three days and I cough at night."},
        ),
        Phrase(
          id: 'tr_exp_doctor_1',
          target: 'Penisiline alerjim yok.',
          gloss: {UiLang.tr: 'Penisiline alerjim yok.', UiLang.en: "I'm not allergic to penicillin."},
        ),
        Phrase(
          id: 'tr_exp_doctor_2',
          target: 'Bu ilaç uyku getirir mi?',
          gloss: {UiLang.tr: 'Bu ilaç uyku getirir mi?', UiLang.en: 'Does this medicine cause drowsiness?'},
        ),
        Phrase(
          id: 'tr_exp_doctor_3',
          target: 'İşten rapor almam gerekir mi?',
          gloss: {UiLang.tr: 'İşten rapor almam gerekir mi?', UiLang.en: 'Do I need a sick note for work?'},
        ),
        Phrase(
          id: 'tr_exp_doctor_4',
          target: 'Kontrole ne zaman geleyim?',
          gloss: {UiLang.tr: 'Kontrole ne zaman geleyim?', UiLang.en: 'When should I come back for a check-up?'},
        ),
        Phrase(
          id: 'tr_exp_doctor_5',
          target: 'Eczane bina dışında mı?',
          gloss: {UiLang.tr: 'Eczane bina dışında mı?', UiLang.en: 'Is the pharmacy outside the building?'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Ağrı nerede, birden mi başladı?',
          expected: 'Göğsümün sağında, dün akşam başladı.',
        ),
        SpeakTurn(
          prompt: 'Kan tahlili istiyorum.',
          expected: 'Tamam, nereye gitmem gerekiyor?',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {UiLang.tr: 'Şikayeti şimdiki zaman/süre ile anlatın, kendi teşhisinizi koymayın.'},
        goodExample: 'Üç gündür öksürüyorum.',
        badExample: 'Zatürrem var herhalde.',
      ),
    ),
    Scenario(
      id: 'tr_exp_business_lunch',
      lang: LearnLang.tr,
      cefr: Cefr.b1,
      minutes: 10,
      titles: {UiLang.tr: 'İş yemeği', UiLang.en: 'Business lunch'},
      clipLine: 'Mekânı sizin önerinizle seçtim.',
      phrases: [
        Phrase(
          id: 'tr_exp_lunch_0',
          target: 'Mekânı sizin önerinizle seçtim.',
          gloss: {UiLang.tr: 'Mekânı sizin önerinizle seçtim.', UiLang.en: 'I picked the place based on your suggestion.'},
        ),
        Phrase(
          id: 'tr_exp_lunch_1',
          target: 'Alerjiniz veya tercihiniz var mı?',
          gloss: {UiLang.tr: 'Alerjiniz veya tercihiniz var mı?', UiLang.en: 'Do you have any allergies or preferences?'},
        ),
        Phrase(
          id: 'tr_exp_lunch_2',
          target: 'Siparişi vermeden önce gündemi netleştirelim mi?',
          gloss: {UiLang.tr: 'Siparişi vermeden önce gündemi netleştirelim mi?', UiLang.en: 'Shall we align on the agenda before ordering?'},
        ),
        Phrase(
          id: 'tr_exp_lunch_3',
          target: 'Bu teklifi masada detaya boğmayalım, sonra yazarım.',
          gloss: {UiLang.tr: 'Bu teklifi masada detaya boğmayalım, sonra yazarım.', UiLang.en: "Let's not drown this offer in detail here, I'll write it up later."},
        ),
        Phrase(
          id: 'tr_exp_lunch_4',
          target: 'Hesabı biz karşılayalım, bu sefer bizde.',
          gloss: {UiLang.tr: 'Hesabı biz karşılayalım, bu sefer bizde.', UiLang.en: "Let us cover the bill, it's on us this time."},
        ),
        Phrase(
          id: 'tr_exp_lunch_5',
          target: 'Çok verimli oldu, teşekkürler.',
          gloss: {UiLang.tr: 'Çok verimli oldu, teşekkürler.', UiLang.en: 'This was very productive, thank you.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Fiyat hâlâ yüksek geldi.',
          expected: 'Kapsamı iki faza bölebiliriz.',
        ),
        SpeakTurn(
          prompt: 'Bunu düşünelim.',
          expected: 'Tabii, cuma günü tekrar arayayım mı?',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {UiLang.tr: '"-elim/-alım" emir yerine ortak teklif sunar: bölelim, seçelim, karşılayalım.'},
        goodExample: 'Hesabı biz karşılayalım.',
        badExample: 'Hesabı siz ödeyin.',
      ),
    ),
    Scenario(
      id: 'tr_exp_complaint',
      lang: LearnLang.tr,
      cefr: Cefr.b1,
      minutes: 9,
      titles: {UiLang.tr: 'Müşteri şikâyeti', UiLang.en: 'Customer complaint'},
      clipLine: 'Sipariş numaram 1842, hâlâ elime ulaşmadı.',
      phrases: [
        Phrase(
          id: 'tr_exp_complaint_0',
          target: 'Sipariş numaram 1842, hâlâ elime ulaşmadı.',
          gloss: {UiLang.tr: 'Sipariş numaram 1842, hâlâ elime ulaşmadı.', UiLang.en: "My order number is 1842, it still hasn't arrived."},
        ),
        Phrase(
          id: 'tr_exp_complaint_1',
          target: 'Söz verilen tarih dündü.',
          gloss: {UiLang.tr: 'Söz verilen tarih dündü.', UiLang.en: 'The promised date was yesterday.'},
        ),
        Phrase(
          id: 'tr_exp_complaint_2',
          target: 'Çözüm olarak kargo ücreti iadesi istiyorum.',
          gloss: {UiLang.tr: 'Çözüm olarak kargo ücreti iadesi istiyorum.', UiLang.en: 'As a resolution I want a refund on shipping.'},
        ),
        Phrase(
          id: 'tr_exp_complaint_3',
          target: 'Yükseltmem gerekir mi, yoksa siz çözebilir misiniz?',
          gloss: {UiLang.tr: 'Yükseltmem gerekir mi, yoksa siz çözebilir misiniz?', UiLang.en: 'Do I need to escalate this, or can you resolve it?'},
        ),
        Phrase(
          id: 'tr_exp_complaint_4',
          target: 'Yazılı onay gönderebilir misiniz?',
          gloss: {UiLang.tr: 'Yazılı onay gönderebilir misiniz?', UiLang.en: 'Can you send written confirmation?'},
        ),
        Phrase(
          id: 'tr_exp_complaint_5',
          target: 'Sabırlıyım ama bugün net bir tarih lazım.',
          gloss: {UiLang.tr: 'Sabırlıyım ama bugün net bir tarih lazım.', UiLang.en: "I'm patient, but I need a firm date today."},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Özür dileriz, kontrol ediyorum.',
          expected: 'Teşekkürler, saati de not edin lütfen.',
        ),
        SpeakTurn(
          prompt: 'Yarın 14:00’e kadar teslim edilecek.',
          expected: 'Tamam, bu sefer bekliyorum.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {UiLang.tr: 'Şikayette olayı geçmiş zamanla, kanıt gibi anlatın; sitem kipinden kaçının.'},
        goodExample: 'Söz verilen tarih dündü.',
        badExample: 'Hep böyle yapıyorsunuz.',
      ),
    ),
    Scenario(
      id: 'tr_exp_business_trip',
      lang: LearnLang.tr,
      cefr: Cefr.a2,
      minutes: 8,
      titles: {UiLang.tr: 'İş seyahati', UiLang.en: 'Business trip'},
      clipLine: 'PNR kodum şu, boarding pass lütfen.',
      phrases: [
        Phrase(
          id: 'tr_exp_trip_0',
          target: 'PNR kodum şu, boarding pass lütfen.',
          gloss: {UiLang.tr: 'PNR kodum şu, boarding pass lütfen.', UiLang.en: 'Here is my booking code, boarding pass please.'},
        ),
        Phrase(
          id: 'tr_exp_trip_1',
          target: 'El bagajı ölçüsüne uyuyor mu?',
          gloss: {UiLang.tr: 'El bagajı ölçüsüne uyuyor mu?', UiLang.en: 'Does it fit the carry-on size?'},
        ),
        Phrase(
          id: 'tr_exp_trip_2',
          target: 'Uçuş gecikti, bağlantıyı kaçırır mıyım?',
          gloss: {UiLang.tr: 'Uçuş gecikti, bağlantıyı kaçırır mıyım?', UiLang.en: 'The flight is delayed — will I miss my connection?'},
        ),
        Phrase(
          id: 'tr_exp_trip_3',
          target: 'Fatura şirket adına kesilsin.',
          gloss: {UiLang.tr: 'Fatura şirket adına kesilsin.', UiLang.en: 'Please make the invoice out to the company.'},
        ),
        Phrase(
          id: 'tr_exp_trip_4',
          target: 'Lounge kartım var, giriş nerede?',
          gloss: {UiLang.tr: 'Lounge kartım var, giriş nerede?', UiLang.en: "I have a lounge pass, where's the entrance?"},
        ),
        Phrase(
          id: 'tr_exp_trip_5',
          target: 'Taksi fişini saklamam lazım.',
          gloss: {UiLang.tr: 'Taksi fişini saklamam lazım.', UiLang.en: 'I need to keep the taxi receipt.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Pencere mi koridor mu?',
          expected: 'Koridor olsun, çıkışa yakınsa iyi olur.',
        ),
        SpeakTurn(
          prompt: 'Kapı 12, kırk dakika sonra.',
          expected: 'Teşekkürler, oraya doğru gidiyorum.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {UiLang.tr: 'Zorunluluk için "-malı/-meli" ya da "lazım" kullanılır.'},
        goodExample: 'Fişi saklamam lazım.',
        badExample: 'Fişi saklarım belki.',
      ),
    ),
    Scenario(
      id: 'tr_exp_client_call',
      lang: LearnLang.tr,
      cefr: Cefr.b1,
      minutes: 9,
      titles: {UiLang.tr: 'Müşteri telefonu', UiLang.en: 'Client phone call'},
      clipLine: 'Uygun musunuz, beş dakikanızı alacağım.',
      phrases: [
        Phrase(
          id: 'tr_exp_call_0',
          target: 'Uygun musunuz, beş dakikanızı alacağım.',
          gloss: {UiLang.tr: 'Uygun musunuz, beş dakikanızı alacağım.', UiLang.en: 'Is now a good time? I need five minutes.'},
        ),
        Phrase(
          id: 'tr_exp_call_1',
          target: 'Dün maildeki madde 3 net değil.',
          gloss: {UiLang.tr: 'Dün maildeki madde 3 net değil.', UiLang.en: "Point 3 in yesterday's email isn't clear."},
        ),
        Phrase(
          id: 'tr_exp_call_2',
          target: 'Bunu ek iş olarak mı yoksa mevcut kapsama mı alalım?',
          gloss: {UiLang.tr: 'Bunu ek iş olarak mı yoksa mevcut kapsama mı alalım?', UiLang.en: 'Should we treat this as extra work or within the current scope?'},
        ),
        Phrase(
          id: 'tr_exp_call_3',
          target: 'Yanlış anladıysam düzeltin lütfen.',
          gloss: {UiLang.tr: 'Yanlış anladıysam düzeltin lütfen.', UiLang.en: "Please correct me if I've misunderstood."},
        ),
        Phrase(
          id: 'tr_exp_call_4',
          target: 'Özetle: cuma taslak, siz pazartesi yorum.',
          gloss: {UiLang.tr: 'Özetle: cuma taslak, siz pazartesi yorum.', UiLang.en: 'In short: draft on Friday, your feedback on Monday.'},
        ),
        Phrase(
          id: 'tr_exp_call_5',
          target: 'Kayıt için şimdi mail atıyorum.',
          gloss: {UiLang.tr: 'Kayıt için şimdi mail atıyorum.', UiLang.en: "I'm sending an e-mail now for the record."},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Bu özellik olmazsa canlıya çıkamayız.',
          expected: 'O zaman fazı kaydırıp bunu öne alalım.',
        ),
        SpeakTurn(
          prompt: 'Tamam, yazın.',
          expected: 'Hemen yazıyorum, birazdan gönderirim.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {UiLang.tr: 'Koşul cümlesi "-sa/-se" ile telefonda net bir takas kurar.'},
        goodExample: 'Olmazsa canlıya çıkamayız.',
        badExample: 'Olmaz çıkamayız.',
      ),
    ),
    Scenario(
      id: 'tr_exp_hr_salary',
      lang: LearnLang.tr,
      cefr: Cefr.b2,
      minutes: 11,
      titles: {UiLang.tr: 'Maaş görüşmesi', UiLang.en: 'Salary conversation'},
      clipLine: 'Performans dönemini ve piyasayı konuşmak istiyorum.',
      phrases: [
        Phrase(
          id: 'tr_exp_salary_0',
          target: 'Performans dönemini ve piyasayı konuşmak istiyorum.',
          gloss: {UiLang.tr: 'Performans dönemini ve piyasayı konuşmak istiyorum.', UiLang.en: 'I want to discuss the performance period and the market rate.'},
        ),
        Phrase(
          id: 'tr_exp_salary_1',
          target: 'Son altı ayda üç projeyi zamanında teslim ettim.',
          gloss: {UiLang.tr: 'Son altı ayda üç projeyi zamanında teslim ettim.', UiLang.en: 'In the last six months I delivered three projects on time.'},
        ),
        Phrase(
          id: 'tr_exp_salary_2',
          target: 'Beklentim yüzde 15, gerekçesini paylaşabilirim.',
          gloss: {UiLang.tr: 'Beklentim yüzde 15, gerekçesini paylaşabilirim.', UiLang.en: 'My expectation is 15 percent, I can share the reasoning.'},
        ),
        Phrase(
          id: 'tr_exp_salary_3',
          target: 'Unvan şu an işi yansıtmıyor.',
          gloss: {UiLang.tr: 'Unvan şu an işi yansıtmıyor.', UiLang.en: "The title doesn't reflect the job right now."},
        ),
        Phrase(
          id: 'tr_exp_salary_4',
          target: 'Bütçe yoksa zam tarihini netleştirelim.',
          gloss: {UiLang.tr: 'Bütçe yoksa zam tarihini netleştirelim.', UiLang.en: "If there's no budget, let's pin down a date."},
        ),
        Phrase(
          id: 'tr_exp_salary_5',
          target: 'Kararı yazılı almak isterim.',
          gloss: {UiLang.tr: 'Kararı yazılı almak isterim.', UiLang.en: "I'd like the decision in writing."},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Bu yıl bütçe sıkı.',
          expected: 'Anlıyorum; ara zam veya unvan artışı mümkün mü?',
        ),
        SpeakTurn(
          prompt: 'Martta tekrar bakalım.',
          expected: 'Martı takvime yazalım, kriterleri bugün netleştirelim.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {UiLang.tr: 'İsimleştirme ("-ma/-me") duyguyu değil işi konuşturur: "unvan işi yansıtmıyor" gibi.'},
        goodExample: 'Unvan işi yansıtmıyor.',
        badExample: 'Bana değer verilmiyor.',
      ),
    ),
    Scenario(
      id: 'tr_exp_daily_errands',
      lang: LearnLang.tr,
      cefr: Cefr.a2,
      minutes: 7,
      titles: {UiLang.tr: 'Market ve kargo', UiLang.en: 'Errands and deliveries'},
      clipLine: 'Bu ekmekten iki tane, fiş lütfen.',
      phrases: [
        Phrase(
          id: 'tr_exp_errands_0',
          target: 'Bu ekmekten iki tane, fiş lütfen.',
          gloss: {UiLang.tr: 'Bu ekmekten iki tane, fiş lütfen.', UiLang.en: 'Two of this bread, receipt please.'},
        ),
        Phrase(
          id: 'tr_exp_errands_1',
          target: 'Glutensiz reyon nerede?',
          gloss: {UiLang.tr: 'Glutensiz reyon nerede?', UiLang.en: 'Where is the gluten-free aisle?'},
        ),
        Phrase(
          id: 'tr_exp_errands_2',
          target: 'Kargoyu komşuya bırakmayın, kapıya not yazın.',
          gloss: {UiLang.tr: 'Kargoyu komşuya bırakmayın, kapıya not yazın.', UiLang.en: "Don't leave the package with a neighbour, leave a note on the door."},
        ),
        Phrase(
          id: 'tr_exp_errands_3',
          target: 'Nakitim yok, kart geçerli mi?',
          gloss: {UiLang.tr: 'Nakitim yok, kart geçerli mi?', UiLang.en: "I don't have cash, is card OK?"},
        ),
        Phrase(
          id: 'tr_exp_errands_4',
          target: 'İade için 14 gün var değil mi?',
          gloss: {UiLang.tr: 'İade için 14 gün var değil mi?', UiLang.en: "There's 14 days for returns, right?"},
        ),
        Phrase(
          id: 'tr_exp_errands_5',
          target: 'Poşet istemiyorum, çantam var.',
          gloss: {UiLang.tr: 'Poşet istemiyorum, çantam var.', UiLang.en: "I don't need a bag, I have my own."},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Puan kartınız var mı?',
          expected: 'Yok, bu sefer gerekmez.',
        ),
        SpeakTurn(
          prompt: 'Nakit üstü yok, kart çekeyim mi?',
          expected: 'Olur, kartla devam edelim.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {UiLang.tr: 'Günlük hizmette emir kökü yerine istek kipi + "lütfen" daha doğaldır.'},
        goodExample: 'Fiş alabilir miyim?',
        badExample: 'Fiş ver.',
      ),
    ),
    Scenario(
      id: 'tr_exp_networking',
      lang: LearnLang.tr,
      cefr: Cefr.b1,
      minutes: 9,
      titles: {UiLang.tr: 'Networking', UiLang.en: 'Networking'},
      clipLine: 'Ben Ayşe, fintech’te ürün yöneticisiyim.',
      phrases: [
        Phrase(
          id: 'tr_exp_networking_0',
          target: 'Ben Ayşe, fintech’te ürün yöneticisiyim.',
          gloss: {UiLang.tr: 'Ben Ayşe, fintech’te ürün yöneticisiyim.', UiLang.en: "I'm Ayşe, I'm a product manager in fintech."},
        ),
        Phrase(
          id: 'tr_exp_networking_1',
          target: 'Sizin konuşmanızdaki ödeme örneği çok netti.',
          gloss: {UiLang.tr: 'Sizin konuşmanızdaki ödeme örneği çok netti.', UiLang.en: 'The payments example in your talk was very clear.'},
        ),
        Phrase(
          id: 'tr_exp_networking_2',
          target: 'Sizde de benzer bir sorun var mı?',
          gloss: {UiLang.tr: 'Sizde de benzer bir sorun var mı?', UiLang.en: 'Do you face a similar problem too?'},
        ),
        Phrase(
          id: 'tr_exp_networking_3',
          target: 'Kartvizitim kalmadı, LinkedIn’den yazayım mı?',
          gloss: {UiLang.tr: 'Kartvizitim kalmadı, LinkedIn’den yazayım mı?', UiLang.en: "I'm out of cards — should I message you on LinkedIn?"},
        ),
        Phrase(
          id: 'tr_exp_networking_4',
          target: 'İki dakikanız var mı, çok kısa keseceğim.',
          gloss: {UiLang.tr: 'İki dakikanız var mı, çok kısa keseceğim.', UiLang.en: "Do you have two minutes, I'll be brief."},
        ),
        Phrase(
          id: 'tr_exp_networking_5',
          target: 'Sizi biriyle tanıştırayım, belki işinize yarar.',
          gloss: {UiLang.tr: 'Sizi biriyle tanıştırayım, belki işinize yarar.', UiLang.en: 'Let me introduce you to someone, it might help.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Ne üzerine çalışıyorsunuz?',
          expected: 'Küçük işletmeler için fatura tahsilatını kolaylaştırıyoruz.',
        ),
        SpeakTurn(
          prompt: 'İlginç, yazın bana.',
          expected: 'Yazarım, teşekkürler.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {UiLang.tr: 'Networking\'de "yapıyorum" yerine kimlik cümlesi kullanılır: "yöneticisiyim", "danışmanım".'},
        goodExample: 'Ürün yöneticisiyim.',
        badExample: 'Ürün yönetiyorum bir şirkette falan.',
      ),
    ),
  ];
}
