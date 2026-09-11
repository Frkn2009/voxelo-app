import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/l10n/editorial_strings.dart';
import '../../core/theme/tokens.dart';
import '../../data/content/catalog.dart';
import '../../data/models/models.dart';
import '../../state/session.dart';
import '../../ui/editorial/editorial_widgets.dart';

final editorialLessonsProvider = Provider<List<Scenario>>((ref) {
  final profile = ref.watch(sessionProvider);
  return Catalog.forLang(profile.learnLang)
      .where((scene) => scene.cefr.index <= profile.cefr.index)
      .toList(growable: false);
});

TextDirection editorialDirection(UiLang language) =>
    const [UiLang.ar, UiLang.he, UiLang.fa].contains(language)
    ? TextDirection.rtl
    : TextDirection.ltr;

/// onStartLesson should open the existing speaking/review flow.
class EditorialHomeScreen extends ConsumerWidget {
  const EditorialHomeScreen({super.key, required this.onStartLesson});
  final ValueChanged<Scenario> onStartLesson;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = ref.watch(i18nProvider);
    final profile = ref.watch(sessionProvider);
    final lessons = ref.watch(editorialLessonsProvider);
    final pending = lessons
        .where((scene) => !profile.completedSceneIds.contains(scene.id))
        .toList();
    final suggestions = (pending.isEmpty ? lessons : pending).take(8).toList();
    final done = lessons
        .where((scene) => profile.completedSceneIds.contains(scene.id))
        .length;
    return EditorialPage(
      textDirection: editorialDirection(profile.uiLang),
      children: [
        Builder(
          builder: (context) {
            final text = Theme.of(context).textTheme;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(strings.appName, style: text.labelLarge),
                const SizedBox(height: 40),
                Text(
                  strings.editorialEyebrow,
                  style: text.labelMedium?.copyWith(
                    color: VoxelithTokens.editorialAccent,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                Text(strings.editorialHomeTitle, style: text.displaySmall),
                const SizedBox(height: 16),
                Text(strings.editorialHomeBody, style: text.bodyLarge),
                const SizedBox(height: 24),
                Text(
                  profile.learnLang.label(profile.uiLang),
                  style: text.titleLarge,
                ),
                const SizedBox(height: 12),
                Text(strings.editorialProgress(done, lessons.length)),
                const SizedBox(height: 12),
                LinearProgressIndicator(
                  value: lessons.isEmpty ? 0 : done / lessons.length,
                  semanticsLabel: strings.editorialProgress(
                    done,
                    lessons.length,
                  ),
                  minHeight: 3,
                ),
                const Divider(),
                if (suggestions.isEmpty)
                  Text(strings.editorialEmpty, style: text.bodyLarge)
                else ...[
                  Text(
                    strings.editorialReady,
                    style: text.labelLarge?.copyWith(
                      color: VoxelithTokens.editorialAccent,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    suggestions.first.title(profile.uiLang),
                    style: text.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  Directionality(
                    textDirection: profile.learnLang.isRtl
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    child: Align(
                      alignment: profile.learnLang.isRtl
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Text(
                        suggestions.first.clipLine,
                        style: text.bodyLarge,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  EditorialButton(
                    label: pending.isEmpty
                        ? strings.editorialReview
                        : strings.editorialStart,
                    onPressed: () => onStartLesson(suggestions.first),
                  ),
                  const Divider(),
                  Text(strings.editorialPath, style: text.titleLarge),
                  const SizedBox(height: 8),
                  for (final scene in suggestions)
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      minVerticalPadding: 16,
                      title: Text(scene.title(profile.uiLang)),
                      subtitle: Text(strings.editorialMinutes(scene.minutes)),
                      trailing: profile.completedSceneIds.contains(scene.id)
                          ? Tooltip(
                              message: strings.editorialDone,
                              child: const Icon(
                                Icons.check_circle_outline,
                                color: VoxelithTokens.editorialAccent,
                              ),
                            )
                          : const Icon(
                              Icons.arrow_forward,
                              color: VoxelithTokens.editorialAccent,
                            ),
                      onTap: () => onStartLesson(scene),
                    ),
                ],
              ],
            );
          },
        ),
      ],
    );
  }
}
