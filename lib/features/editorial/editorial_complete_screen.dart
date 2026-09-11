import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/l10n/editorial_strings.dart';
import '../../core/theme/tokens.dart';
import '../../data/models/models.dart';
import '../../state/session.dart';
import '../../ui/editorial/editorial_widgets.dart';
import 'editorial_home_screen.dart';

/// Display only after the real lesson flow has persisted completion.
/// No XP is awarded here: rebuilding/revisiting cannot award it twice.
class EditorialCompleteScreen extends ConsumerWidget {
  const EditorialCompleteScreen({
    super.key,
    required this.scenario,
    required this.earnedXp,
    required this.practisedPhrases,
    required this.onContinue,
    required this.onReview,
  }) : assert(earnedXp >= 0),
       assert(practisedPhrases >= 0);

  final Scenario scenario;
  final int earnedXp;
  final int practisedPhrases;
  final VoidCallback onContinue;
  final VoidCallback onReview;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = ref.watch(i18nProvider);
    final ui = ref.watch(sessionProvider.select((p) => p.uiLang));
    return EditorialPage(
      textDirection: editorialDirection(ui),
      children: [
        Builder(
          builder: (context) {
            final text = Theme.of(context).textTheme;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(strings.appName, style: text.labelLarge),
                const SizedBox(height: 24),
                const EditorialMark(celebrate: true),
                Text(
                  strings.editorialDone,
                  textAlign: TextAlign.center,
                  style: text.labelLarge?.copyWith(
                    color: VoxelithTokens.editorialAccent,
                  ),
                ),
                const SizedBox(height: 16),
                Semantics(
                  liveRegion: true,
                  child: Text(
                    strings.editorialCompleteTitle,
                    textAlign: TextAlign.center,
                    style: text.displaySmall,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  strings.editorialCompleteBody,
                  textAlign: TextAlign.center,
                  style: text.bodyLarge,
                ),
                const Divider(),
                Text(
                  scenario.title(ui),
                  textAlign: TextAlign.center,
                  style: text.titleLarge,
                ),
                const SizedBox(height: 24),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 32,
                  runSpacing: 16,
                  children: [
                    Text(
                      strings.editorialXp(earnedXp),
                      style: text.headlineMedium,
                    ),
                    Text(
                      strings.editorialPractised(practisedPhrases),
                      style: text.bodyLarge,
                    ),
                  ],
                ),
                const Divider(),
                EditorialButton(
                  label: strings.editorialHomeCta,
                  onPressed: onContinue,
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: onReview,
                  child: Text(strings.editorialReview),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
