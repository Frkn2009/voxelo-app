import '../models/models.dart';

/// Doğal profesyonel dil; Türkçe açıklamalar ve kaynak kimlik son ekleri korunur.
class ProfessionalCatalogFr {
  static List<Scenario> build(LearnLang language) =>
      language == LearnLang.fr ? _scenarios : const [];

  static final List<Scenario> _scenarios = [
    Scenario(
      id: 'fr_pro_interview',
      lang: LearnLang.fr,
      cefr: Cefr.b1,
      minutes: 10,
      titles: {
        UiLang.tr: 'İş görüşmesi: Kendini tanıtmak',
        UiLang.en: 'Job interview: Introducing yourself',
        UiLang.fr: 'Entretien d’embauche : se présenter',
      },
      clipLine:
          'J’aimerais vous présenter brièvement mon parcours professionnel.',
      phrases: [
        Phrase(
          id: 'fr_pro_interview_0',
          target:
              'J’aimerais vous présenter brièvement mon parcours professionnel.',
          gloss: {UiLang.tr: 'Geçmişimi sizinle özetlemek isterim.'},
        ),
        Phrase(
          id: 'fr_pro_interview_1',
          target: 'Je travaille dans la gestion de projet depuis trois ans.',
          gloss: {UiLang.tr: 'Son üç yıldır proje yönetiminde çalışıyorum.'},
        ),
        Phrase(
          id: 'fr_pro_interview_2',
          target:
              'Ce qui me plaît le plus, c’est de résoudre des problèmes sous pression.',
          gloss: {
            UiLang.tr: 'En çok keyif aldığım şey baskı altında sorun çözmek.',
          },
        ),
        Phrase(
          id: 'fr_pro_interview_3',
          target:
              'Pourriez-vous m’en dire plus sur l’équipe que je rejoindrais ?',
          gloss: {
            UiLang.tr:
                'Katılacağım ekip hakkında biraz daha bilgi verebilir misiniz?',
          },
        ),
        Phrase(
          id: 'fr_pro_interview_4',
          target:
              'C’est une très bonne question. Laissez-moi réfléchir un instant.',
          gloss: {UiLang.tr: 'Çok iyi bir soru — bir saniye düşüneyim.'},
        ),
        Phrase(
          id: 'fr_pro_interview_5',
          target:
              'Merci de m’avoir accordé votre temps. J’attends votre retour avec intérêt.',
          gloss: {
            UiLang.tr:
                'Vaktiniz için teşekkürler, sizden haber almayı dört gözle bekliyorum.',
          },
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Parlez-moi de vous.',
          expected:
              'J’aimerais vous présenter brièvement mon parcours professionnel.',
        ),
        SpeakTurn(
          prompt: 'Quelle est votre expérience professionnelle ?',
          expected: 'Je travaille dans la gestion de projet depuis trois ans.',
        ),
        SpeakTurn(
          prompt: 'Qu’est-ce qui vous plaît dans votre travail ?',
          expected:
              'Ce qui me plaît le plus, c’est de résoudre des problèmes sous pression.',
        ),
        SpeakTurn(
          prompt: 'Avez-vous des questions à nous poser ?',
          expected:
              'Pourriez-vous m’en dire plus sur l’équipe que je rejoindrais ?',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Fransızcada geçmişte başlayıp hâlen süren bir durum “depuis” ve présent ile anlatılır; “pendant” belirli bir süreyi ifade eder. Üç yıl için çoğul “trois ans” gerekir.',
        },
        goodExample: 'Je travaille dans la gestion de projet depuis trois ans.',
        badExample: 'Je travaille dans la gestion de projet depuis trois an.',
      ),
    ),
    Scenario(
      id: 'fr_pro_meeting_request',
      lang: LearnLang.fr,
      cefr: Cefr.b1,
      minutes: 9,
      titles: {
        UiLang.tr: 'Toplantı talep etmek',
        UiLang.en: 'Requesting a meeting',
        UiLang.fr: 'Demander un rendez-vous',
      },
      clipLine:
          'Auriez-vous un quart d’heure cette semaine pour faire le point ?',
      phrases: [
        Phrase(
          id: 'fr_pro_meeting_0',
          target:
              'Auriez-vous un quart d’heure cette semaine pour faire le point ?',
          gloss: {UiLang.tr: 'Bu hafta senkron için on beş dakikanız var mı?'},
        ),
        Phrase(
          id: 'fr_pro_meeting_1',
          target:
              'J’aimerais discuter de quelques points avec vous avant le lancement.',
          gloss: {
            UiLang.tr: 'Lansmandan önce birkaç şeyi sizinle konuşmak isterim.',
          },
        ),
        Phrase(
          id: 'fr_pro_meeting_2',
          target: 'Est-ce que jeudi après-midi vous conviendrait ?',
          gloss: {UiLang.tr: 'Perşembe öğleden sonra sizin için uygun mu?'},
        ),
        Phrase(
          id: 'fr_pro_meeting_3',
          target:
              'Reportons cela à la semaine prochaine si cela vous arrange davantage.',
          gloss: {
            UiLang.tr: 'Daha kolay olacaksa gelecek haftaya erteleyelim.',
          },
        ),
        Phrase(
          id: 'fr_pro_meeting_4',
          target:
              'Je vous enverrai une invitation dans votre agenda avec l’ordre du jour.',
          gloss: {
            UiLang.tr: 'Gündemle birlikte bir takvim daveti göndereceğim.',
          },
        ),
        Phrase(
          id: 'fr_pro_meeting_5',
          target: 'Au plaisir d’échanger avec vous.',
          gloss: {UiLang.tr: 'Görüşmeyi dört gözle bekliyorum.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Proposez un rendez-vous à un collègue pour faire le point.',
          expected:
              'Auriez-vous un quart d’heure cette semaine pour faire le point ?',
        ),
        SpeakTurn(
          prompt: 'Il vous demande pourquoi.',
          expected:
              'J’aimerais discuter de quelques points avec vous avant le lancement.',
        ),
        SpeakTurn(
          prompt: 'Proposez un créneau précis.',
          expected: 'Est-ce que jeudi après-midi vous conviendrait ?',
          scaffold: 'Est-ce que … vous conviendrait ?',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '“convenir” fiili “à quelqu’un” ile kullanılır; “vous” dolaylı nesne zamiridir. Conditionnel nazik öneri kurar.',
        },
        goodExample: 'Est-ce que jeudi vous conviendrait ?',
        badExample: 'Est-ce que vous conviendriez jeudi ?',
      ),
    ),
    Scenario(
      id: 'fr_pro_update',
      lang: LearnLang.fr,
      cefr: Cefr.b1,
      minutes: 10,
      titles: {
        UiLang.tr: 'Proje güncellemesi sunmak',
        UiLang.en: 'Presenting a project update',
        UiLang.fr: 'Présenter l’avancement d’un projet',
      },
      clipLine: 'Nous sommes dans les temps pour respecter l’échéance.',
      phrases: [
        Phrase(
          id: 'fr_pro_update_0',
          target: 'Nous sommes dans les temps pour respecter l’échéance.',
          gloss: {UiLang.tr: 'Teslim tarihini yakalama konusunda yolundayız.'},
        ),
        Phrase(
          id: 'fr_pro_update_1',
          target:
              'Il y a toutefois un point bloquant que je voudrais signaler.',
          gloss: {UiLang.tr: 'Belirtmek istediğim bir engel var.'},
        ),
        Phrase(
          id: 'fr_pro_update_2',
          target:
              'Il nous faut une personne supplémentaire pour maintenir le rythme.',
          gloss: {
            UiLang.tr: 'Hızı korumak için bir kaynağa daha ihtiyacımız var.',
          },
        ),
        Phrase(
          id: 'fr_pro_update_3',
          target: 'Voici ce que nous avons terminé depuis la semaine dernière.',
          gloss: {
            UiLang.tr: 'Geçen haftadan bu yana tamamladıklarımız bunlar.',
          },
        ),
        Phrase(
          id: 'fr_pro_update_4',
          target:
              'Avez-vous des questions avant que je passe à la diapositive suivante ?',
          gloss: {
            UiLang.tr: 'Bir sonraki slayda geçmeden önce sorusu olan var mı?',
          },
        ),
        Phrase(
          id: 'fr_pro_update_5',
          target: 'Je vous transmettrai les détails par écrit.',
          gloss: {UiLang.tr: 'Detayları yazılı olarak takip edeceğim.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Commencez votre point sur l’avancement du projet.',
          expected: 'Nous sommes dans les temps pour respecter l’échéance.',
        ),
        SpeakTurn(
          prompt: 'Signalez une difficulté.',
          expected:
              'Il y a toutefois un point bloquant que je voudrais signaler.',
        ),
        SpeakTurn(
          prompt: 'Demandez les moyens dont vous avez besoin.',
          expected:
              'Il nous faut une personne supplémentaire pour maintenir le rythme.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '“pour”dan sonra amaç bildiren fiil mastar hâlinde kullanılır.',
        },
        goodExample: 'Nous sommes dans les temps pour respecter l’échéance.',
        badExample: 'Nous sommes dans les temps pour respectons l’échéance.',
      ),
    ),
    Scenario(
      id: 'fr_pro_feedback',
      lang: LearnLang.fr,
      cefr: Cefr.b2,
      minutes: 11,
      titles: {
        UiLang.tr: 'Yapıcı geri bildirim vermek',
        UiLang.en: 'Giving constructive feedback',
        UiLang.fr: 'Faire un retour constructif',
      },
      clipLine: 'J’aimerais vous faire un retour. Est-ce le bon moment ?',
      phrases: [
        Phrase(
          id: 'fr_pro_feedback_0',
          target: 'J’aimerais vous faire un retour. Est-ce le bon moment ?',
          gloss: {
            UiLang.tr: 'Bir geri bildirim paylaşmak istiyorum, şimdi uygun mu?',
          },
        ),
        Phrase(
          id: 'fr_pro_feedback_1',
          target:
              'Dans l’ensemble, le rapport était solide, mais quelques points ont retenu mon attention.',
          gloss: {
            UiLang.tr:
                'Genel olarak rapor sağlamdı ama birkaç şey dikkatimi çekti.',
          },
        ),
        Phrase(
          id: 'fr_pro_feedback_2',
          target:
              'La prochaine fois, il serait utile de présenter les chiffres dès le début.',
          gloss: {
            UiLang.tr:
                'Bir dahaki sefere rakamları en başa koymak yardımcı olur.',
          },
        ),
        Phrase(
          id: 'fr_pro_feedback_3',
          target:
              'J’ai beaucoup apprécié la façon dont vous avez répondu aux questions du client.',
          gloss: {
            UiLang.tr:
                "Müşterinin sorularını ele alış şeklini gerçekten takdir ettim.",
          },
        ),
        Phrase(
          id: 'fr_pro_feedback_4',
          target: 'Quel regard portez-vous vous-même sur le résultat ?',
          gloss: {UiLang.tr: 'Sonuç hakkında kendin ne düşünüyorsun?'},
        ),
        Phrase(
          id: 'fr_pro_feedback_5',
          target: 'Refaisons le point après la prochaine étape clé.',
          gloss: {
            UiLang.tr: 'Bir sonraki kilometre taşından sonra tekrar konuşalım.',
          },
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Demandez si le moment convient avant de faire un retour.',
          expected: 'J’aimerais vous faire un retour. Est-ce le bon moment ?',
        ),
        SpeakTurn(
          prompt: 'Suggérez avec tact un point à améliorer.',
          expected:
              'La prochaine fois, il serait utile de présenter les chiffres dès le début.',
        ),
        SpeakTurn(
          prompt: 'Soulignez quelque chose qui a été bien fait.',
          expected:
              'J’ai beaucoup apprécié la façon dont vous avez répondu aux questions du client.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '“Il serait utile de + mastar” yumuşak bir öneridir. Kötü örnek dilbilgisel olarak doğru olsa da emir tonu taşır.',
        },
        goodExample: 'Il serait utile d’ajouter les chiffres.',
        badExample: 'Vous devez ajouter les chiffres.',
      ),
    ),
    Scenario(
      id: 'fr_pro_deadline',
      lang: LearnLang.fr,
      cefr: Cefr.b1,
      minutes: 9,
      titles: {
        UiLang.tr: 'Teslim tarihi için pazarlık',
        UiLang.en: 'Negotiating a deadline',
        UiLang.fr: 'Négocier une date de livraison',
      },
      clipLine: 'Je crains que nous ne puissions pas terminer d’ici vendredi.',
      phrases: [
        Phrase(
          id: 'fr_pro_deadline_0',
          target:
              'Je crains que nous ne puissions pas terminer d’ici vendredi.',
          gloss: {UiLang.tr: 'Cumaya yetiştiremeyeceğimizden endişeliyim.'},
        ),
        Phrase(
          id: 'fr_pro_deadline_1',
          target: 'Serait-il possible de reporter l’échéance à lundi ?',
          gloss: {
            UiLang.tr: 'Teslim tarihini pazartesiye taşımak mümkün olur mu?',
          },
        ),
        Phrase(
          id: 'fr_pro_deadline_2',
          target:
              'Nous pourrions plutôt livrer une version partielle d’ici vendredi.',
          gloss: {
            UiLang.tr:
                'Bunun yerine cumaya kadar kısmi bir versiyon teslim edebiliriz.',
          },
        ),
        Phrase(
          id: 'fr_pro_deadline_3',
          target:
              'De quoi auriez-vous besoin de notre part pour que cela fonctionne ?',
          gloss: {UiLang.tr: 'Bunun olması için bizden neye ihtiyacınız olur?'},
        ),
        Phrase(
          id: 'fr_pro_deadline_4',
          target:
              'Fixons dès maintenant une date réaliste pour éviter un nouveau report.',
          gloss: {
            UiLang.tr:
                'Daha sonra tekrar kaymaktansa şimdi gerçekçi bir tarihte anlaşalım.',
          },
        ),
        Phrase(
          id: 'fr_pro_deadline_5',
          target: 'Lundi me convient. Je vous le confirme par écrit.',
          gloss: {UiLang.tr: 'Pazartesi uygun. Yazılı olarak teyit edeceğim.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Signalez le risque sans attendre.',
          expected:
              'Je crains que nous ne puissions pas terminer d’ici vendredi.',
        ),
        SpeakTurn(
          prompt: 'Proposez une autre date.',
          expected: 'Serait-il possible de reporter l’échéance à lundi ?',
        ),
        SpeakTurn(
          prompt: 'Proposez un compromis.',
          expected:
              'Nous pourrions plutôt livrer une version partielle d’ici vendredi.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '“Il serait possible de + mastar” yapısında “de” gereklidir; sesli harften önce “d’” olur.',
        },
        goodExample: 'Serait-il possible de reporter l’échéance ?',
        badExample: 'Serait-il possible reporter l’échéance ?',
      ),
    ),
    Scenario(
      id: 'fr_pro_networking',
      lang: LearnLang.fr,
      cefr: Cefr.a2,
      minutes: 8,
      titles: {
        UiLang.tr: 'Networking sohbeti',
        UiLang.en: 'Networking small talk',
        UiLang.fr: 'Échanger lors d’un événement professionnel',
      },
      clipLine: 'Qu’est-ce qui vous amène à cette conférence ?',
      phrases: [
        Phrase(
          id: 'fr_pro_network_0',
          target: 'Qu’est-ce qui vous amène à cette conférence ?',
          gloss: {UiLang.tr: 'Peki, seni bu konferansa getiren ne?'},
        ),
        Phrase(
          id: 'fr_pro_network_1',
          target: 'Je suis surtout ici pour trouver de nouveaux partenaires.',
          gloss: {
            UiLang.tr: 'Daha çok yeni iş birlikleri araştırmak için buradayım.',
          },
        ),
        Phrase(
          id: 'fr_pro_network_2',
          target:
              'C’est intéressant. Parlez-moi un peu plus de votre activité.',
          gloss: {
            UiLang.tr:
                'Bu ilginç, ne yaptığınızdan biraz daha bahseder misiniz?',
          },
        ),
        Phrase(
          id: 'fr_pro_network_3',
          target: 'Voici ma carte. Restons en contact.',
          gloss: {UiLang.tr: 'İşte kartım — iletişimde kalalım.'},
        ),
        Phrase(
          id: 'fr_pro_network_4',
          target:
              'Je vous enverrai une invitation sur LinkedIn après la conférence.',
          gloss: {
            UiLang.tr: "Bundan sonra sizinle LinkedIn'de bağlantı kuracağım.",
          },
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Engagez la conversation lors d’un événement professionnel.',
          expected: 'Qu’est-ce qui vous amène à cette conférence ?',
        ),
        SpeakTurn(
          prompt: 'Expliquez pourquoi vous êtes là.',
          expected: 'Je suis surtout ici pour trouver de nouveaux partenaires.',
        ),
        SpeakTurn(
          prompt: 'Terminez l’échange chaleureusement.',
          expected: 'Voici ma carte. Restons en contact.',
        ),
      ],
    ),
    Scenario(
      id: 'fr_pro_client_call',
      lang: LearnLang.fr,
      cefr: Cefr.b2,
      minutes: 10,
      titles: {
        UiLang.tr: 'Müşteri şikayeti telefonu',
        UiLang.en: 'Handling a client complaint call',
        UiLang.fr: 'Gérer une réclamation client au téléphone',
      },
      clipLine:
          'Je comprends à quel point cette situation doit être frustrante pour vous.',
      phrases: [
        Phrase(
          id: 'fr_pro_client_0',
          target:
              'Je comprends à quel point cette situation doit être frustrante pour vous.',
          gloss: {UiLang.tr: 'Bunun ne kadar sinir bozucu olduğunu anlıyorum.'},
        ),
        Phrase(
          id: 'fr_pro_client_1',
          target:
              'Je vais ouvrir votre compte client pour regarder cela de plus près.',
          gloss: {UiLang.tr: 'Hesabınızı açıp daha yakından bakayım.'},
        ),
        Phrase(
          id: 'fr_pro_client_2',
          target: 'Je vois précisément où le problème s’est produit.',
          gloss: {
            UiLang.tr:
                'İşlerin nerede yanlış gittiğini tam olarak görebiliyorum.',
          },
        ),
        Phrase(
          id: 'fr_pro_client_3',
          target:
              'Voici ce que je vais faire pour résoudre ce problème pour vous.',
          gloss: {
            UiLang.tr: 'Bunu sizin için düzeltmek için yapacağım şey bu.',
          },
        ),
        Phrase(
          id: 'fr_pro_client_4',
          target:
              'Je suivrai personnellement votre dossier et vous recontacterai d’ici la fin de la journée.',
          gloss: {UiLang.tr: 'Gün sonuna kadar bizzat takip edeceğim.'},
        ),
        Phrase(
          id: 'fr_pro_client_5',
          target:
              'Merci de votre patience pendant que nous réglions ce problème.',
          gloss: {
            UiLang.tr:
                'Bunu çözerken gösterdiğiniz sabır için teşekkür ederim.',
          },
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt:
              'Le client est mécontent. Commencez par faire preuve d’empathie.',
          expected:
              'Je comprends à quel point cette situation doit être frustrante pour vous.',
        ),
        SpeakTurn(
          prompt: 'Passez à l’examen du problème.',
          expected:
              'Je vais ouvrir votre compte client pour regarder cela de plus près.',
        ),
        SpeakTurn(
          prompt: 'Engagez-vous sur une prochaine étape concrète.',
          expected:
              'Voici ce que je vais faire pour résoudre ce problème pour vous.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'İşlevsel dil notu: Önce müşterinin yaşadığı güçlüğü kabul edin, sonra çözüm sunun. Kötü örnek dilbilgisel değil, iletişimsel açıdan uygunsuzdur.',
        },
        goodExample:
            'Je comprends votre frustration. Je vais examiner le problème.',
        badExample: 'Vous n’avez aucune raison de vous énerver.',
      ),
    ),
    Scenario(
      id: 'fr_pro_raise',
      lang: LearnLang.fr,
      cefr: Cefr.b2,
      minutes: 11,
      titles: {
        UiLang.tr: 'Zam görüşmesi',
        UiLang.en: 'Asking for a raise',
        UiLang.fr: 'Demander une augmentation',
      },
      clipLine: 'J’aimerais discuter de ma rémunération.',
      phrases: [
        Phrase(
          id: 'fr_pro_raise_0',
          target: 'J’aimerais discuter de ma rémunération.',
          gloss: {UiLang.tr: 'Maaşım hakkında konuşmak istiyorum.'},
        ),
        Phrase(
          id: 'fr_pro_raise_1',
          target:
              'Au cours de l’année écoulée, j’ai assumé beaucoup plus de responsabilités.',
          gloss: {
            UiLang.tr:
                'Geçen yıl boyunca önemli ölçüde daha fazla sorumluluk üstlendim.',
          },
        ),
        Phrase(
          id: 'fr_pro_raise_2',
          target:
              'Je me suis renseigné : ma rémunération est actuellement inférieure au niveau du marché pour ce poste.',
          gloss: {
            UiLang.tr:
                'Biraz araştırma yaptım ve pozisyonum şu anda piyasa oranının altında.',
          },
        ),
        Phrase(
          id: 'fr_pro_raise_3',
          target: 'Je souhaiterais une augmentation de dix pour cent.',
          gloss: {UiLang.tr: 'Yüzde on zam talep ediyorum.'},
        ),
        Phrase(
          id: 'fr_pro_raise_4',
          target:
              'Je comprends votre demande. Il me faudra un peu de temps pour l’examiner.',
          gloss: {
            UiLang.tr:
                'Sizi anlıyorum ve bunu değerlendirmek için biraz zamana ihtiyacım olacak.',
          },
        ),
        Phrase(
          id: 'fr_pro_raise_5',
          target: 'Bien sûr. Quand pourrions-nous en reparler ?',
          gloss: {UiLang.tr: 'Tabii ki, bunu ne zaman tekrar konuşabiliriz?'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Abordez le sujet directement, mais avec politesse.',
          expected: 'J’aimerais discuter de ma rémunération.',
        ),
        SpeakTurn(
          prompt: 'Appuyez votre demande sur des faits.',
          expected:
              'Je me suis renseigné : ma rémunération est actuellement inférieure au niveau du marché pour ce poste.',
        ),
        SpeakTurn(
          prompt: 'Indiquez un pourcentage précis.',
          expected: 'Je souhaiterais une augmentation de dix pour cent.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '“assumer” fiilinin passé composé biçimi “avoir + assumé” ile kurulur; “être” kullanılmaz.',
        },
        goodExample: 'J’ai assumé davantage de responsabilités.',
        badExample: 'Je suis assumé davantage de responsabilités.',
      ),
    ),
  ];
}
