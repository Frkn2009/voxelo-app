import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:voxelith/core/l10n/i18n.dart';
import 'package:voxelith/core/l10n/editorial_strings.dart';
import 'package:voxelith/data/content/professional_catalog.dart';
import 'package:voxelith/data/models/models.dart';
import 'package:voxelith/features/editorial/editorial_home_screen.dart';
import 'package:voxelith/features/editorial/editorial_complete_screen.dart';
import 'package:voxelith/features/editorial/editorial_onboarding_screen.dart';
import 'package:voxelith/state/session.dart';
import 'package:voxelith/ui/editorial/editorial_widgets.dart';

class _Session extends SessionController {
  _Session(this.profile);
  final UserProfile profile;
  @override
  UserProfile build() => profile;
}

Widget harness(Widget child, UserProfile profile, {double scale = 1}) =>
    ProviderScope(
      overrides: [sessionProvider.overrideWith(() => _Session(profile))],
      child: MaterialApp(
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.linear(scale)),
          child: child!,
        ),
        home: child,
      ),
    );

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    for (final entry in {
      'IBMPlexSerif': 'IBMPlexSerif-Regular.ttf',
      'IBMPlexSans': 'IBMPlexSans-Variable.ttf',
      'IBMPlexSansArabic': 'IBMPlexSansArabic-Regular.ttf',
    }.entries) {
      await (FontLoader(entry.key)
            ..addFont(rootBundle.load('assets/fonts/editorial/${entry.value}')))
          .load();
    }
  });
  for (final ui in [UiLang.tr, UiLang.ar]) {
    for (final scale in [1.0, 2.0]) {
      testWidgets('screens fit 320px / ${ui.name} / $scale', (tester) async {
        tester.view.physicalSize = const Size(320, 740);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        final profile = UserProfile.empty.copyWith(
          uiLang: ui,
          learnLang: LearnLang.ar,
          cefr: Cefr.b2,
        );
        final scene = ProfessionalCatalog.build(LearnLang.ar).first;
        final screens = <Widget>[
          EditorialHomeScreen(onStartLesson: (_) {}),
          EditorialCompleteScreen(
            scenario: scene,
            earnedXp: 20,
            practisedPhrases: 6,
            onContinue: () {},
            onReview: () {},
          ),
          EditorialOnboardingScreen(onFinish: (_) async {}),
        ];
        for (final screen in screens) {
          await tester.pumpWidget(harness(screen, profile, scale: scale));
          await tester.pumpAndSettle();
          expect(tester.takeException(), isNull);
          await tester.drag(find.byType(ListView), const Offset(0, -1400));
          await tester.pumpAndSettle();
          expect(tester.takeException(), isNull);
        }
      });
    }
  }
  testWidgets(
    'onboarding sends draft, disables duplicate submission, retries',
    (tester) async {
      var calls = 0;
      final gate = Completer<void>();
      final profile = UserProfile.empty;
      final strings = I18n(profile.uiLang);
      await tester.pumpWidget(
        harness(
          EditorialOnboardingScreen(
            onFinish: (choice) async {
              calls++;
              expect(choice.language, profile.learnLang);
              if (calls == 1) await gate.future;
              throw StateError('test failure');
            },
          ),
          profile,
        ),
      );
      await tester.scrollUntilVisible(find.byType(EditorialButton), 300);
      await tester.pumpAndSettle();
      await tester.tap(find.text(strings.editorialBegin));
      await tester.pumpAndSettle();
      expect(calls, 1);
      expect(find.text(strings.editorialSaving), findsOneWidget);
      final disabled = tester.widget<TextButton>(
        find.descendant(
          of: find.byType(EditorialButton),
          matching: find.byType(TextButton),
        ),
      );
      expect(disabled.onPressed, isNull);
      gate.complete();
      await tester.pumpAndSettle();
      expect(find.text(strings.editorialSaveError), findsOneWidget);
      await tester.ensureVisible(find.text(strings.editorialBegin));
      await tester.pumpAndSettle();
      await tester.tap(find.text(strings.editorialBegin));
      await tester.pumpAndSettle();
      expect(calls, 2);
    },
  );
  testWidgets('home opens the selected actual lesson', (tester) async {
    Scenario? selected;
    final scene = ProfessionalCatalog.build(LearnLang.ar).first;
    final profile = UserProfile.empty.copyWith(
      learnLang: LearnLang.ar,
      cefr: Cefr.b2,
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sessionProvider.overrideWith(() => _Session(profile)),
          editorialLessonsProvider.overrideWithValue([scene]),
        ],
        child: MaterialApp(
          home: EditorialHomeScreen(onStartLesson: (s) => selected = s),
        ),
      ),
    );
    await tester.scrollUntilVisible(find.byType(EditorialButton), 250);
    await tester.pumpAndSettle();
    final clip = find.text(scene.clipLine);
    expect(Directionality.of(tester.element(clip)), TextDirection.rtl);
    await tester.tap(find.text(I18n(profile.uiLang).editorialStart));
    expect(selected?.id, scene.id);
  });
}
