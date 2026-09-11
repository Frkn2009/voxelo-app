import 'package:flutter/material.dart';

import 'tokens.dart';

/// Opt-in light theme. Font files are bundled; no runtime font download.
class EditorialTheme {
  EditorialTheme._();

  static ThemeData get light {
    final scheme =
        ColorScheme.fromSeed(
          seedColor: VoxelithTokens.editorialAccent,
          brightness: Brightness.light,
        ).copyWith(
          primary: VoxelithTokens.editorialAccent,
          onPrimary: VoxelithTokens.editorialPaper,
          secondary: VoxelithTokens.editorialAccent,
          onSecondary: VoxelithTokens.editorialPaper,
          surface: VoxelithTokens.editorialPaper,
          onSurface: VoxelithTokens.editorialInk,
          onSurfaceVariant: VoxelithTokens.editorialMuted,
          outline: VoxelithTokens.editorialMuted,
          outlineVariant: VoxelithTokens.editorialLine,
          error: VoxelithTokens.danger,
        );
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: VoxelithTokens.editorialPaper,
      fontFamily: VoxelithTokens.editorialSans,
      fontFamilyFallback: const [
        VoxelithTokens.editorialArabic,
        VoxelithTokens.editorialDevanagari,
        VoxelithTokens.editorialThai,
      ],
    );
    TextStyle heading(double size) => TextStyle(
      fontFamily: VoxelithTokens.editorialSerif,
      fontFamilyFallback: const [
        VoxelithTokens.editorialArabic,
        VoxelithTokens.editorialDevanagari,
        VoxelithTokens.editorialThai,
      ],
      fontSize: size,
      height: 1.15,
      fontWeight: FontWeight.w600,
      color: VoxelithTokens.editorialInk,
    );
    return base.copyWith(
      textTheme: base.textTheme.copyWith(
        displaySmall: heading(38),
        headlineLarge: heading(32),
        headlineMedium: heading(28),
        titleLarge: heading(23),
        bodyLarge: base.textTheme.bodyLarge?.copyWith(height: 1.55),
        bodyMedium: base.textTheme.bodyMedium?.copyWith(height: 1.5),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: VoxelithTokens.editorialPaper,
        foregroundColor: VoxelithTokens.editorialInk,
        surfaceTintColor: VoxelithTokens.editorialTransparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      dividerTheme: const DividerThemeData(
        color: VoxelithTokens.editorialLine,
        thickness: 1,
        space: 32,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(VoxelithTokens.radiusSmall),
          borderSide: const BorderSide(color: VoxelithTokens.editorialLine),
        ),
        contentPadding: const EdgeInsets.all(VoxelithTokens.pad),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: VoxelithTokens.editorialAccent,
        linearTrackColor: VoxelithTokens.editorialLine,
      ),
    );
  }
}
