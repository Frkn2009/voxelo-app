import '../models/models.dart';

/// Doğal profesyonel dil; Türkçe açıklamalar ve kaynak kimlik son ekleri korunur.
class ProfessionalCatalogAr {
  static List<Scenario> build(LearnLang language) =>
      language == LearnLang.ar ? _scenarios : const [];

  static final List<Scenario> _scenarios = [
    Scenario(
      id: 'ar_pro_interview',
      lang: LearnLang.ar,
      cefr: Cefr.b1,
      minutes: 10,
      titles: {
        UiLang.tr: 'İş görüşmesi: Kendini tanıtmak',
        UiLang.en: 'Job interview: Introducing yourself',
        UiLang.ar: 'مقابلة العمل: التعريف بالنفس',
      },
      clipLine: 'أود أن أقدم لكم نبذة عن مسيرتي المهنية.',
      phrases: [
        Phrase(
          id: 'ar_pro_interview_0',
          target: 'أود أن أقدم لكم نبذة عن مسيرتي المهنية.',
          gloss: {UiLang.tr: 'Geçmişimi sizinle özetlemek isterim.'},
        ),
        Phrase(
          id: 'ar_pro_interview_1',
          target: 'أعمل في إدارة المشاريع منذ ثلاث سنوات.',
          gloss: {UiLang.tr: 'Son üç yıldır proje yönetiminde çalışıyorum.'},
        ),
        Phrase(
          id: 'ar_pro_interview_2',
          target: 'أكثر ما أستمتع به في عملي هو حل المشكلات تحت الضغط.',
          gloss: {
            UiLang.tr: 'En çok keyif aldığım şey baskı altında sorun çözmek.',
          },
        ),
        Phrase(
          id: 'ar_pro_interview_3',
          target: 'هل يمكن أن تخبروني بالمزيد عن الفريق الذي سأنضم إليه؟',
          gloss: {
            UiLang.tr:
                'Katılacağım ekip hakkında biraz daha bilgi verebilir misiniz?',
          },
        ),
        Phrase(
          id: 'ar_pro_interview_4',
          target: 'هذا سؤال مهم. اسمحوا لي أن أفكر للحظة.',
          gloss: {UiLang.tr: 'Çok iyi bir soru — bir saniye düşüneyim.'},
        ),
        Phrase(
          id: 'ar_pro_interview_5',
          target: 'شكراً على وقتكم، وأتطلع إلى سماع ردكم.',
          gloss: {
            UiLang.tr:
                'Vaktiniz için teşekkürler, sizden haber almayı dört gözle bekliyorum.',
          },
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'حدثوني عن أنفسكم.',
          expected: 'أود أن أقدم لكم نبذة عن مسيرتي المهنية.',
        ),
        SpeakTurn(
          prompt: 'ما خبرتكم المهنية؟',
          expected: 'أعمل في إدارة المشاريع منذ ثلاث سنوات.',
        ),
        SpeakTurn(
          prompt: 'ما الذي تستمتعون به في عملكم؟',
          expected: 'أكثر ما أستمتع به في عملي هو حل المشكلات تحت الضغط.',
        ),
        SpeakTurn(
          prompt: 'هل لديكم أي أسئلة لنا؟',
          expected: 'هل يمكن أن تخبروني بالمزيد عن الفريق الذي سأنضم إليه؟',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Arapçada geçmişte başlayıp hâlen devam eden bir iş, muzari fiil ve “منذ” ile anlatılabilir. Sayı tamlamasında “ثلاث” ile çoğul “سنوات” kullanılır.',
        },
        goodExample: 'أعمل في إدارة المشاريع منذ ثلاث سنوات.',
        badExample: 'أعمل في إدارة المشاريع منذ ثلاث سنة.',
      ),
    ),
    Scenario(
      id: 'ar_pro_meeting_request',
      lang: LearnLang.ar,
      cefr: Cefr.b1,
      minutes: 9,
      titles: {
        UiLang.tr: 'Toplantı talep etmek',
        UiLang.en: 'Requesting a meeting',
        UiLang.ar: 'طلب اجتماع',
      },
      clipLine: 'هل لديكم ربع ساعة هذا الأسبوع لنتابع المستجدات معاً؟',
      phrases: [
        Phrase(
          id: 'ar_pro_meeting_0',
          target: 'هل لديكم ربع ساعة هذا الأسبوع لنتابع المستجدات معاً؟',
          gloss: {UiLang.tr: 'Bu hafta senkron için on beş dakikanız var mı?'},
        ),
        Phrase(
          id: 'ar_pro_meeting_1',
          target: 'أود أن أناقش معكم بعض النقاط قبل الإطلاق.',
          gloss: {
            UiLang.tr: 'Lansmandan önce birkaç şeyi sizinle konuşmak isterim.',
          },
        ),
        Phrase(
          id: 'ar_pro_meeting_2',
          target: 'هل يناسبكم يوم الخميس بعد الظهر؟',
          gloss: {UiLang.tr: 'Perşembe öğleden sonra sizin için uygun mu?'},
        ),
        Phrase(
          id: 'ar_pro_meeting_3',
          target: 'لنؤجل اللقاء إلى الأسبوع المقبل إذا كان ذلك أنسب لكم.',
          gloss: {
            UiLang.tr: 'Daha kolay olacaksa gelecek haftaya erteleyelim.',
          },
        ),
        Phrase(
          id: 'ar_pro_meeting_4',
          target: 'سأرسل لكم دعوة عبر التقويم تتضمن جدول الأعمال.',
          gloss: {
            UiLang.tr: 'Gündemle birlikte bir takvim daveti göndereceğim.',
          },
        ),
        Phrase(
          id: 'ar_pro_meeting_5',
          target: 'أتطلع إلى لقائنا.',
          gloss: {UiLang.tr: 'Görüşmeyi dört gözle bekliyorum.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'اقترحوا لقاءً قصيراً مع أحد الزملاء لمتابعة المستجدات.',
          expected: 'هل لديكم ربع ساعة هذا الأسبوع لنتابع المستجدات معاً؟',
        ),
        SpeakTurn(
          prompt: 'يسألكم الزميل عن سبب اللقاء.',
          expected: 'أود أن أناقش معكم بعض النقاط قبل الإطلاق.',
        ),
        SpeakTurn(
          prompt: 'اقترحوا موعداً محدداً.',
          expected: 'هل يناسبكم يوم الخميس بعد الظهر؟',
          scaffold: 'هل يناسبكم …؟',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '“هل يناسبكم …؟” nazikçe uygunluk sorar. “كم” hitap edilen kişilere ait nesne ekidir; burada özne eril “يوم الخميس” olduğu için fiil de eril biçimde olmalıdır.',
        },
        goodExample: 'هل يناسبكم يوم الخميس؟',
        badExample: 'هل تناسبكم يوم الخميس؟',
      ),
    ),
    Scenario(
      id: 'ar_pro_update',
      lang: LearnLang.ar,
      cefr: Cefr.b1,
      minutes: 10,
      titles: {
        UiLang.tr: 'Proje güncellemesi sunmak',
        UiLang.en: 'Presenting a project update',
        UiLang.ar: 'عرض مستجدات المشروع',
      },
      clipLine:
          'نسير وفق الجدول الزمني، ونحن على المسار الصحيح للالتزام بموعد التسليم.',
      phrases: [
        Phrase(
          id: 'ar_pro_update_0',
          target:
              'نسير وفق الجدول الزمني، ونحن على المسار الصحيح للالتزام بموعد التسليم.',
          gloss: {UiLang.tr: 'Teslim tarihini yakalama konusunda yolundayız.'},
        ),
        Phrase(
          id: 'ar_pro_update_1',
          target: 'هناك عائق أود لفت الانتباه إليه.',
          gloss: {UiLang.tr: 'Belirtmek istediğim bir engel var.'},
        ),
        Phrase(
          id: 'ar_pro_update_2',
          target: 'نحتاج إلى موظف إضافي للحفاظ على وتيرة العمل.',
          gloss: {
            UiLang.tr: 'Hızı korumak için bir kaynağa daha ihtiyacımız var.',
          },
        ),
        Phrase(
          id: 'ar_pro_update_3',
          target: 'هذا ما أنجزناه منذ الأسبوع الماضي.',
          gloss: {
            UiLang.tr: 'Geçen haftadan bu yana tamamladıklarımız bunlar.',
          },
        ),
        Phrase(
          id: 'ar_pro_update_4',
          target: 'هل لديكم أي أسئلة قبل أن أنتقل إلى الشريحة التالية؟',
          gloss: {
            UiLang.tr: 'Bir sonraki slayda geçmeden önce sorusu olan var mı?',
          },
        ),
        Phrase(
          id: 'ar_pro_update_5',
          target: 'سأرسل لكم التفاصيل كتابةً بعد الاجتماع.',
          gloss: {UiLang.tr: 'Detayları yazılı olarak takip edeceğim.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'ابدؤوا بعرض مستجدات المشروع.',
          expected:
              'نسير وفق الجدول الزمني، ونحن على المسار الصحيح للالتزام بموعد التسليم.',
        ),
        SpeakTurn(
          prompt: 'أشيروا إلى مشكلة تثير قلقكم.',
          expected: 'هناك عائق أود لفت الانتباه إليه.',
        ),
        SpeakTurn(
          prompt: 'اطلبوا الدعم الذي تحتاجون إليه.',
          expected: 'نحتاج إلى موظف إضافي للحفاظ على وتيرة العمل.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Amaç bildiren “كي”den sonra muzari fiil mansub olur. Aşağıdaki örnekte son hareke damme yerine fethadır.',
        },
        goodExample: 'نحن على المسار الصحيح كي نلتزمَ بموعد التسليم.',
        badExample: 'نحن على المسار الصحيح كي نلتزمُ بموعد التسليم.',
      ),
    ),
    Scenario(
      id: 'ar_pro_feedback',
      lang: LearnLang.ar,
      cefr: Cefr.b2,
      minutes: 11,
      titles: {
        UiLang.tr: 'Yapıcı geri bildirim vermek',
        UiLang.en: 'Giving constructive feedback',
        UiLang.ar: 'تقديم ملاحظات بنّاءة',
      },
      clipLine: 'أود أن أشارككم بعض الملاحظات. هل الوقت مناسب الآن؟',
      phrases: [
        Phrase(
          id: 'ar_pro_feedback_0',
          target: 'أود أن أشارككم بعض الملاحظات. هل الوقت مناسب الآن؟',
          gloss: {
            UiLang.tr: 'Bir geri bildirim paylaşmak istiyorum, şimdi uygun mu?',
          },
        ),
        Phrase(
          id: 'ar_pro_feedback_1',
          target: 'كان التقرير جيداً بشكل عام، لكن بعض النقاط لفتت انتباهي.',
          gloss: {
            UiLang.tr:
                'Genel olarak rapor sağlamdı ama birkaç şey dikkatimi çekti.',
          },
        ),
        Phrase(
          id: 'ar_pro_feedback_2',
          target: 'في المرة المقبلة، سيكون من المفيد عرض الأرقام في البداية.',
          gloss: {
            UiLang.tr:
                'Bir dahaki sefere rakamları en başa koymak yardımcı olur.',
          },
        ),
        Phrase(
          id: 'ar_pro_feedback_3',
          target: 'أقدّر كثيراً الطريقة التي تعاملتم بها مع أسئلة العميل.',
          gloss: {
            UiLang.tr:
                "Müşterinin sorularını ele alış şeklini gerçekten takdir ettim.",
          },
        ),
        Phrase(
          id: 'ar_pro_feedback_4',
          target: 'ما رأيكم أنتم في النتيجة؟',
          gloss: {UiLang.tr: 'Sonuç hakkında kendin ne düşünüyorsun?'},
        ),
        Phrase(
          id: 'ar_pro_feedback_5',
          target: 'لنتحدث مجدداً بعد إنجاز المرحلة الرئيسية التالية.',
          gloss: {
            UiLang.tr: 'Bir sonraki kilometre taşından sonra tekrar konuşalım.',
          },
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'اسألوا إن كان الوقت مناسباً قبل تقديم الملاحظات.',
          expected: 'أود أن أشارككم بعض الملاحظات. هل الوقت مناسب الآن؟',
        ),
        SpeakTurn(
          prompt: 'اقترحوا بلطف جانباً يمكن تحسينه.',
          expected: 'في المرة المقبلة، سيكون من المفيد عرض الأرقام في البداية.',
        ),
        SpeakTurn(
          prompt: 'أشيدوا بشيء أُنجز بشكل جيد.',
          expected: 'أقدّر كثيراً الطريقة التي تعاملتم بها مع أسئلة العميل.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '“سيكون من المفيد + mastar” nazik öneri sunar. Kötü örnek dilbilgisel olarak doğru olsa da zorunluluk bildirir.',
        },
        goodExample: 'سيكون من المفيد إضافة الأرقام.',
        badExample: 'يجب عليكم إضافة الأرقام.',
      ),
    ),
    Scenario(
      id: 'ar_pro_deadline',
      lang: LearnLang.ar,
      cefr: Cefr.b1,
      minutes: 9,
      titles: {
        UiLang.tr: 'Teslim tarihi için pazarlık',
        UiLang.en: 'Negotiating a deadline',
        UiLang.ar: 'التفاوض على موعد التسليم',
      },
      clipLine: 'أخشى ألا نتمكن من الانتهاء بحلول يوم الجمعة.',
      phrases: [
        Phrase(
          id: 'ar_pro_deadline_0',
          target: 'أخشى ألا نتمكن من الانتهاء بحلول يوم الجمعة.',
          gloss: {UiLang.tr: 'Cumaya yetiştiremeyeceğimizden endişeliyim.'},
        ),
        Phrase(
          id: 'ar_pro_deadline_1',
          target: 'هل من الممكن تأجيل موعد التسليم إلى يوم الاثنين؟',
          gloss: {
            UiLang.tr: 'Teslim tarihini pazartesiye taşımak mümkün olur mu?',
          },
        ),
        Phrase(
          id: 'ar_pro_deadline_2',
          target: 'يمكننا بدلاً من ذلك تسليم نسخة جزئية بحلول يوم الجمعة.',
          gloss: {
            UiLang.tr:
                'Bunun yerine cumaya kadar kısmi bir versiyon teslim edebiliriz.',
          },
        ),
        Phrase(
          id: 'ar_pro_deadline_3',
          target: 'ما الذي تحتاجونه منا حتى نتمكن من تنفيذ ذلك؟',
          gloss: {UiLang.tr: 'Bunun olması için bizden neye ihtiyacınız olur?'},
        ),
        Phrase(
          id: 'ar_pro_deadline_4',
          target:
              'لنتفق الآن على موعد واقعي، حتى لا نضطر إلى التأجيل مرة أخرى لاحقاً.',
          gloss: {
            UiLang.tr:
                'Daha sonra tekrar kaymaktansa şimdi gerçekçi bir tarihte anlaşalım.',
          },
        ),
        Phrase(
          id: 'ar_pro_deadline_5',
          target: 'يوم الاثنين مناسب. سأؤكد ذلك كتابةً.',
          gloss: {UiLang.tr: 'Pazartesi uygun. Yazılı olarak teyit edeceğim.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'نبّهوا إلى الخطر مبكراً.',
          expected: 'أخشى ألا نتمكن من الانتهاء بحلول يوم الجمعة.',
        ),
        SpeakTurn(
          prompt: 'اقترحوا موعداً بديلاً.',
          expected: 'هل من الممكن تأجيل موعد التسليم إلى يوم الاثنين؟',
        ),
        SpeakTurn(
          prompt: 'قدّموا حلاً وسطاً.',
          expected: 'يمكننا بدلاً من ذلك تسليم نسخة جزئية بحلول يوم الجمعة.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '“هل من الممكن …؟” yapısından sonra mastar veya “أن + muzari” gelir; yalın muzari doğrudan bağlanmaz.',
        },
        goodExample: 'هل من الممكن تأجيل الموعد؟',
        badExample: 'هل من الممكن نؤجل الموعد؟',
      ),
    ),
    Scenario(
      id: 'ar_pro_networking',
      lang: LearnLang.ar,
      cefr: Cefr.a2,
      minutes: 8,
      titles: {
        UiLang.tr: 'Networking sohbeti',
        UiLang.en: 'Networking small talk',
        UiLang.ar: 'التعارف في الفعاليات المهنية',
      },
      clipLine: 'ما الذي دفعكم إلى حضور هذا المؤتمر؟',
      phrases: [
        Phrase(
          id: 'ar_pro_network_0',
          target: 'ما الذي دفعكم إلى حضور هذا المؤتمر؟',
          gloss: {UiLang.tr: 'Peki, seni bu konferansa getiren ne?'},
        ),
        Phrase(
          id: 'ar_pro_network_1',
          target: 'أنا هنا بشكل أساسي للبحث عن شراكات جديدة.',
          gloss: {
            UiLang.tr: 'Daha çok yeni iş birlikleri araştırmak için buradayım.',
          },
        ),
        Phrase(
          id: 'ar_pro_network_2',
          target: 'هذا مثير للاهتمام. حدثوني أكثر عن طبيعة عملكم.',
          gloss: {
            UiLang.tr:
                'Bu ilginç, ne yaptığınızdan biraz daha bahseder misiniz?',
          },
        ),
        Phrase(
          id: 'ar_pro_network_3',
          target: 'هذه بطاقة عملي. لنبقَ على تواصل.',
          gloss: {UiLang.tr: 'İşte kartım — iletişimde kalalım.'},
        ),
        Phrase(
          id: 'ar_pro_network_4',
          target: 'سأرسل لكم طلب تواصل على لينكدإن بعد المؤتمر.',
          gloss: {
            UiLang.tr: "Bundan sonra sizinle LinkedIn'de bağlantı kuracağım.",
          },
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'ابدؤوا حواراً في فعالية مهنية.',
          expected: 'ما الذي دفعكم إلى حضور هذا المؤتمر؟',
        ),
        SpeakTurn(
          prompt: 'اشرحوا سبب حضوركم.',
          expected: 'أنا هنا بشكل أساسي للبحث عن شراكات جديدة.',
        ),
        SpeakTurn(
          prompt: 'اختتموا الحديث بودّ.',
          expected: 'هذه بطاقة عملي. لنبقَ على تواصل.',
        ),
      ],
    ),
    Scenario(
      id: 'ar_pro_client_call',
      lang: LearnLang.ar,
      cefr: Cefr.b2,
      minutes: 10,
      titles: {
        UiLang.tr: 'Müşteri şikayeti telefonu',
        UiLang.en: 'Handling a client complaint call',
        UiLang.ar: 'التعامل مع شكوى عميل عبر الهاتف',
      },
      clipLine: 'أتفهم مدى الإحباط الذي قد يسببه لكم هذا الموقف.',
      phrases: [
        Phrase(
          id: 'ar_pro_client_0',
          target: 'أتفهم مدى الإحباط الذي قد يسببه لكم هذا الموقف.',
          gloss: {UiLang.tr: 'Bunun ne kadar sinir bozucu olduğunu anlıyorum.'},
        ),
        Phrase(
          id: 'ar_pro_client_1',
          target: 'دعوني أفتح حسابكم وأراجع التفاصيل بدقة أكبر.',
          gloss: {UiLang.tr: 'Hesabınızı açıp daha yakından bakayım.'},
        ),
        Phrase(
          id: 'ar_pro_client_2',
          target: 'أرى الآن أين حدث الخلل بالضبط.',
          gloss: {
            UiLang.tr:
                'İşlerin nerede yanlış gittiğini tam olarak görebiliyorum.',
          },
        ),
        Phrase(
          id: 'ar_pro_client_3',
          target: 'إليكم ما سأفعله لحل هذه المشكلة من أجلكم.',
          gloss: {
            UiLang.tr: 'Bunu sizin için düzeltmek için yapacağım şey bu.',
          },
        ),
        Phrase(
          id: 'ar_pro_client_4',
          target: 'سأتابع الأمر بنفسي وأتواصل معكم قبل نهاية اليوم.',
          gloss: {UiLang.tr: 'Gün sonuna kadar bizzat takip edeceğim.'},
        ),
        Phrase(
          id: 'ar_pro_client_5',
          target: 'شكراً على صبركم أثناء معالجة المشكلة.',
          gloss: {
            UiLang.tr:
                'Bunu çözerken gösterdiğiniz sabır için teşekkür ederim.',
          },
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'العميل مستاء. أظهروا تفهمكم أولاً.',
          expected: 'أتفهم مدى الإحباط الذي قد يسببه لكم هذا الموقف.',
        ),
        SpeakTurn(
          prompt: 'انتقلوا إلى فحص المشكلة.',
          expected: 'دعوني أفتح حسابكم وأراجع التفاصيل بدقة أكبر.',
        ),
        SpeakTurn(
          prompt: 'التزموا بخطوة تالية واضحة.',
          expected: 'إليكم ما سأفعله لحل هذه المشكلة من أجلكم.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'İşlevsel dil notu: Önce müşterinin duygusunu kabul edin, sonra incelemeye geçin. Kötü örnek dilbilgisel hata değil, müşterinin duygusunu küçümseyen bir ifadedir.',
        },
        goodExample: 'أتفهم انزعاجكم. سأراجع المشكلة فوراً.',
        badExample: 'لا داعي لكل هذا الانزعاج.',
      ),
    ),
    Scenario(
      id: 'ar_pro_raise',
      lang: LearnLang.ar,
      cefr: Cefr.b2,
      minutes: 11,
      titles: {
        UiLang.tr: 'Zam görüşmesi',
        UiLang.en: 'Asking for a raise',
        UiLang.ar: 'طلب زيادة في الراتب',
      },
      clipLine: 'أود أن أتحدث عن راتبي.',
      phrases: [
        Phrase(
          id: 'ar_pro_raise_0',
          target: 'أود أن أتحدث عن راتبي.',
          gloss: {UiLang.tr: 'Maaşım hakkında konuşmak istiyorum.'},
        ),
        Phrase(
          id: 'ar_pro_raise_1',
          target: 'خلال العام الماضي، توليت مسؤوليات أكبر بكثير.',
          gloss: {
            UiLang.tr:
                'Geçen yıl boyunca önemli ölçüde daha fazla sorumluluk üstlendim.',
          },
        ),
        Phrase(
          id: 'ar_pro_raise_2',
          target:
              'بعد الاطلاع على الرواتب السائدة، وجدت أن راتبي الحالي أقل من مستوى السوق لهذه الوظيفة.',
          gloss: {
            UiLang.tr:
                'Biraz araştırma yaptım ve pozisyonum şu anda piyasa oranının altında.',
          },
        ),
        Phrase(
          id: 'ar_pro_raise_3',
          target: 'أود طلب زيادة في الراتب بنسبة عشرة في المئة.',
          gloss: {UiLang.tr: 'Yüzde on zam talep ediyorum.'},
        ),
        Phrase(
          id: 'ar_pro_raise_4',
          target: 'أتفهم طلبكم، وسأحتاج إلى بعض الوقت لدراسته.',
          gloss: {
            UiLang.tr:
                'Sizi anlıyorum ve bunu değerlendirmek için biraz zamana ihtiyacım olacak.',
          },
        ),
        Phrase(
          id: 'ar_pro_raise_5',
          target: 'بالطبع، متى يمكننا مناقشة هذا الموضوع مجدداً؟',
          gloss: {UiLang.tr: 'Tabii ki, bunu ne zaman tekrar konuşabiliriz?'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'اطرحوا الموضوع بشكل مباشر ومهذب.',
          expected: 'أود أن أتحدث عن راتبي.',
        ),
        SpeakTurn(
          prompt: 'ادعموا طلبكم بأدلة.',
          expected:
              'بعد الاطلاع على الرواتب السائدة، وجدت أن راتبي الحالي أقل من مستوى السوق لهذه الوظيفة.',
        ),
        SpeakTurn(
          prompt: 'حددوا نسبة واضحة.',
          expected: 'أود طلب زيادة في الراتب بنسبة عشرة في المئة.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '“تولّى” fiilinin birinci tekil şahıs geçmiş biçimi “توليتُ” olur; sondaki elif, şahıs eki gelirken yaya dönüşür.',
        },
        goodExample: 'توليتُ مسؤوليات أكبر هذا العام.',
        badExample: 'تولّىتُ مسؤوليات أكبر هذا العام.',
      ),
    ),
  ];
}
