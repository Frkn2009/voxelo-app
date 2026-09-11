import '../models/models.dart';

/// Doğal profesyonel dil; Türkçe açıklamalar ve kaynak kimlik son ekleri korunur.
class ProfessionalCatalogDe {
  static List<Scenario> build(LearnLang language) =>
      language == LearnLang.de ? _scenarios : const [];

  static final List<Scenario> _scenarios = [
    Scenario(
      id: 'de_pro_interview',
      lang: LearnLang.de,
      cefr: Cefr.b1,
      minutes: 10,
      titles: {
        UiLang.tr: 'İş görüşmesi: Kendini tanıtmak',
        UiLang.en: 'Job interview: Introducing yourself',
        UiLang.de: 'Vorstellungsgespräch: Sich vorstellen',
      },
      clipLine:
          'Ich würde Ihnen gern einen Überblick über meinen beruflichen Werdegang geben.',
      phrases: [
        Phrase(
          id: 'de_pro_interview_0',
          target:
              'Ich würde Ihnen gern einen Überblick über meinen beruflichen Werdegang geben.',
          gloss: {UiLang.tr: 'Geçmişimi sizinle özetlemek isterim.'},
        ),
        Phrase(
          id: 'de_pro_interview_1',
          target: 'Ich arbeite seit drei Jahren im Projektmanagement.',
          gloss: {UiLang.tr: 'Son üç yıldır proje yönetiminde çalışıyorum.'},
        ),
        Phrase(
          id: 'de_pro_interview_2',
          target:
              'Am meisten Freude macht es mir, auch unter Druck Lösungen zu finden.',
          gloss: {
            UiLang.tr: 'En çok keyif aldığım şey baskı altında sorun çözmek.',
          },
        ),
        Phrase(
          id: 'de_pro_interview_3',
          target:
              'Könnten Sie mir mehr über das Team erzählen, in dem ich arbeiten würde?',
          gloss: {
            UiLang.tr:
                'Katılacağım ekip hakkında biraz daha bilgi verebilir misiniz?',
          },
        ),
        Phrase(
          id: 'de_pro_interview_4',
          target: 'Das ist eine gute Frage. Lassen Sie mich kurz überlegen.',
          gloss: {UiLang.tr: 'Çok iyi bir soru — bir saniye düşüneyim.'},
        ),
        Phrase(
          id: 'de_pro_interview_5',
          target:
              'Vielen Dank für Ihre Zeit. Ich freue mich auf Ihre Rückmeldung.',
          gloss: {
            UiLang.tr:
                'Vaktiniz için teşekkürler, sizden haber almayı dört gözle bekliyorum.',
          },
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Erzählen Sie uns etwas über sich.',
          expected:
              'Ich würde Ihnen gern einen Überblick über meinen beruflichen Werdegang geben.',
        ),
        SpeakTurn(
          prompt: 'Welche Berufserfahrung bringen Sie mit?',
          expected: 'Ich arbeite seit drei Jahren im Projektmanagement.',
        ),
        SpeakTurn(
          prompt: 'Was gefällt Ihnen an Ihrer Arbeit?',
          expected:
              'Am meisten Freude macht es mir, auch unter Druck Lösungen zu finden.',
        ),
        SpeakTurn(
          prompt: 'Haben Sie noch Fragen an uns?',
          expected:
              'Könnten Sie mir mehr über das Team erzählen, in dem ich arbeiten würde?',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Almancada hâlen devam eden bir iş için “seit” ve şimdiki zaman kullanılır. Süre belirten isim “seit”ten sonra Dativ alır.',
        },
        goodExample: 'Ich arbeite seit drei Jahren im Projektmanagement.',
        badExample: 'Ich arbeite seit drei Jahre im Projektmanagement.',
      ),
    ),
    Scenario(
      id: 'de_pro_meeting_request',
      lang: LearnLang.de,
      cefr: Cefr.b1,
      minutes: 9,
      titles: {
        UiLang.tr: 'Toplantı talep etmek',
        UiLang.en: 'Requesting a meeting',
        UiLang.de: 'Um einen Gesprächstermin bitten',
      },
      clipLine:
          'Hätten Sie diese Woche eine Viertelstunde Zeit für eine kurze Abstimmung?',
      phrases: [
        Phrase(
          id: 'de_pro_meeting_0',
          target:
              'Hätten Sie diese Woche eine Viertelstunde Zeit für eine kurze Abstimmung?',
          gloss: {UiLang.tr: 'Bu hafta senkron için on beş dakikanız var mı?'},
        ),
        Phrase(
          id: 'de_pro_meeting_1',
          target:
              'Ich würde vor dem Start gern noch ein paar Punkte mit Ihnen besprechen.',
          gloss: {
            UiLang.tr: 'Lansmandan önce birkaç şeyi sizinle konuşmak isterim.',
          },
        ),
        Phrase(
          id: 'de_pro_meeting_2',
          target: 'Würde Ihnen Donnerstagnachmittag passen?',
          gloss: {UiLang.tr: 'Perşembe öğleden sonra sizin için uygun mu?'},
        ),
        Phrase(
          id: 'de_pro_meeting_3',
          target:
              'Verschieben wir es auf nächste Woche, wenn Ihnen das besser passt.',
          gloss: {
            UiLang.tr: 'Daha kolay olacaksa gelecek haftaya erteleyelim.',
          },
        ),
        Phrase(
          id: 'de_pro_meeting_4',
          target:
              'Ich schicke Ihnen eine Kalendereinladung mit der Tagesordnung.',
          gloss: {
            UiLang.tr: 'Gündemle birlikte bir takvim daveti göndereceğim.',
          },
        ),
        Phrase(
          id: 'de_pro_meeting_5',
          target: 'Ich freue mich auf unser Gespräch.',
          gloss: {UiLang.tr: 'Görüşmeyi dört gözle bekliyorum.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt:
              'Vereinbaren Sie einen kurzen Abstimmungstermin mit einem Kollegen.',
          expected:
              'Hätten Sie diese Woche eine Viertelstunde Zeit für eine kurze Abstimmung?',
        ),
        SpeakTurn(
          prompt: 'Er fragt nach dem Anlass.',
          expected:
              'Ich würde vor dem Start gern noch ein paar Punkte mit Ihnen besprechen.',
        ),
        SpeakTurn(
          prompt: 'Schlagen Sie einen konkreten Termin vor.',
          expected: 'Würde Ihnen Donnerstagnachmittag passen?',
          scaffold: 'Würde … Ihnen passen?',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '“Würde … Ihnen passen?” yapısında çekimli “würde” başta, mastar “passen” sonda yer alır; “Ihnen” Dativ biçimidir.',
        },
        goodExample: 'Würde Donnerstag Ihnen passen?',
        badExample: 'Würde Donnerstag Sie passen?',
      ),
    ),
    Scenario(
      id: 'de_pro_update',
      lang: LearnLang.de,
      cefr: Cefr.b1,
      minutes: 10,
      titles: {
        UiLang.tr: 'Proje güncellemesi sunmak',
        UiLang.en: 'Presenting a project update',
        UiLang.de: 'Über den Projektstand berichten',
      },
      clipLine:
          'Wir liegen im Zeitplan und können den Termin voraussichtlich einhalten.',
      phrases: [
        Phrase(
          id: 'de_pro_update_0',
          target:
              'Wir liegen im Zeitplan und können den Termin voraussichtlich einhalten.',
          gloss: {UiLang.tr: 'Teslim tarihini yakalama konusunda yolundayız.'},
        ),
        Phrase(
          id: 'de_pro_update_1',
          target: 'Auf ein Hindernis möchte ich allerdings hinweisen.',
          gloss: {UiLang.tr: 'Belirtmek istediğim bir engel var.'},
        ),
        Phrase(
          id: 'de_pro_update_2',
          target:
              'Wir brauchen eine zusätzliche Kraft, um das Tempo zu halten.',
          gloss: {
            UiLang.tr: 'Hızı korumak için bir kaynağa daha ihtiyacımız var.',
          },
        ),
        Phrase(
          id: 'de_pro_update_3',
          target:
              'Hier sehen Sie, was wir seit letzter Woche abgeschlossen haben.',
          gloss: {
            UiLang.tr: 'Geçen haftadan bu yana tamamladıklarımız bunlar.',
          },
        ),
        Phrase(
          id: 'de_pro_update_4',
          target: 'Gibt es noch Fragen, bevor ich zur nächsten Folie übergehe?',
          gloss: {
            UiLang.tr: 'Bir sonraki slayda geçmeden önce sorusu olan var mı?',
          },
        ),
        Phrase(
          id: 'de_pro_update_5',
          target: 'Die Einzelheiten reiche ich schriftlich nach.',
          gloss: {UiLang.tr: 'Detayları yazılı olarak takip edeceğim.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Leiten Sie Ihren Bericht zum Projektstand ein.',
          expected:
              'Wir liegen im Zeitplan und können den Termin voraussichtlich einhalten.',
        ),
        SpeakTurn(
          prompt: 'Sprechen Sie ein Problem an.',
          expected: 'Auf ein Hindernis möchte ich allerdings hinweisen.',
        ),
        SpeakTurn(
          prompt: 'Bitten Sie um die benötigte Unterstützung.',
          expected:
              'Wir brauchen eine zusätzliche Kraft, um das Tempo zu halten.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr: '“um … zu” amaç bildirir; mastar grubunda “zu” gerekir.',
        },
        goodExample: 'Wir brauchen Unterstützung, um den Termin einzuhalten.',
        badExample: 'Wir brauchen Unterstützung, um den Termin einhalten.',
      ),
    ),
    Scenario(
      id: 'de_pro_feedback',
      lang: LearnLang.de,
      cefr: Cefr.b2,
      minutes: 11,
      titles: {
        UiLang.tr: 'Yapıcı geri bildirim vermek',
        UiLang.en: 'Giving constructive feedback',
        UiLang.de: 'Konstruktives Feedback geben',
      },
      clipLine: 'Ich würde Ihnen gern eine Rückmeldung geben. Passt es gerade?',
      phrases: [
        Phrase(
          id: 'de_pro_feedback_0',
          target:
              'Ich würde Ihnen gern eine Rückmeldung geben. Passt es gerade?',
          gloss: {
            UiLang.tr: 'Bir geri bildirim paylaşmak istiyorum, şimdi uygun mu?',
          },
        ),
        Phrase(
          id: 'de_pro_feedback_1',
          target:
              'Insgesamt war der Bericht gut, aber ein paar Punkte sind mir aufgefallen.',
          gloss: {
            UiLang.tr:
                'Genel olarak rapor sağlamdı ama birkaç şey dikkatimi çekti.',
          },
        ),
        Phrase(
          id: 'de_pro_feedback_2',
          target:
              'Beim nächsten Mal wäre es hilfreich, die Zahlen gleich an den Anfang zu stellen.',
          gloss: {
            UiLang.tr:
                'Bir dahaki sefere rakamları en başa koymak yardımcı olur.',
          },
        ),
        Phrase(
          id: 'de_pro_feedback_3',
          target:
              'Ich fand es wirklich gut, wie Sie auf die Fragen des Kunden eingegangen sind.',
          gloss: {
            UiLang.tr:
                "Müşterinin sorularını ele alış şeklini gerçekten takdir ettim.",
          },
        ),
        Phrase(
          id: 'de_pro_feedback_4',
          target: 'Wie beurteilen Sie selbst das Ergebnis?',
          gloss: {UiLang.tr: 'Sonuç hakkında kendin ne düşünüyorsun?'},
        ),
        Phrase(
          id: 'de_pro_feedback_5',
          target:
              'Sprechen wir nach dem nächsten Meilenstein noch einmal darüber.',
          gloss: {
            UiLang.tr: 'Bir sonraki kilometre taşından sonra tekrar konuşalım.',
          },
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Fragen Sie, ob es gerade passt, bevor Sie Feedback geben.',
          expected:
              'Ich würde Ihnen gern eine Rückmeldung geben. Passt es gerade?',
        ),
        SpeakTurn(
          prompt: 'Sprechen Sie behutsam einen Verbesserungsvorschlag an.',
          expected:
              'Beim nächsten Mal wäre es hilfreich, die Zahlen gleich an den Anfang zu stellen.',
        ),
        SpeakTurn(
          prompt: 'Würdigen Sie etwas, das gut gelungen ist.',
          expected:
              'Ich fand es wirklich gut, wie Sie auf die Fragen des Kunden eingegangen sind.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '“Es wäre hilfreich, … zu …” nazik bir öneridir. Kötü örnek dilbilgisel olarak doğru olsa da emir gibi duyulur.',
        },
        goodExample: 'Es wäre hilfreich, die Zahlen zu ergänzen.',
        badExample: 'Sie müssen die Zahlen ergänzen.',
      ),
    ),
    Scenario(
      id: 'de_pro_deadline',
      lang: LearnLang.de,
      cefr: Cefr.b1,
      minutes: 9,
      titles: {
        UiLang.tr: 'Teslim tarihi için pazarlık',
        UiLang.en: 'Negotiating a deadline',
        UiLang.de: 'Einen Abgabetermin aushandeln',
      },
      clipLine: 'Ich befürchte, dass wir es bis Freitag nicht schaffen.',
      phrases: [
        Phrase(
          id: 'de_pro_deadline_0',
          target: 'Ich befürchte, dass wir es bis Freitag nicht schaffen.',
          gloss: {UiLang.tr: 'Cumaya yetiştiremeyeceğimizden endişeliyim.'},
        ),
        Phrase(
          id: 'de_pro_deadline_1',
          target: 'Wäre es möglich, die Frist auf Montag zu verschieben?',
          gloss: {
            UiLang.tr: 'Teslim tarihini pazartesiye taşımak mümkün olur mu?',
          },
        ),
        Phrase(
          id: 'de_pro_deadline_2',
          target:
              'Alternativ könnten wir bis Freitag eine Teilversion liefern.',
          gloss: {
            UiLang.tr:
                'Bunun yerine cumaya kadar kısmi bir versiyon teslim edebiliriz.',
          },
        ),
        Phrase(
          id: 'de_pro_deadline_3',
          target: 'Was bräuchten Sie von uns, damit das klappt?',
          gloss: {UiLang.tr: 'Bunun olması için bizden neye ihtiyacınız olur?'},
        ),
        Phrase(
          id: 'de_pro_deadline_4',
          target:
              'Einigen wir uns jetzt auf einen realistischen Termin, damit wir später nicht noch einmal verschieben müssen.',
          gloss: {
            UiLang.tr:
                'Daha sonra tekrar kaymaktansa şimdi gerçekçi bir tarihte anlaşalım.',
          },
        ),
        Phrase(
          id: 'de_pro_deadline_5',
          target: 'Montag passt. Ich bestätige Ihnen das schriftlich.',
          gloss: {UiLang.tr: 'Pazartesi uygun. Yazılı olarak teyit edeceğim.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Weisen Sie frühzeitig auf das Risiko hin.',
          expected: 'Ich befürchte, dass wir es bis Freitag nicht schaffen.',
        ),
        SpeakTurn(
          prompt: 'Schlagen Sie einen anderen Termin vor.',
          expected: 'Wäre es möglich, die Frist auf Montag zu verschieben?',
        ),
        SpeakTurn(
          prompt: 'Bieten Sie einen Kompromiss an.',
          expected:
              'Alternativ könnten wir bis Freitag eine Teilversion liefern.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '“Es wäre möglich” yapısının ardından gelen mastar “zu” ile kurulur.',
        },
        goodExample: 'Wäre es möglich, die Frist zu verlängern?',
        badExample: 'Wäre es möglich, die Frist verlängern?',
      ),
    ),
    Scenario(
      id: 'de_pro_networking',
      lang: LearnLang.de,
      cefr: Cefr.a2,
      minutes: 8,
      titles: {
        UiLang.tr: 'Networking sohbeti',
        UiLang.en: 'Networking small talk',
        UiLang.de: 'Gespräche beim Netzwerken',
      },
      clipLine: 'Was führt Sie zu dieser Konferenz?',
      phrases: [
        Phrase(
          id: 'de_pro_network_0',
          target: 'Was führt Sie zu dieser Konferenz?',
          gloss: {UiLang.tr: 'Peki, seni bu konferansa getiren ne?'},
        ),
        Phrase(
          id: 'de_pro_network_1',
          target:
              'Ich bin hauptsächlich hier, um neue Kooperationspartner zu finden.',
          gloss: {
            UiLang.tr: 'Daha çok yeni iş birlikleri araştırmak için buradayım.',
          },
        ),
        Phrase(
          id: 'de_pro_network_2',
          target:
              'Das klingt interessant. Erzählen Sie mir mehr über Ihre Arbeit.',
          gloss: {
            UiLang.tr:
                'Bu ilginç, ne yaptığınızdan biraz daha bahseder misiniz?',
          },
        ),
        Phrase(
          id: 'de_pro_network_3',
          target: 'Hier ist meine Visitenkarte. Bleiben wir in Kontakt.',
          gloss: {UiLang.tr: 'İşte kartım — iletişimde kalalım.'},
        ),
        Phrase(
          id: 'de_pro_network_4',
          target:
              'Ich schicke Ihnen im Anschluss eine Kontaktanfrage auf LinkedIn.',
          gloss: {
            UiLang.tr: "Bundan sonra sizinle LinkedIn'de bağlantı kuracağım.",
          },
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Beginnen Sie ein Gespräch bei einer Netzwerkveranstaltung.',
          expected: 'Was führt Sie zu dieser Konferenz?',
        ),
        SpeakTurn(
          prompt: 'Erklären Sie, warum Sie hier sind.',
          expected:
              'Ich bin hauptsächlich hier, um neue Kooperationspartner zu finden.',
        ),
        SpeakTurn(
          prompt: 'Beenden Sie das Gespräch freundlich.',
          expected: 'Hier ist meine Visitenkarte. Bleiben wir in Kontakt.',
        ),
      ],
    ),
    Scenario(
      id: 'de_pro_client_call',
      lang: LearnLang.de,
      cefr: Cefr.b2,
      minutes: 10,
      titles: {
        UiLang.tr: 'Müşteri şikayeti telefonu',
        UiLang.en: 'Handling a client complaint call',
        UiLang.de: 'Mit einer Kundenbeschwerde am Telefon umgehen',
      },
      clipLine: 'Ich kann gut verstehen, wie ärgerlich das für Sie ist.',
      phrases: [
        Phrase(
          id: 'de_pro_client_0',
          target: 'Ich kann gut verstehen, wie ärgerlich das für Sie ist.',
          gloss: {UiLang.tr: 'Bunun ne kadar sinir bozucu olduğunu anlıyorum.'},
        ),
        Phrase(
          id: 'de_pro_client_1',
          target:
              'Ich rufe kurz Ihr Kundenkonto auf und schaue mir das genauer an.',
          gloss: {UiLang.tr: 'Hesabınızı açıp daha yakından bakayım.'},
        ),
        Phrase(
          id: 'de_pro_client_2',
          target: 'Ich sehe jetzt genau, wo der Fehler liegt.',
          gloss: {
            UiLang.tr:
                'İşlerin nerede yanlış gittiğini tam olarak görebiliyorum.',
          },
        ),
        Phrase(
          id: 'de_pro_client_3',
          target:
              'Ich erkläre Ihnen, was ich jetzt tun werde, um das Problem für Sie zu lösen.',
          gloss: {
            UiLang.tr: 'Bunu sizin için düzeltmek için yapacağım şey bu.',
          },
        ),
        Phrase(
          id: 'de_pro_client_4',
          target:
              'Ich kümmere mich persönlich darum und melde mich bis heute Abend bei Ihnen.',
          gloss: {UiLang.tr: 'Gün sonuna kadar bizzat takip edeceğim.'},
        ),
        Phrase(
          id: 'de_pro_client_5',
          target: 'Vielen Dank für Ihre Geduld, während wir das geklärt haben.',
          gloss: {
            UiLang.tr:
                'Bunu çözerken gösterdiğiniz sabır için teşekkür ederim.',
          },
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Der Kunde ist verärgert. Zeigen Sie zunächst Verständnis.',
          expected: 'Ich kann gut verstehen, wie ärgerlich das für Sie ist.',
        ),
        SpeakTurn(
          prompt: 'Beginnen Sie mit der Prüfung des Problems.',
          expected:
              'Ich rufe kurz Ihr Kundenkonto auf und schaue mir das genauer an.',
        ),
        SpeakTurn(
          prompt: 'Kündigen Sie einen konkreten nächsten Schritt an.',
          expected:
              'Ich erkläre Ihnen, was ich jetzt tun werde, um das Problem für Sie zu lösen.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'İşlevsel dil notu: Önce müşterinin duygusunu kabul edin, ardından incelemeye geçin. Kötü örnek dilbilgisel hata değil, duyguyu küçümseyen bir ifadedir.',
        },
        goodExample: 'Ich verstehe Ihren Ärger. Ich schaue mir das sofort an.',
        badExample: 'Es gibt keinen Grund, sich zu ärgern.',
      ),
    ),
    Scenario(
      id: 'de_pro_raise',
      lang: LearnLang.de,
      cefr: Cefr.b2,
      minutes: 11,
      titles: {
        UiLang.tr: 'Zam görüşmesi',
        UiLang.en: 'Asking for a raise',
        UiLang.de: 'Um eine Gehaltserhöhung bitten',
      },
      clipLine: 'Ich würde gern über mein Gehalt sprechen.',
      phrases: [
        Phrase(
          id: 'de_pro_raise_0',
          target: 'Ich würde gern über mein Gehalt sprechen.',
          gloss: {UiLang.tr: 'Maaşım hakkında konuşmak istiyorum.'},
        ),
        Phrase(
          id: 'de_pro_raise_1',
          target:
              'Im vergangenen Jahr habe ich deutlich mehr Verantwortung übernommen.',
          gloss: {
            UiLang.tr:
                'Geçen yıl boyunca önemli ölçüde daha fazla sorumluluk üstlendim.',
          },
        ),
        Phrase(
          id: 'de_pro_raise_2',
          target:
              'Ich habe mich informiert: Mein Gehalt liegt derzeit unter dem marktüblichen Niveau für diese Position.',
          gloss: {
            UiLang.tr:
                'Biraz araştırma yaptım ve pozisyonum şu anda piyasa oranının altında.',
          },
        ),
        Phrase(
          id: 'de_pro_raise_3',
          target:
              'Ich möchte eine Gehaltserhöhung von zehn Prozent ansprechen.',
          gloss: {UiLang.tr: 'Yüzde on zam talep ediyorum.'},
        ),
        Phrase(
          id: 'de_pro_raise_4',
          target:
              'Ich verstehe Ihr Anliegen. Ich brauche etwas Zeit, um das zu prüfen.',
          gloss: {
            UiLang.tr:
                'Sizi anlıyorum ve bunu değerlendirmek için biraz zamana ihtiyacım olacak.',
          },
        ),
        Phrase(
          id: 'de_pro_raise_5',
          target: 'Natürlich. Wann könnten wir noch einmal darüber sprechen?',
          gloss: {UiLang.tr: 'Tabii ki, bunu ne zaman tekrar konuşabiliriz?'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Sprechen Sie das Thema direkt, aber höflich an.',
          expected: 'Ich würde gern über mein Gehalt sprechen.',
        ),
        SpeakTurn(
          prompt: 'Begründen Sie Ihr Anliegen mit Fakten.',
          expected:
              'Ich habe mich informiert: Mein Gehalt liegt derzeit unter dem marktüblichen Niveau für diese Position.',
        ),
        SpeakTurn(
          prompt: 'Nennen Sie einen konkreten Prozentsatz.',
          expected:
              'Ich möchte eine Gehaltserhöhung von zehn Prozent ansprechen.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '“Verantwortung übernehmen” kalıbında Perfekt “haben + übernommen” ile kurulur; “sein” kullanılmaz.',
        },
        goodExample: 'Ich habe mehr Verantwortung übernommen.',
        badExample: 'Ich bin mehr Verantwortung übernommen.',
      ),
    ),
  ];
}
