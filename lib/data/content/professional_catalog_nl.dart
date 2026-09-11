import '../models/models.dart';

/// Doğal profesyonel dil; Türkçe açıklamalar ve kaynak kimlik son ekleri korunur.
class ProfessionalCatalogNl {
  static List<Scenario> build(LearnLang language) =>
      language == LearnLang.nl ? _scenarios : const [];

  static final List<Scenario> _scenarios = [
    Scenario(
      id: 'nl_pro_interview',
      lang: LearnLang.nl,
      cefr: Cefr.b1,
      minutes: 10,
      titles: {
        UiLang.tr: 'İş görüşmesi: Kendini tanıtmak',
        UiLang.en: 'Job interview: Introducing yourself',
        UiLang.nl: 'Sollicitatiegesprek: uzelf voorstellen',
      },
      clipLine:
          'Ik zou u graag kort iets vertellen over mijn professionele achtergrond.',
      phrases: [
        Phrase(
          id: 'nl_pro_interview_0',
          target:
              'Ik zou u graag kort iets vertellen over mijn professionele achtergrond.',
          gloss: {UiLang.tr: 'Geçmişimi sizinle özetlemek isterim.'},
        ),
        Phrase(
          id: 'nl_pro_interview_1',
          target: 'Ik werk nu drie jaar in projectmanagement.',
          gloss: {UiLang.tr: 'Son üç yıldır proje yönetiminde çalışıyorum.'},
        ),
        Phrase(
          id: 'nl_pro_interview_2',
          target:
              'Ik haal de meeste voldoening uit het oplossen van problemen onder druk.',
          gloss: {
            UiLang.tr: 'En çok keyif aldığım şey baskı altında sorun çözmek.',
          },
        ),
        Phrase(
          id: 'nl_pro_interview_3',
          target:
              'Kunt u me wat meer vertellen over het team waarin ik zou komen te werken?',
          gloss: {
            UiLang.tr:
                'Katılacağım ekip hakkında biraz daha bilgi verebilir misiniz?',
          },
        ),
        Phrase(
          id: 'nl_pro_interview_4',
          target: 'Dat is een goede vraag. Laat me daar even over nadenken.',
          gloss: {UiLang.tr: 'Çok iyi bir soru — bir saniye düşüneyim.'},
        ),
        Phrase(
          id: 'nl_pro_interview_5',
          target: 'Bedankt voor uw tijd. Ik kijk uit naar uw reactie.',
          gloss: {
            UiLang.tr:
                'Vaktiniz için teşekkürler, sizden haber almayı dört gözle bekliyorum.',
          },
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Vertel eens iets over uzelf.',
          expected:
              'Ik zou u graag kort iets vertellen over mijn professionele achtergrond.',
        ),
        SpeakTurn(
          prompt: 'Welke werkervaring heeft u?',
          expected: 'Ik werk nu drie jaar in projectmanagement.',
        ),
        SpeakTurn(
          prompt: 'Wat vindt u leuk aan uw werk?',
          expected:
              'Ik haal de meeste voldoening uit het oplossen van problemen onder druk.',
        ),
        SpeakTurn(
          prompt: 'Heeft u nog vragen voor ons?',
          expected:
              'Kunt u me wat meer vertellen over het team waarin ik zou komen te werken?',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Flemenkçede hâlen devam eden bir iş için şimdiki zaman kullanılır. “Ik” ile fiil kökü kullanılır; üçüncü tekil şahıstaki “-t” eklenmez.',
        },
        goodExample: 'Ik werk nu drie jaar in projectmanagement.',
        badExample: 'Ik werkt nu drie jaar in projectmanagement.',
      ),
    ),
    Scenario(
      id: 'nl_pro_meeting_request',
      lang: LearnLang.nl,
      cefr: Cefr.b1,
      minutes: 9,
      titles: {
        UiLang.tr: 'Toplantı talep etmek',
        UiLang.en: 'Requesting a meeting',
        UiLang.nl: 'Een overleg aanvragen',
      },
      clipLine: 'Heeft u deze week een kwartiertje om even af te stemmen?',
      phrases: [
        Phrase(
          id: 'nl_pro_meeting_0',
          target: 'Heeft u deze week een kwartiertje om even af te stemmen?',
          gloss: {UiLang.tr: 'Bu hafta senkron için on beş dakikanız var mı?'},
        ),
        Phrase(
          id: 'nl_pro_meeting_1',
          target:
              'Ik zou vóór de lancering graag een paar punten met u bespreken.',
          gloss: {
            UiLang.tr: 'Lansmandan önce birkaç şeyi sizinle konuşmak isterim.',
          },
        ),
        Phrase(
          id: 'nl_pro_meeting_2',
          target: 'Zou donderdagmiddag u passen?',
          gloss: {UiLang.tr: 'Perşembe öğleden sonra sizin için uygun mu?'},
        ),
        Phrase(
          id: 'nl_pro_meeting_3',
          target:
              'Laten we het naar volgende week verschuiven als dat beter uitkomt.',
          gloss: {
            UiLang.tr: 'Daha kolay olacaksa gelecek haftaya erteleyelim.',
          },
        ),
        Phrase(
          id: 'nl_pro_meeting_4',
          target: 'Ik stuur u een agenda-uitnodiging met de agendapunten.',
          gloss: {
            UiLang.tr: 'Gündemle birlikte bir takvim daveti göndereceğim.',
          },
        ),
        Phrase(
          id: 'nl_pro_meeting_5',
          target: 'Ik kijk uit naar ons gesprek.',
          gloss: {UiLang.tr: 'Görüşmeyi dört gözle bekliyorum.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Plan een kort overleg met een collega.',
          expected: 'Heeft u deze week een kwartiertje om even af te stemmen?',
        ),
        SpeakTurn(
          prompt: 'De collega vraagt waarom.',
          expected:
              'Ik zou vóór de lancering graag een paar punten met u bespreken.',
        ),
        SpeakTurn(
          prompt: 'Stel een concreet tijdstip voor.',
          expected: 'Zou donderdagmiddag u passen?',
          scaffold: 'Zou … u passen?',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '“Zou … u passen?” nazik bir öneridir. Mastar “passen” cümlenin sonunda kalır.',
        },
        goodExample: 'Zou donderdagmiddag u passen?',
        badExample: 'Zou donderdagmiddag u past?',
      ),
    ),
    Scenario(
      id: 'nl_pro_update',
      lang: LearnLang.nl,
      cefr: Cefr.b1,
      minutes: 10,
      titles: {
        UiLang.tr: 'Proje güncellemesi sunmak',
        UiLang.en: 'Presenting a project update',
        UiLang.nl: 'Een projectupdate geven',
      },
      clipLine: 'We liggen op schema om de deadline te halen.',
      phrases: [
        Phrase(
          id: 'nl_pro_update_0',
          target: 'We liggen op schema om de deadline te halen.',
          gloss: {UiLang.tr: 'Teslim tarihini yakalama konusunda yolundayız.'},
        ),
        Phrase(
          id: 'nl_pro_update_1',
          target: 'Er is één knelpunt dat ik graag wil aankaarten.',
          gloss: {UiLang.tr: 'Belirtmek istediğim bir engel var.'},
        ),
        Phrase(
          id: 'nl_pro_update_2',
          target:
              'We hebben één extra medewerker nodig om het tempo erin te houden.',
          gloss: {
            UiLang.tr: 'Hızı korumak için bir kaynağa daha ihtiyacımız var.',
          },
        ),
        Phrase(
          id: 'nl_pro_update_3',
          target: 'Dit is wat we sinds vorige week hebben afgerond.',
          gloss: {
            UiLang.tr: 'Geçen haftadan bu yana tamamladıklarımız bunlar.',
          },
        ),
        Phrase(
          id: 'nl_pro_update_4',
          target: 'Zijn er nog vragen voordat ik naar de volgende dia ga?',
          gloss: {
            UiLang.tr: 'Bir sonraki slayda geçmeden önce sorusu olan var mı?',
          },
        ),
        Phrase(
          id: 'nl_pro_update_5',
          target: 'Ik stuur de details nog schriftelijk na.',
          gloss: {UiLang.tr: 'Detayları yazılı olarak takip edeceğim.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Begin uw toelichting over de voortgang van het project.',
          expected: 'We liggen op schema om de deadline te halen.',
        ),
        SpeakTurn(
          prompt: 'Kaart een probleem aan.',
          expected: 'Er is één knelpunt dat ik graag wil aankaarten.',
        ),
        SpeakTurn(
          prompt: 'Vraag om de ondersteuning die u nodig heeft.',
          expected:
              'We hebben één extra medewerker nodig om het tempo erin te houden.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr: '“om … te” amaç bildirir; mastardan önce “te” gerekir.',
        },
        goodExample: 'We hebben hulp nodig om de deadline te halen.',
        badExample: 'We hebben hulp nodig om de deadline halen.',
      ),
    ),
    Scenario(
      id: 'nl_pro_feedback',
      lang: LearnLang.nl,
      cefr: Cefr.b2,
      minutes: 11,
      titles: {
        UiLang.tr: 'Yapıcı geri bildirim vermek',
        UiLang.en: 'Giving constructive feedback',
        UiLang.nl: 'Constructieve feedback geven',
      },
      clipLine: 'Ik wil u graag wat feedback geven. Komt het nu uit?',
      phrases: [
        Phrase(
          id: 'nl_pro_feedback_0',
          target: 'Ik wil u graag wat feedback geven. Komt het nu uit?',
          gloss: {
            UiLang.tr: 'Bir geri bildirim paylaşmak istiyorum, şimdi uygun mu?',
          },
        ),
        Phrase(
          id: 'nl_pro_feedback_1',
          target:
              'Het rapport was over het algemeen goed, maar een paar punten vielen me op.',
          gloss: {
            UiLang.tr:
                'Genel olarak rapor sağlamdı ama birkaç şey dikkatimi çekti.',
          },
        ),
        Phrase(
          id: 'nl_pro_feedback_2',
          target:
              'De volgende keer zou het helpen om de cijfers meteen aan het begin te zetten.',
          gloss: {
            UiLang.tr:
                'Bir dahaki sefere rakamları en başa koymak yardımcı olur.',
          },
        ),
        Phrase(
          id: 'nl_pro_feedback_3',
          target:
              'Ik vond het erg goed hoe u op de vragen van de klant inging.',
          gloss: {
            UiLang.tr:
                "Müşterinin sorularını ele alış şeklini gerçekten takdir ettim.",
          },
        ),
        Phrase(
          id: 'nl_pro_feedback_4',
          target: 'Hoe kijkt u zelf naar het resultaat?',
          gloss: {UiLang.tr: 'Sonuç hakkında kendin ne düşünüyorsun?'},
        ),
        Phrase(
          id: 'nl_pro_feedback_5',
          target: 'Laten we na de volgende mijlpaal opnieuw overleggen.',
          gloss: {
            UiLang.tr: 'Bir sonraki kilometre taşından sonra tekrar konuşalım.',
          },
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Vraag of het uitkomt voordat u feedback geeft.',
          expected: 'Ik wil u graag wat feedback geven. Komt het nu uit?',
        ),
        SpeakTurn(
          prompt: 'Noem op een vriendelijke manier een verbeterpunt.',
          expected:
              'De volgende keer zou het helpen om de cijfers meteen aan het begin te zetten.',
        ),
        SpeakTurn(
          prompt: 'Benoem iets wat de ander goed heeft gedaan.',
          expected:
              'Ik vond het erg goed hoe u op de vragen van de klant inging.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '“Het zou helpen om … te …” yumuşak bir öneridir. Kötü örnek dilbilgisel olarak doğru ama emir gibi duyulur.',
        },
        goodExample: 'Het zou helpen om de cijfers toe te voegen.',
        badExample: 'U moet de cijfers toevoegen.',
      ),
    ),
    Scenario(
      id: 'nl_pro_deadline',
      lang: LearnLang.nl,
      cefr: Cefr.b1,
      minutes: 9,
      titles: {
        UiLang.tr: 'Teslim tarihi için pazarlık',
        UiLang.en: 'Negotiating a deadline',
        UiLang.nl: 'Over een deadline onderhandelen',
      },
      clipLine: 'Ik ben bang dat we vrijdag niet gaan halen.',
      phrases: [
        Phrase(
          id: 'nl_pro_deadline_0',
          target: 'Ik ben bang dat we vrijdag niet gaan halen.',
          gloss: {UiLang.tr: 'Cumaya yetiştiremeyeceğimizden endişeliyim.'},
        ),
        Phrase(
          id: 'nl_pro_deadline_1',
          target:
              'Zou het mogelijk zijn om de deadline naar maandag te verschuiven?',
          gloss: {
            UiLang.tr: 'Teslim tarihini pazartesiye taşımak mümkün olur mu?',
          },
        ),
        Phrase(
          id: 'nl_pro_deadline_2',
          target:
              'We zouden vrijdag wel een gedeeltelijke versie kunnen opleveren.',
          gloss: {
            UiLang.tr:
                'Bunun yerine cumaya kadar kısmi bir versiyon teslim edebiliriz.',
          },
        ),
        Phrase(
          id: 'nl_pro_deadline_3',
          target: 'Wat zou u van ons nodig hebben om dat mogelijk te maken?',
          gloss: {UiLang.tr: 'Bunun olması için bizden neye ihtiyacınız olur?'},
        ),
        Phrase(
          id: 'nl_pro_deadline_4',
          target:
              'Laten we nu een realistische datum afspreken, zodat we later niet opnieuw hoeven uit te stellen.',
          gloss: {
            UiLang.tr:
                'Daha sonra tekrar kaymaktansa şimdi gerçekçi bir tarihte anlaşalım.',
          },
        ),
        Phrase(
          id: 'nl_pro_deadline_5',
          target: 'Maandag past. Ik bevestig het schriftelijk.',
          gloss: {UiLang.tr: 'Pazartesi uygun. Yazılı olarak teyit edeceğim.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Benoem het risico tijdig.',
          expected: 'Ik ben bang dat we vrijdag niet gaan halen.',
        ),
        SpeakTurn(
          prompt: 'Stel een andere datum voor.',
          expected:
              'Zou het mogelijk zijn om de deadline naar maandag te verschuiven?',
        ),
        SpeakTurn(
          prompt: 'Bied een compromis aan.',
          expected:
              'We zouden vrijdag wel een gedeeltelijke versie kunnen opleveren.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '“mogelijk zijn om … te …” yapısında mastardan önce “te” bulunur.',
        },
        goodExample: 'Zou het mogelijk zijn om de deadline te verschuiven?',
        badExample: 'Zou het mogelijk zijn om de deadline verschuiven?',
      ),
    ),
    Scenario(
      id: 'nl_pro_networking',
      lang: LearnLang.nl,
      cefr: Cefr.a2,
      minutes: 8,
      titles: {
        UiLang.tr: 'Networking sohbeti',
        UiLang.en: 'Networking small talk',
        UiLang.nl: 'Een netwerkgesprek voeren',
      },
      clipLine: 'Wat brengt u naar deze conferentie?',
      phrases: [
        Phrase(
          id: 'nl_pro_network_0',
          target: 'Wat brengt u naar deze conferentie?',
          gloss: {UiLang.tr: 'Peki, seni bu konferansa getiren ne?'},
        ),
        Phrase(
          id: 'nl_pro_network_1',
          target:
              'Ik ben hier vooral om nieuwe samenwerkingspartners te vinden.',
          gloss: {
            UiLang.tr: 'Daha çok yeni iş birlikleri araştırmak için buradayım.',
          },
        ),
        Phrase(
          id: 'nl_pro_network_2',
          target: 'Dat klinkt interessant. Vertel eens wat meer over uw werk.',
          gloss: {
            UiLang.tr:
                'Bu ilginç, ne yaptığınızdan biraz daha bahseder misiniz?',
          },
        ),
        Phrase(
          id: 'nl_pro_network_3',
          target: 'Hier is mijn kaartje. Laten we contact houden.',
          gloss: {UiLang.tr: 'İşte kartım — iletişimde kalalım.'},
        ),
        Phrase(
          id: 'nl_pro_network_4',
          target: 'Ik stuur u hierna een connectieverzoek op LinkedIn.',
          gloss: {
            UiLang.tr: "Bundan sonra sizinle LinkedIn'de bağlantı kuracağım.",
          },
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Begin een gesprek op een netwerkevenement.',
          expected: 'Wat brengt u naar deze conferentie?',
        ),
        SpeakTurn(
          prompt: 'Leg uit waarom u er bent.',
          expected:
              'Ik ben hier vooral om nieuwe samenwerkingspartners te vinden.',
        ),
        SpeakTurn(
          prompt: 'Sluit het gesprek vriendelijk af.',
          expected: 'Hier is mijn kaartje. Laten we contact houden.',
        ),
      ],
    ),
    Scenario(
      id: 'nl_pro_client_call',
      lang: LearnLang.nl,
      cefr: Cefr.b2,
      minutes: 10,
      titles: {
        UiLang.tr: 'Müşteri şikayeti telefonu',
        UiLang.en: 'Handling a client complaint call',
        UiLang.nl: 'Een klacht van een klant telefonisch afhandelen',
      },
      clipLine: 'Ik begrijp hoe vervelend dit voor u moet zijn.',
      phrases: [
        Phrase(
          id: 'nl_pro_client_0',
          target: 'Ik begrijp hoe vervelend dit voor u moet zijn.',
          gloss: {UiLang.tr: 'Bunun ne kadar sinir bozucu olduğunu anlıyorum.'},
        ),
        Phrase(
          id: 'nl_pro_client_1',
          target: 'Ik pak uw klantgegevens erbij en bekijk het even wat beter.',
          gloss: {UiLang.tr: 'Hesabınızı açıp daha yakından bakayım.'},
        ),
        Phrase(
          id: 'nl_pro_client_2',
          target: 'Ik zie precies waar het mis is gegaan.',
          gloss: {
            UiLang.tr:
                'İşlerin nerede yanlış gittiğini tam olarak görebiliyorum.',
          },
        ),
        Phrase(
          id: 'nl_pro_client_3',
          target: 'Dit ga ik doen om het probleem voor u op te lossen.',
          gloss: {
            UiLang.tr: 'Bunu sizin için düzeltmek için yapacağım şey bu.',
          },
        ),
        Phrase(
          id: 'nl_pro_client_4',
          target:
              'Ik volg dit persoonlijk op en neem vóór het einde van de dag contact met u op.',
          gloss: {UiLang.tr: 'Gün sonuna kadar bizzat takip edeceğim.'},
        ),
        Phrase(
          id: 'nl_pro_client_5',
          target: 'Bedankt voor uw geduld terwijl we dit oplosten.',
          gloss: {
            UiLang.tr:
                'Bunu çözerken gösterdiğiniz sabır için teşekkür ederim.',
          },
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'De klant is boos. Toon eerst begrip.',
          expected: 'Ik begrijp hoe vervelend dit voor u moet zijn.',
        ),
        SpeakTurn(
          prompt: 'Ga het probleem onderzoeken.',
          expected:
              'Ik pak uw klantgegevens erbij en bekijk het even wat beter.',
        ),
        SpeakTurn(
          prompt: 'Zeg toe welke concrete stap u gaat zetten.',
          expected: 'Dit ga ik doen om het probleem voor u op te lossen.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'İşlevsel dil notu: Önce müşterinin duygusunu kabul edin, ardından inceleme önerin. Kötü örnek dilbilgisel değil, iletişimsel açıdan uygunsuzdur.',
        },
        goodExample: 'Ik begrijp uw frustratie. Ik zoek het meteen uit.',
        badExample: 'U hoeft zich daar niet druk over te maken.',
      ),
    ),
    Scenario(
      id: 'nl_pro_raise',
      lang: LearnLang.nl,
      cefr: Cefr.b2,
      minutes: 11,
      titles: {
        UiLang.tr: 'Zam görüşmesi',
        UiLang.en: 'Asking for a raise',
        UiLang.nl: 'Om een salarisverhoging vragen',
      },
      clipLine: 'Ik zou graag over mijn salaris willen praten.',
      phrases: [
        Phrase(
          id: 'nl_pro_raise_0',
          target: 'Ik zou graag over mijn salaris willen praten.',
          gloss: {UiLang.tr: 'Maaşım hakkında konuşmak istiyorum.'},
        ),
        Phrase(
          id: 'nl_pro_raise_1',
          target:
              'Het afgelopen jaar heb ik aanzienlijk meer verantwoordelijkheid op me genomen.',
          gloss: {
            UiLang.tr:
                'Geçen yıl boyunca önemli ölçüde daha fazla sorumluluk üstlendim.',
          },
        ),
        Phrase(
          id: 'nl_pro_raise_2',
          target:
              'Ik heb wat onderzoek gedaan en mijn salaris ligt momenteel onder het marktconforme niveau voor deze functie.',
          gloss: {
            UiLang.tr:
                'Biraz araştırma yaptım ve pozisyonum şu anda piyasa oranının altında.',
          },
        ),
        Phrase(
          id: 'nl_pro_raise_3',
          target: 'Ik wil graag een salarisverhoging van tien procent vragen.',
          gloss: {UiLang.tr: 'Yüzde on zam talep ediyorum.'},
        ),
        Phrase(
          id: 'nl_pro_raise_4',
          target:
              'Ik begrijp uw verzoek. Ik heb wat tijd nodig om dit te bekijken.',
          gloss: {
            UiLang.tr:
                'Sizi anlıyorum ve bunu değerlendirmek için biraz zamana ihtiyacım olacak.',
          },
        ),
        Phrase(
          id: 'nl_pro_raise_5',
          target: 'Natuurlijk. Wanneer kunnen we hierop terugkomen?',
          gloss: {UiLang.tr: 'Tabii ki, bunu ne zaman tekrar konuşabiliriz?'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Snijd het onderwerp direct maar beleefd aan.',
          expected: 'Ik zou graag over mijn salaris willen praten.',
        ),
        SpeakTurn(
          prompt: 'Onderbouw uw verzoek met feiten.',
          expected:
              'Ik heb wat onderzoek gedaan en mijn salaris ligt momenteel onder het marktconforme niveau voor deze functie.',
        ),
        SpeakTurn(
          prompt: 'Noem een concreet percentage.',
          expected:
              'Ik wil graag een salarisverhoging van tien procent vragen.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '“op zich nemen” kalıbında tamamlanmış zaman “hebben + op zich genomen” ile kurulur.',
        },
        goodExample: 'Ik heb meer verantwoordelijkheid op me genomen.',
        badExample: 'Ik ben meer verantwoordelijkheid op me genomen.',
      ),
    ),
  ];
}
