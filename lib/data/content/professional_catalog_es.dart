import '../models/models.dart';

/// Doğal profesyonel dil; Türkçe açıklamalar ve kaynak kimlik son ekleri korunur.
class ProfessionalCatalogEs {
  static List<Scenario> build(LearnLang language) =>
      language == LearnLang.es ? _scenarios : const [];

  static final List<Scenario> _scenarios = [
    Scenario(
      id: 'es_pro_interview',
      lang: LearnLang.es,
      cefr: Cefr.b1,
      minutes: 10,
      titles: {
        UiLang.tr: 'İş görüşmesi: Kendini tanıtmak',
        UiLang.en: 'Job interview: Introducing yourself',
        UiLang.es: 'Entrevista de trabajo: presentarse',
      },
      clipLine: 'Me gustaría resumirle mi trayectoria profesional.',
      phrases: [
        Phrase(
          id: 'es_pro_interview_0',
          target: 'Me gustaría resumirle mi trayectoria profesional.',
          gloss: {UiLang.tr: 'Geçmişimi sizinle özetlemek isterim.'},
        ),
        Phrase(
          id: 'es_pro_interview_1',
          target: 'Llevo tres años trabajando en gestión de proyectos.',
          gloss: {UiLang.tr: 'Son üç yıldır proje yönetiminde çalışıyorum.'},
        ),
        Phrase(
          id: 'es_pro_interview_2',
          target: 'Lo que más disfruto es resolver problemas bajo presión.',
          gloss: {
            UiLang.tr: 'En çok keyif aldığım şey baskı altında sorun çözmek.',
          },
        ),
        Phrase(
          id: 'es_pro_interview_3',
          target:
              '¿Podría contarme un poco más sobre el equipo al que me incorporaría?',
          gloss: {
            UiLang.tr:
                'Katılacağım ekip hakkında biraz daha bilgi verebilir misiniz?',
          },
        ),
        Phrase(
          id: 'es_pro_interview_4',
          target: 'Es una muy buena pregunta. Déjeme pensarlo un momento.',
          gloss: {UiLang.tr: 'Çok iyi bir soru — bir saniye düşüneyim.'},
        ),
        Phrase(
          id: 'es_pro_interview_5',
          target: 'Gracias por su tiempo. Quedo a la espera de sus noticias.',
          gloss: {
            UiLang.tr:
                'Vaktiniz için teşekkürler, sizden haber almayı dört gözle bekliyorum.',
          },
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Hábleme de usted.',
          expected: 'Me gustaría resumirle mi trayectoria profesional.',
        ),
        SpeakTurn(
          prompt: '¿Qué experiencia profesional tiene?',
          expected: 'Llevo tres años trabajando en gestión de proyectos.',
        ),
        SpeakTurn(
          prompt: '¿Qué es lo que más le gusta de su trabajo?',
          expected: 'Lo que más disfruto es resolver problemas bajo presión.',
        ),
        SpeakTurn(
          prompt: '¿Tiene alguna pregunta para nosotros?',
          expected:
              '¿Podría contarme un poco más sobre el equipo al que me incorporaría?',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '“Llevar + süre + gerundio” geçmişte başlayıp devam eden bir işi anlatır; fiil mastar değil gerundio biçiminde olmalıdır.',
        },
        goodExample: 'Llevo tres años trabajando en gestión de proyectos.',
        badExample: 'Llevo tres años trabajar en gestión de proyectos.',
      ),
    ),
    Scenario(
      id: 'es_pro_meeting_request',
      lang: LearnLang.es,
      cefr: Cefr.b1,
      minutes: 9,
      titles: {
        UiLang.tr: 'Toplantı talep etmek',
        UiLang.en: 'Requesting a meeting',
        UiLang.es: 'Solicitar una reunión',
      },
      clipLine:
          '¿Tendría quince minutos esta semana para que nos pongamos al día?',
      phrases: [
        Phrase(
          id: 'es_pro_meeting_0',
          target:
              '¿Tendría quince minutos esta semana para que nos pongamos al día?',
          gloss: {UiLang.tr: 'Bu hafta senkron için on beş dakikanız var mı?'},
        ),
        Phrase(
          id: 'es_pro_meeting_1',
          target:
              'Me gustaría comentar algunos puntos con usted antes del lanzamiento.',
          gloss: {
            UiLang.tr: 'Lansmandan önce birkaç şeyi sizinle konuşmak isterim.',
          },
        ),
        Phrase(
          id: 'es_pro_meeting_2',
          target: '¿Le vendría bien el jueves por la tarde?',
          gloss: {UiLang.tr: 'Perşembe öğleden sonra sizin için uygun mu?'},
        ),
        Phrase(
          id: 'es_pro_meeting_3',
          target:
              'Podemos dejarlo para la semana que viene si le resulta más cómodo.',
          gloss: {
            UiLang.tr: 'Daha kolay olacaksa gelecek haftaya erteleyelim.',
          },
        ),
        Phrase(
          id: 'es_pro_meeting_4',
          target:
              'Le enviaré una invitación de calendario con el orden del día.',
          gloss: {
            UiLang.tr: 'Gündemle birlikte bir takvim daveti göndereceğim.',
          },
        ),
        Phrase(
          id: 'es_pro_meeting_5',
          target: 'Tengo muchas ganas de que conversemos.',
          gloss: {UiLang.tr: 'Görüşmeyi dört gözle bekliyorum.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt:
              'Proponga una reunión breve para ponerse al día con un compañero.',
          expected:
              '¿Tendría quince minutos esta semana para que nos pongamos al día?',
        ),
        SpeakTurn(
          prompt: 'Le pregunta por el motivo.',
          expected:
              'Me gustaría comentar algunos puntos con usted antes del lanzamiento.',
        ),
        SpeakTurn(
          prompt: 'Proponga un día y una hora concretos.',
          expected: '¿Le vendría bien el jueves por la tarde?',
          scaffold: '¿Le vendría bien …?',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '“venir bien” yapısında zaman önerisi öznedir; hitap edilen kişi “le” ile belirtilir. Condicional isteği yumuşatır.',
        },
        goodExample: '¿Le vendría bien el jueves?',
        badExample: '¿Usted vendría bien el jueves?',
      ),
    ),
    Scenario(
      id: 'es_pro_update',
      lang: LearnLang.es,
      cefr: Cefr.b1,
      minutes: 10,
      titles: {
        UiLang.tr: 'Proje güncellemesi sunmak',
        UiLang.en: 'Presenting a project update',
        UiLang.es: 'Presentar el avance de un proyecto',
      },
      clipLine: 'Vamos según lo previsto para cumplir el plazo.',
      phrases: [
        Phrase(
          id: 'es_pro_update_0',
          target: 'Vamos según lo previsto para cumplir el plazo.',
          gloss: {UiLang.tr: 'Teslim tarihini yakalama konusunda yolundayız.'},
        ),
        Phrase(
          id: 'es_pro_update_1',
          target: 'Hay un obstáculo que me gustaría señalar.',
          gloss: {UiLang.tr: 'Belirtmek istediğim bir engel var.'},
        ),
        Phrase(
          id: 'es_pro_update_2',
          target: 'Necesitamos a una persona más para mantener el ritmo.',
          gloss: {
            UiLang.tr: 'Hızı korumak için bir kaynağa daha ihtiyacımız var.',
          },
        ),
        Phrase(
          id: 'es_pro_update_3',
          target: 'Esto es lo que hemos completado desde la semana pasada.',
          gloss: {
            UiLang.tr: 'Geçen haftadan bu yana tamamladıklarımız bunlar.',
          },
        ),
        Phrase(
          id: 'es_pro_update_4',
          target: '¿Alguna pregunta antes de pasar a la siguiente diapositiva?',
          gloss: {
            UiLang.tr: 'Bir sonraki slayda geçmeden önce sorusu olan var mı?',
          },
        ),
        Phrase(
          id: 'es_pro_update_5',
          target: 'Le enviaré los detalles por escrito.',
          gloss: {UiLang.tr: 'Detayları yazılı olarak takip edeceğim.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Comience la actualización del estado del proyecto.',
          expected: 'Vamos según lo previsto para cumplir el plazo.',
        ),
        SpeakTurn(
          prompt: 'Plantee una dificultad.',
          expected: 'Hay un obstáculo que me gustaría señalar.',
        ),
        SpeakTurn(
          prompt: 'Pida los recursos que necesita.',
          expected: 'Necesitamos a una persona más para mantener el ritmo.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '“para”dan sonra amaç bildiren fiil mastar olarak kullanılır.',
        },
        goodExample: 'Vamos según lo previsto para cumplir el plazo.',
        badExample: 'Vamos según lo previsto para cumplimos el plazo.',
      ),
    ),
    Scenario(
      id: 'es_pro_feedback',
      lang: LearnLang.es,
      cefr: Cefr.b2,
      minutes: 11,
      titles: {
        UiLang.tr: 'Yapıcı geri bildirim vermek',
        UiLang.en: 'Giving constructive feedback',
        UiLang.es: 'Dar observaciones constructivas',
      },
      clipLine:
          'Me gustaría comentarle algunas observaciones. ¿Es buen momento?',
      phrases: [
        Phrase(
          id: 'es_pro_feedback_0',
          target:
              'Me gustaría comentarle algunas observaciones. ¿Es buen momento?',
          gloss: {
            UiLang.tr: 'Bir geri bildirim paylaşmak istiyorum, şimdi uygun mu?',
          },
        ),
        Phrase(
          id: 'es_pro_feedback_1',
          target:
              'En general, el informe estaba bien, pero hubo un par de puntos que me llamaron la atención.',
          gloss: {
            UiLang.tr:
                'Genel olarak rapor sağlamdı ama birkaç şey dikkatimi çekti.',
          },
        ),
        Phrase(
          id: 'es_pro_feedback_2',
          target: 'La próxima vez, sería útil incluir las cifras al principio.',
          gloss: {
            UiLang.tr:
                'Bir dahaki sefere rakamları en başa koymak yardımcı olur.',
          },
        ),
        Phrase(
          id: 'es_pro_feedback_3',
          target: 'Me gustó mucho cómo respondió a las preguntas del cliente.',
          gloss: {
            UiLang.tr:
                "Müşterinin sorularını ele alış şeklini gerçekten takdir ettim.",
          },
        ),
        Phrase(
          id: 'es_pro_feedback_4',
          target: '¿Qué le parece a usted el resultado?',
          gloss: {UiLang.tr: 'Sonuç hakkında kendin ne düşünüyorsun?'},
        ),
        Phrase(
          id: 'es_pro_feedback_5',
          target: 'Volvamos a hablar después del próximo hito.',
          gloss: {
            UiLang.tr: 'Bir sonraki kilometre taşından sonra tekrar konuşalım.',
          },
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Pregunte si es buen momento antes de dar sus observaciones.',
          expected:
              'Me gustaría comentarle algunas observaciones. ¿Es buen momento?',
        ),
        SpeakTurn(
          prompt: 'Señale con tacto un aspecto que se pueda mejorar.',
          expected:
              'La próxima vez, sería útil incluir las cifras al principio.',
        ),
        SpeakTurn(
          prompt: 'Reconozca algo que la otra persona hizo bien.',
          expected:
              'Me gustó mucho cómo respondió a las preguntas del cliente.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '“Sería útil + mastar” nazik bir öneridir. Kötü örnek dilbilgisel olarak doğru ama buyurgandır.',
        },
        goodExample: 'Sería útil añadir las cifras.',
        badExample: 'Tiene que añadir las cifras.',
      ),
    ),
    Scenario(
      id: 'es_pro_deadline',
      lang: LearnLang.es,
      cefr: Cefr.b1,
      minutes: 9,
      titles: {
        UiLang.tr: 'Teslim tarihi için pazarlık',
        UiLang.en: 'Negotiating a deadline',
        UiLang.es: 'Negociar una fecha de entrega',
      },
      clipLine: 'Me preocupa que no lleguemos a tiempo para el viernes.',
      phrases: [
        Phrase(
          id: 'es_pro_deadline_0',
          target: 'Me preocupa que no lleguemos a tiempo para el viernes.',
          gloss: {UiLang.tr: 'Cumaya yetiştiremeyeceğimizden endişeliyim.'},
        ),
        Phrase(
          id: 'es_pro_deadline_1',
          target: '¿Sería posible aplazar la fecha de entrega hasta el lunes?',
          gloss: {
            UiLang.tr: 'Teslim tarihini pazartesiye taşımak mümkün olur mu?',
          },
        ),
        Phrase(
          id: 'es_pro_deadline_2',
          target:
              'Como alternativa, podríamos entregar una versión parcial para el viernes.',
          gloss: {
            UiLang.tr:
                'Bunun yerine cumaya kadar kısmi bir versiyon teslim edebiliriz.',
          },
        ),
        Phrase(
          id: 'es_pro_deadline_3',
          target: '¿Qué necesitaría de nosotros para que eso funcionara?',
          gloss: {UiLang.tr: 'Bunun olması için bizden neye ihtiyacınız olur?'},
        ),
        Phrase(
          id: 'es_pro_deadline_4',
          target:
              'Acordemos ahora una fecha realista para evitar otro retraso más adelante.',
          gloss: {
            UiLang.tr:
                'Daha sonra tekrar kaymaktansa şimdi gerçekçi bir tarihte anlaşalım.',
          },
        ),
        Phrase(
          id: 'es_pro_deadline_5',
          target: 'El lunes me viene bien. Se lo confirmaré por escrito.',
          gloss: {UiLang.tr: 'Pazartesi uygun. Yazılı olarak teyit edeceğim.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Advierta del riesgo con antelación.',
          expected: 'Me preocupa que no lleguemos a tiempo para el viernes.',
        ),
        SpeakTurn(
          prompt: 'Proponga otra fecha.',
          expected:
              '¿Sería posible aplazar la fecha de entrega hasta el lunes?',
        ),
        SpeakTurn(
          prompt: 'Ofrezca una solución intermedia.',
          expected:
              'Como alternativa, podríamos entregar una versión parcial para el viernes.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '“Sería posible + mastar” yapısında mastardan önce “de” kullanılmaz.',
        },
        goodExample: '¿Sería posible ampliar el plazo?',
        badExample: '¿Sería posible de ampliar el plazo?',
      ),
    ),
    Scenario(
      id: 'es_pro_networking',
      lang: LearnLang.es,
      cefr: Cefr.a2,
      minutes: 8,
      titles: {
        UiLang.tr: 'Networking sohbeti',
        UiLang.en: 'Networking small talk',
        UiLang.es: 'Conversar en un evento profesional',
      },
      clipLine: '¿Qué le trae a esta conferencia?',
      phrases: [
        Phrase(
          id: 'es_pro_network_0',
          target: '¿Qué le trae a esta conferencia?',
          gloss: {UiLang.tr: 'Peki, seni bu konferansa getiren ne?'},
        ),
        Phrase(
          id: 'es_pro_network_1',
          target: 'Estoy aquí sobre todo para buscar nuevas colaboraciones.',
          gloss: {
            UiLang.tr: 'Daha çok yeni iş birlikleri araştırmak için buradayım.',
          },
        ),
        Phrase(
          id: 'es_pro_network_2',
          target: 'Qué interesante. Cuénteme un poco más sobre su trabajo.',
          gloss: {
            UiLang.tr:
                'Bu ilginç, ne yaptığınızdan biraz daha bahseder misiniz?',
          },
        ),
        Phrase(
          id: 'es_pro_network_3',
          target: 'Aquí tiene mi tarjeta. Sigamos en contacto.',
          gloss: {UiLang.tr: 'İşte kartım — iletişimde kalalım.'},
        ),
        Phrase(
          id: 'es_pro_network_4',
          target:
              'Le enviaré una solicitud de contacto por LinkedIn después de la conferencia.',
          gloss: {
            UiLang.tr: "Bundan sonra sizinle LinkedIn'de bağlantı kuracağım.",
          },
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Inicie una conversación en un evento profesional.',
          expected: '¿Qué le trae a esta conferencia?',
        ),
        SpeakTurn(
          prompt: 'Explique por qué está allí.',
          expected: 'Estoy aquí sobre todo para buscar nuevas colaboraciones.',
        ),
        SpeakTurn(
          prompt: 'Termine la conversación de forma cordial.',
          expected: 'Aquí tiene mi tarjeta. Sigamos en contacto.',
        ),
      ],
    ),
    Scenario(
      id: 'es_pro_client_call',
      lang: LearnLang.es,
      cefr: Cefr.b2,
      minutes: 10,
      titles: {
        UiLang.tr: 'Müşteri şikayeti telefonu',
        UiLang.en: 'Handling a client complaint call',
        UiLang.es: 'Atender una reclamación de un cliente por teléfono',
      },
      clipLine: 'Entiendo lo frustrante que debe de ser esta situación.',
      phrases: [
        Phrase(
          id: 'es_pro_client_0',
          target: 'Entiendo lo frustrante que debe de ser esta situación.',
          gloss: {UiLang.tr: 'Bunun ne kadar sinir bozucu olduğunu anlıyorum.'},
        ),
        Phrase(
          id: 'es_pro_client_1',
          target: 'Déjeme abrir su cuenta y revisarlo con más detalle.',
          gloss: {UiLang.tr: 'Hesabınızı açıp daha yakından bakayım.'},
        ),
        Phrase(
          id: 'es_pro_client_2',
          target: 'Ya veo exactamente dónde se produjo el problema.',
          gloss: {
            UiLang.tr:
                'İşlerin nerede yanlış gittiğini tam olarak görebiliyorum.',
          },
        ),
        Phrase(
          id: 'es_pro_client_3',
          target: 'Esto es lo que voy a hacer para resolverle el problema.',
          gloss: {
            UiLang.tr: 'Bunu sizin için düzeltmek için yapacağım şey bu.',
          },
        ),
        Phrase(
          id: 'es_pro_client_4',
          target:
              'Me encargaré personalmente del seguimiento y le contactaré antes de que termine el día.',
          gloss: {UiLang.tr: 'Gün sonuna kadar bizzat takip edeceğim.'},
        ),
        Phrase(
          id: 'es_pro_client_5',
          target: 'Gracias por su paciencia mientras resolvíamos el problema.',
          gloss: {
            UiLang.tr:
                'Bunu çözerken gösterdiğiniz sabır için teşekkür ederim.',
          },
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'El cliente está molesto. Muestre empatía primero.',
          expected: 'Entiendo lo frustrante que debe de ser esta situación.',
        ),
        SpeakTurn(
          prompt: 'Pase a investigar el problema.',
          expected: 'Déjeme abrir su cuenta y revisarlo con más detalle.',
        ),
        SpeakTurn(
          prompt: 'Comprométase a dar un siguiente paso concreto.',
          expected: 'Esto es lo que voy a hacer para resolverle el problema.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'İşlevsel dil notu: Önce müşterinin duygusunu kabul edin, sonra sorunu inceleyin. Kötü örnek dilbilgisel hata değil, duyguyu küçümseyen bir söylemdir.',
        },
        goodExample: 'Entiendo su frustración. Voy a revisar el problema.',
        badExample: 'No tiene por qué enfadarse.',
      ),
    ),
    Scenario(
      id: 'es_pro_raise',
      lang: LearnLang.es,
      cefr: Cefr.b2,
      minutes: 11,
      titles: {
        UiLang.tr: 'Zam görüşmesi',
        UiLang.en: 'Asking for a raise',
        UiLang.es: 'Pedir un aumento de sueldo',
      },
      clipLine: 'Me gustaría hablar de mi remuneración.',
      phrases: [
        Phrase(
          id: 'es_pro_raise_0',
          target: 'Me gustaría hablar de mi remuneración.',
          gloss: {UiLang.tr: 'Maaşım hakkında konuşmak istiyorum.'},
        ),
        Phrase(
          id: 'es_pro_raise_1',
          target:
              'Durante el último año he asumido muchas más responsabilidades.',
          gloss: {
            UiLang.tr:
                'Geçen yıl boyunca önemli ölçüde daha fazla sorumluluk üstlendim.',
          },
        ),
        Phrase(
          id: 'es_pro_raise_2',
          target:
              'He investigado un poco y mi remuneración está actualmente por debajo de lo habitual en el mercado para este puesto.',
          gloss: {
            UiLang.tr:
                'Biraz araştırma yaptım ve pozisyonum şu anda piyasa oranının altında.',
          },
        ),
        Phrase(
          id: 'es_pro_raise_3',
          target: 'Quisiera solicitar un aumento del diez por ciento.',
          gloss: {UiLang.tr: 'Yüzde on zam talep ediyorum.'},
        ),
        Phrase(
          id: 'es_pro_raise_4',
          target:
              'Entiendo su planteamiento. Necesitaré un poco de tiempo para valorarlo.',
          gloss: {
            UiLang.tr:
                'Sizi anlıyorum ve bunu değerlendirmek için biraz zamana ihtiyacım olacak.',
          },
        ),
        Phrase(
          id: 'es_pro_raise_5',
          target: 'Por supuesto. ¿Cuándo podríamos retomar este tema?',
          gloss: {UiLang.tr: 'Tabii ki, bunu ne zaman tekrar konuşabiliriz?'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Introduzca el tema de forma directa y cortés.',
          expected: 'Me gustaría hablar de mi remuneración.',
        ),
        SpeakTurn(
          prompt: 'Justifique su petición con datos.',
          expected:
              'He investigado un poco y mi remuneración está actualmente por debajo de lo habitual en el mercado para este puesto.',
        ),
        SpeakTurn(
          prompt: 'Indique un porcentaje concreto.',
          expected: 'Quisiera solicitar un aumento del diez por ciento.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '“He asumido” pretérito perfecto compuesto biçimidir: “haber” çekimi ve değişmeyen participio kullanılır.',
        },
        goodExample: 'He asumido más responsabilidades este año.',
        badExample: 'He asumir más responsabilidades este año.',
      ),
    ),
  ];
}
