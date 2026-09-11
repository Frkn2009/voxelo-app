import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/l10n/i18n.dart';
import '../../core/l10n/editorial_strings.dart';
import '../../data/models/models.dart';
import '../../state/session.dart';
import '../../ui/editorial/editorial_widgets.dart';
import 'editorial_home_screen.dart';

typedef EditorialOnboardingChoice = ({
  UiLang ui,
  LearnLang language,
  Cefr level,
});

/// The host persists this draft via its existing onboarding/session flow.
/// No second global user profile or independent XP store is introduced.
final editorialOnboardingDraftProvider =
    StateProvider.autoDispose<EditorialOnboardingChoice>((ref) {
      final profile = ref.read(sessionProvider);
      return (
        ui: profile.uiLang,
        language: profile.learnLang,
        level: profile.cefr,
      );
    });
final _savingProvider = StateProvider.autoDispose<bool>((ref) => false);
final _saveFailedProvider = StateProvider.autoDispose<bool>((ref) => false);

class EditorialOnboardingScreen extends ConsumerWidget {
  const EditorialOnboardingScreen({super.key, required this.onFinish});

  /// Complete persistence and navigation here. Errors show a localized retry.
  final Future<void> Function(EditorialOnboardingChoice choice) onFinish;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final draft = ref.watch(editorialOnboardingDraftProvider);
    final saving = ref.watch(_savingProvider);
    final failed = ref.watch(_saveFailedProvider);
    final strings = I18n(draft.ui);
    void update(EditorialOnboardingChoice next) {
      ref.read(editorialOnboardingDraftProvider.notifier).state = next;
      ref.read(_saveFailedProvider.notifier).state = false;
    }

    return EditorialPage(
      textDirection: editorialDirection(draft.ui),
      children: [
        Builder(
          builder: (context) {
            final text = Theme.of(context).textTheme;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(strings.appName, style: text.labelLarge),
                const EditorialMark(),
                Text(
                  strings.editorialOnboardingTitle,
                  style: text.displaySmall,
                ),
                const SizedBox(height: 16),
                Text(strings.editorialOnboardingBody, style: text.bodyLarge),
                const SizedBox(height: 32),
                DropdownButtonFormField<UiLang>(
                  key: ValueKey(('ui', draft.ui)),
                  initialValue: draft.ui,
                  isExpanded: true,
                  decoration: InputDecoration(
                    labelText: strings.editorialUiLanguage,
                  ),
                  items: [
                    for (final ui in UiLang.values)
                      DropdownMenuItem(value: ui, child: Text(ui.nativeName())),
                  ],
                  onChanged: saving
                      ? null
                      : (value) {
                          if (value != null) {
                            update((
                              ui: value,
                              language: draft.language,
                              level: draft.level,
                            ));
                          }
                        },
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<LearnLang>(
                  key: ValueKey(('learn', draft.language, draft.ui)),
                  initialValue: draft.language,
                  isExpanded: true,
                  decoration: InputDecoration(
                    labelText: strings.editorialLearnLanguage,
                  ),
                  items: [
                    for (final language in LearnLang.values)
                      DropdownMenuItem(
                        value: language,
                        child: Text(language.label(draft.ui)),
                      ),
                  ],
                  onChanged: saving
                      ? null
                      : (value) {
                          if (value != null) {
                            update((
                              ui: draft.ui,
                              language: value,
                              level: draft.level,
                            ));
                          }
                        },
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<Cefr>(
                  key: ValueKey(('level', draft.level, draft.ui)),
                  initialValue: draft.level,
                  isExpanded: true,
                  itemHeight: null,
                  decoration: InputDecoration(
                    labelText: strings.editorialLevel,
                  ),
                  items: [
                    for (final level in Cefr.values)
                      DropdownMenuItem(
                        value: level,
                        child: Text(strings.editorialLevelLabel(level)),
                      ),
                  ],
                  onChanged: saving
                      ? null
                      : (value) {
                          if (value != null) {
                            update((
                              ui: draft.ui,
                              language: draft.language,
                              level: value,
                            ));
                          }
                        },
                ),
                const SizedBox(height: 24),
                Text(strings.editorialOnboardingNote, style: text.bodyMedium),
                if (failed) ...[
                  const SizedBox(height: 16),
                  Semantics(
                    liveRegion: true,
                    child: Text(strings.editorialSaveError),
                  ),
                ],
                const SizedBox(height: 24),
                EditorialButton(
                  label: saving
                      ? strings.editorialSaving
                      : strings.editorialBegin,
                  onPressed: saving
                      ? null
                      : () async {
                          ref.read(_savingProvider.notifier).state = true;
                          ref.read(_saveFailedProvider.notifier).state = false;
                          try {
                            await onFinish(draft);
                          } catch (_) {
                            if (context.mounted) {
                              ref.read(_saveFailedProvider.notifier).state =
                                  true;
                            }
                          } finally {
                            if (context.mounted) {
                              ref.read(_savingProvider.notifier).state = false;
                            }
                          }
                        },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
