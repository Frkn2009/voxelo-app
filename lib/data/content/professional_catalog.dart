import '../models/models.dart';
import 'professional_catalog_de.dart';
import 'professional_catalog_fr.dart';
import 'professional_catalog_es.dart';
import 'professional_catalog_nl.dart';
import 'professional_catalog_ar.dart';

/// İş/profesyonel hayat senaryoları — turistik temel setin ötesinde,
/// toplantı, görüşme, geri bildirim gibi gerçek işyeri durumları için
/// özgün, tekrarsız içerik. Altı hedef dil için ayrı kataloglara yönlendirir.
class ProfessionalCatalog {
  static List<Scenario> build(LearnLang language) {
    return switch (language) {
      LearnLang.en => _englishScenarios,
      LearnLang.de => ProfessionalCatalogDe.build(language),
      LearnLang.fr => ProfessionalCatalogFr.build(language),
      LearnLang.es => ProfessionalCatalogEs.build(language),
      LearnLang.nl => ProfessionalCatalogNl.build(language),
      LearnLang.ar => ProfessionalCatalogAr.build(language),
      _ => const [],
    };
  }

  static final List<Scenario> _englishScenarios = [
    Scenario(
      id: 'en_pro_interview',
      lang: LearnLang.en,
      cefr: Cefr.b1,
      minutes: 10,
      titles: {
        UiLang.tr: 'İş görüşmesi: Kendini tanıtmak',
        UiLang.en: 'Job interview: Introducing yourself',
      },
      clipLine: "I'd like to walk you through my background.",
      phrases: [
        Phrase(
          id: 'en_pro_interview_0',
          target: "I'd like to walk you through my background.",
          gloss: {UiLang.tr: 'Geçmişimi sizinle özetlemek isterim.'},
        ),
        Phrase(
          id: 'en_pro_interview_1',
          target:
              "I've spent the last three years working in project management.",
          gloss: {UiLang.tr: 'Son üç yıldır proje yönetiminde çalışıyorum.'},
        ),
        Phrase(
          id: 'en_pro_interview_2',
          target: 'What I enjoy most is solving problems under pressure.',
          gloss: {
            UiLang.tr: 'En çok keyif aldığım şey baskı altında sorun çözmek.',
          },
        ),
        Phrase(
          id: 'en_pro_interview_3',
          target: "Could you tell me more about the team I'd be joining?",
          gloss: {
            UiLang.tr:
                'Katılacağım ekip hakkında biraz daha bilgi verebilir misiniz?',
          },
        ),
        Phrase(
          id: 'en_pro_interview_4',
          target: "That's a great question — let me think for a second.",
          gloss: {UiLang.tr: 'Çok iyi bir soru — bir saniye düşüneyim.'},
        ),
        Phrase(
          id: 'en_pro_interview_5',
          target:
              'Thank you for your time, I look forward to hearing from you.',
          gloss: {
            UiLang.tr:
                'Vaktiniz için teşekkürler, sizden haber almayı dört gözle bekliyorum.',
          },
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Tell me about yourself.',
          expected: "I'd like to walk you through my background.",
        ),
        SpeakTurn(
          prompt: 'What is your experience?',
          expected:
              "I've spent the last three years working in project management.",
        ),
        SpeakTurn(
          prompt: 'What do you enjoy about your work?',
          expected: 'What I enjoy most is solving problems under pressure.',
        ),
        SpeakTurn(
          prompt: 'Do you have any questions for us?',
          expected: "Could you tell me more about the team I'd be joining?",
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '"I\'ve spent" (present perfect) devam eden bir süreyi anlatır — bitmiş bir olay için "I spent" kullanılır.',
        },
        goodExample: "I've spent three years in project management.",
        badExample: "I spent three years in project management since 2021.",
      ),
    ),
    Scenario(
      id: 'en_pro_meeting_request',
      lang: LearnLang.en,
      cefr: Cefr.b1,
      minutes: 9,
      titles: {
        UiLang.tr: 'Toplantı talep etmek',
        UiLang.en: 'Requesting a meeting',
      },
      clipLine: 'Do you have fifteen minutes to sync this week?',
      phrases: [
        Phrase(
          id: 'en_pro_meeting_0',
          target: 'Do you have fifteen minutes to sync this week?',
          gloss: {UiLang.tr: 'Bu hafta senkron için on beş dakikanız var mı?'},
        ),
        Phrase(
          id: 'en_pro_meeting_1',
          target: "I'd like to run a few things by you before we launch.",
          gloss: {
            UiLang.tr: 'Lansmandan önce birkaç şeyi sizinle konuşmak isterim.',
          },
        ),
        Phrase(
          id: 'en_pro_meeting_2',
          target: 'Would Thursday afternoon work for you?',
          gloss: {UiLang.tr: 'Perşembe öğleden sonra sizin için uygun mu?'},
        ),
        Phrase(
          id: 'en_pro_meeting_3',
          target: "Let's push it to next week if that's easier.",
          gloss: {
            UiLang.tr: 'Daha kolay olacaksa gelecek haftaya erteleyelim.',
          },
        ),
        Phrase(
          id: 'en_pro_meeting_4',
          target: "I'll send over a calendar invite with the agenda.",
          gloss: {
            UiLang.tr: 'Gündemle birlikte bir takvim daveti göndereceğim.',
          },
        ),
        Phrase(
          id: 'en_pro_meeting_5',
          target: "Looking forward to catching up.",
          gloss: {UiLang.tr: 'Görüşmeyi dört gözle bekliyorum.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'You need to schedule a sync with a colleague.',
          expected: 'Do you have fifteen minutes to sync this week?',
        ),
        SpeakTurn(
          prompt: 'They ask why.',
          expected: "I'd like to run a few things by you before we launch.",
        ),
        SpeakTurn(
          prompt: 'Propose a specific time.',
          expected: 'Would Thursday afternoon work for you?',
          scaffold: 'Would ... work for you?',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Nazik öneriler için "Would ... work for you?" kalıbı, doğrudan "Can you...?" sormaktan daha profesyonel durur.',
        },
        goodExample: 'Would Thursday work for you?',
        badExample: 'Can you Thursday?',
      ),
    ),
    Scenario(
      id: 'en_pro_update',
      lang: LearnLang.en,
      cefr: Cefr.b1,
      minutes: 10,
      titles: {
        UiLang.tr: 'Proje güncellemesi sunmak',
        UiLang.en: 'Presenting a project update',
      },
      clipLine: "We're on track to hit the deadline.",
      phrases: [
        Phrase(
          id: 'en_pro_update_0',
          target: "We're on track to hit the deadline.",
          gloss: {UiLang.tr: 'Teslim tarihini yakalama konusunda yolundayız.'},
        ),
        Phrase(
          id: 'en_pro_update_1',
          target: "There's one blocker I want to flag.",
          gloss: {UiLang.tr: 'Belirtmek istediğim bir engel var.'},
        ),
        Phrase(
          id: 'en_pro_update_2',
          target: 'We need one more resource to keep the pace up.',
          gloss: {
            UiLang.tr: 'Hızı korumak için bir kaynağa daha ihtiyacımız var.',
          },
        ),
        Phrase(
          id: 'en_pro_update_3',
          target: "Here's what we've completed since last week.",
          gloss: {
            UiLang.tr: 'Geçen haftadan bu yana tamamladıklarımız bunlar.',
          },
        ),
        Phrase(
          id: 'en_pro_update_4',
          target: "Any questions before I move to the next slide?",
          gloss: {
            UiLang.tr: 'Bir sonraki slayda geçmeden önce sorusu olan var mı?',
          },
        ),
        Phrase(
          id: 'en_pro_update_5',
          target: "I'll follow up with the details in writing.",
          gloss: {UiLang.tr: 'Detayları yazılı olarak takip edeceğim.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Open the status update.',
          expected: "We're on track to hit the deadline.",
        ),
        SpeakTurn(
          prompt: 'Raise a concern.',
          expected: "There's one blocker I want to flag.",
        ),
        SpeakTurn(
          prompt: 'Ask for what you need.',
          expected: 'We need one more resource to keep the pace up.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '"On track to" + fiil, bir hedefe doğru ilerlediğini belirtmek için kullanılır.',
        },
        goodExample: "We're on track to finish early.",
        badExample: 'We are on track for finish early.',
      ),
    ),
    Scenario(
      id: 'en_pro_feedback',
      lang: LearnLang.en,
      cefr: Cefr.b2,
      minutes: 11,
      titles: {
        UiLang.tr: 'Yapıcı geri bildirim vermek',
        UiLang.en: 'Giving constructive feedback',
      },
      clipLine: "I want to share some feedback, is now a good time?",
      phrases: [
        Phrase(
          id: 'en_pro_feedback_0',
          target: 'I want to share some feedback, is now a good time?',
          gloss: {
            UiLang.tr: 'Bir geri bildirim paylaşmak istiyorum, şimdi uygun mu?',
          },
        ),
        Phrase(
          id: 'en_pro_feedback_1',
          target:
              'Overall the report was solid, but a couple of things stood out.',
          gloss: {
            UiLang.tr:
                'Genel olarak rapor sağlamdı ama birkaç şey dikkatimi çekti.',
          },
        ),
        Phrase(
          id: 'en_pro_feedback_2',
          target: 'Next time, it would help to include the numbers up front.',
          gloss: {
            UiLang.tr:
                'Bir dahaki sefere rakamları en başa koymak yardımcı olur.',
          },
        ),
        Phrase(
          id: 'en_pro_feedback_3',
          target:
              "I really appreciated how you handled the client's questions.",
          gloss: {
            UiLang.tr:
                "Müşterinin sorularını ele alış şeklini gerçekten takdir ettim.",
          },
        ),
        Phrase(
          id: 'en_pro_feedback_4',
          target: 'How do you feel about the outcome yourself?',
          gloss: {UiLang.tr: 'Sonuç hakkında kendin ne düşünüyorsun?'},
        ),
        Phrase(
          id: 'en_pro_feedback_5',
          target: "Let's check in again after the next milestone.",
          gloss: {
            UiLang.tr: 'Bir sonraki kilometre taşından sonra tekrar konuşalım.',
          },
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Ask permission before giving feedback.',
          expected: 'I want to share some feedback, is now a good time?',
        ),
        SpeakTurn(
          prompt: 'Point out one thing to improve, gently.',
          expected: 'Next time, it would help to include the numbers up front.',
        ),
        SpeakTurn(
          prompt: 'Acknowledge something they did well.',
          expected:
              "I really appreciated how you handled the client's questions.",
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '"It would help to..." doğrudan bir emirden ("You should...") daha yumuşak bir öneri sunar.',
        },
        goodExample: 'It would help to add the numbers.',
        badExample: 'You must add the numbers.',
      ),
    ),
    Scenario(
      id: 'en_pro_deadline',
      lang: LearnLang.en,
      cefr: Cefr.b1,
      minutes: 9,
      titles: {
        UiLang.tr: 'Teslim tarihi için pazarlık',
        UiLang.en: 'Negotiating a deadline',
      },
      clipLine: "I'm concerned we won't make Friday.",
      phrases: [
        Phrase(
          id: 'en_pro_deadline_0',
          target: "I'm concerned we won't make Friday.",
          gloss: {UiLang.tr: 'Cumaya yetiştiremeyeceğimizden endişeliyim.'},
        ),
        Phrase(
          id: 'en_pro_deadline_1',
          target: 'Would it be possible to move the deadline to Monday?',
          gloss: {
            UiLang.tr: 'Teslim tarihini pazartesiye taşımak mümkün olur mu?',
          },
        ),
        Phrase(
          id: 'en_pro_deadline_2',
          target: 'We could deliver a partial version by Friday instead.',
          gloss: {
            UiLang.tr:
                'Bunun yerine cumaya kadar kısmi bir versiyon teslim edebiliriz.',
          },
        ),
        Phrase(
          id: 'en_pro_deadline_3',
          target: 'What would you need from us to make that work?',
          gloss: {UiLang.tr: 'Bunun olması için bizden neye ihtiyacınız olur?'},
        ),
        Phrase(
          id: 'en_pro_deadline_4',
          target:
              "Let's agree on a realistic date now, rather than slip again later.",
          gloss: {
            UiLang.tr:
                'Daha sonra tekrar kaymaktansa şimdi gerçekçi bir tarihte anlaşalım.',
          },
        ),
        Phrase(
          id: 'en_pro_deadline_5',
          target: "Monday works. I'll confirm in writing.",
          gloss: {UiLang.tr: 'Pazartesi uygun. Yazılı olarak teyit edeceğim.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Raise the risk early.',
          expected: "I'm concerned we won't make Friday.",
        ),
        SpeakTurn(
          prompt: 'Propose an alternative.',
          expected: 'Would it be possible to move the deadline to Monday?',
        ),
        SpeakTurn(
          prompt: 'Offer a compromise.',
          expected: 'We could deliver a partial version by Friday instead.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '"Would it be possible to...?" istek yumuşatma kalıbıdır; "Can we...?"tan daha resmidir.',
        },
        goodExample: 'Would it be possible to extend the deadline?',
        badExample: 'Is it possible extend the deadline?',
      ),
    ),
    Scenario(
      id: 'en_pro_networking',
      lang: LearnLang.en,
      cefr: Cefr.a2,
      minutes: 8,
      titles: {
        UiLang.tr: 'Networking sohbeti',
        UiLang.en: 'Networking small talk',
      },
      clipLine: 'So, what brings you to this conference?',
      phrases: [
        Phrase(
          id: 'en_pro_network_0',
          target: 'So, what brings you to this conference?',
          gloss: {UiLang.tr: 'Peki, seni bu konferansa getiren ne?'},
        ),
        Phrase(
          id: 'en_pro_network_1',
          target: "I'm here scouting for new partnerships, mostly.",
          gloss: {
            UiLang.tr: 'Daha çok yeni iş birlikleri araştırmak için buradayım.',
          },
        ),
        Phrase(
          id: 'en_pro_network_2',
          target: "That's interesting, tell me more about what you do.",
          gloss: {
            UiLang.tr:
                'Bu ilginç, ne yaptığınızdan biraz daha bahseder misiniz?',
          },
        ),
        Phrase(
          id: 'en_pro_network_3',
          target: "Here's my card — let's stay in touch.",
          gloss: {UiLang.tr: 'İşte kartım — iletişimde kalalım.'},
        ),
        Phrase(
          id: 'en_pro_network_4',
          target: "I'll connect with you on LinkedIn after this.",
          gloss: {
            UiLang.tr: "Bundan sonra sizinle LinkedIn'de bağlantı kuracağım.",
          },
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Start a conversation at a networking event.',
          expected: 'So, what brings you to this conference?',
        ),
        SpeakTurn(
          prompt: 'Explain why you are there.',
          expected: "I'm here scouting for new partnerships, mostly.",
        ),
        SpeakTurn(
          prompt: 'End the exchange warmly.',
          expected: "Here's my card — let's stay in touch.",
        ),
      ],
    ),
    Scenario(
      id: 'en_pro_client_call',
      lang: LearnLang.en,
      cefr: Cefr.b2,
      minutes: 10,
      titles: {
        UiLang.tr: 'Müşteri şikayeti telefonu',
        UiLang.en: 'Handling a client complaint call',
      },
      clipLine: 'I understand how frustrating this must be.',
      phrases: [
        Phrase(
          id: 'en_pro_client_0',
          target: 'I understand how frustrating this must be.',
          gloss: {UiLang.tr: 'Bunun ne kadar sinir bozucu olduğunu anlıyorum.'},
        ),
        Phrase(
          id: 'en_pro_client_1',
          target: 'Let me pull up your account and take a closer look.',
          gloss: {UiLang.tr: 'Hesabınızı açıp daha yakından bakayım.'},
        ),
        Phrase(
          id: 'en_pro_client_2',
          target: "I can see exactly where things went wrong.",
          gloss: {
            UiLang.tr:
                'İşlerin nerede yanlış gittiğini tam olarak görebiliyorum.',
          },
        ),
        Phrase(
          id: 'en_pro_client_3',
          target: "Here's what I'm going to do to fix this for you.",
          gloss: {
            UiLang.tr: 'Bunu sizin için düzeltmek için yapacağım şey bu.',
          },
        ),
        Phrase(
          id: 'en_pro_client_4',
          target: "I'll personally follow up by end of day.",
          gloss: {UiLang.tr: 'Gün sonuna kadar bizzat takip edeceğim.'},
        ),
        Phrase(
          id: 'en_pro_client_5',
          target: 'Thank you for your patience while we sorted this out.',
          gloss: {
            UiLang.tr:
                'Bunu çözerken gösterdiğiniz sabır için teşekkür ederim.',
          },
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'The client is upset. Show empathy first.',
          expected: 'I understand how frustrating this must be.',
        ),
        SpeakTurn(
          prompt: 'Move to investigating the issue.',
          expected: 'Let me pull up your account and take a closer look.',
        ),
        SpeakTurn(
          prompt: 'Commit to a concrete next step.',
          expected: "Here's what I'm going to do to fix this for you.",
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Empati göstermek için önce duyguyu onaylamak ("I understand..."), çözüme geçmeden önce gelir.',
        },
        goodExample:
            'I understand how frustrating this is. Let me look into it.',
        badExample:
            'Let me look into it. I understand how frustrating this is.',
      ),
    ),
    Scenario(
      id: 'en_pro_raise',
      lang: LearnLang.en,
      cefr: Cefr.b2,
      minutes: 11,
      titles: {UiLang.tr: 'Zam görüşmesi', UiLang.en: 'Asking for a raise'},
      clipLine: "I'd like to talk about my compensation.",
      phrases: [
        Phrase(
          id: 'en_pro_raise_0',
          target: "I'd like to talk about my compensation.",
          gloss: {UiLang.tr: 'Maaşım hakkında konuşmak istiyorum.'},
        ),
        Phrase(
          id: 'en_pro_raise_1',
          target:
              "Over the past year I've taken on significantly more responsibility.",
          gloss: {
            UiLang.tr:
                'Geçen yıl boyunca önemli ölçüde daha fazla sorumluluk üstlendim.',
          },
        ),
        Phrase(
          id: 'en_pro_raise_2',
          target:
              "I've done some research and my role is currently below market rate.",
          gloss: {
            UiLang.tr:
                'Biraz araştırma yaptım ve pozisyonum şu anda piyasa oranının altında.',
          },
        ),
        Phrase(
          id: 'en_pro_raise_3',
          target: "I'm asking for a raise of ten percent.",
          gloss: {UiLang.tr: 'Yüzde on zam talep ediyorum.'},
        ),
        Phrase(
          id: 'en_pro_raise_4',
          target: "I hear you, and I'll need some time to review this.",
          gloss: {
            UiLang.tr:
                'Sizi anlıyorum ve bunu değerlendirmek için biraz zamana ihtiyacım olacak.',
          },
        ),
        Phrase(
          id: 'en_pro_raise_5',
          target: 'Of course, when could we revisit this?',
          gloss: {UiLang.tr: 'Tabii ki, bunu ne zaman tekrar konuşabiliriz?'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Open the topic directly but politely.',
          expected: "I'd like to talk about my compensation.",
        ),
        SpeakTurn(
          prompt: 'Justify it with evidence.',
          expected:
              "I've done some research and my role is currently below market rate.",
        ),
        SpeakTurn(
          prompt: 'State a specific number.',
          expected: "I'm asking for a raise of ten percent.",
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '"I\'ve taken on" (present perfect) son dönemde biriken bir değişimi vurgular, geçmiş zamandan daha güçlüdür.',
        },
        goodExample: "I've taken on more responsibility this year.",
        badExample: 'I take more responsibility this year.',
      ),
    ),
  ];
}
