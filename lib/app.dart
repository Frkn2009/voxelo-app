import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';
import 'core/theme/amber_theme.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/editorial_theme.dart';
import 'core/theme/legendary_theme.dart';
import 'data/models/models.dart';
import 'data/notifications/notification_service.dart';
import 'data/widgets/home_widget_service.dart';
import 'state/session.dart';

class VoxelithApp extends ConsumerWidget {
  const VoxelithApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themePreference = ref.watch(
      sessionProvider.select((profile) => profile.themePreference),
    );
    ref.listen(sessionProvider, (_, profile) {
      unawaited(NotificationService.sync(profile).catchError((_) {}));
      unawaited(VoxelithHomeWidgetService.sync(profile).catchError((_) {}));
    });
    return MaterialApp.router(
      title: 'VOXELITH',
      debugShowCheckedModeBanner: false,
      theme: switch (themePreference) {
        AppThemePreference.amber => buildVoxelithAmberTheme(),
        AppThemePreference.legendary => buildVoxelithLegendaryTheme(),
        AppThemePreference.legendaryLight => buildVoxelithLegendaryLightTheme(),
        _ => EditorialTheme.light,
      },
      darkTheme: themePreference == AppThemePreference.legendary
          ? buildVoxelithLegendaryTheme()
          : buildVoxelithDarkTheme(),
      themeMode: switch (themePreference) {
        AppThemePreference.system => ThemeMode.system,
        AppThemePreference.light => ThemeMode.light,
        AppThemePreference.dark => ThemeMode.dark,
        AppThemePreference.amber => ThemeMode.light,
        AppThemePreference.legendary => ThemeMode.dark,
        AppThemePreference.legendaryLight => ThemeMode.light,
      },
      routerConfig: router,
    );
  }
}
