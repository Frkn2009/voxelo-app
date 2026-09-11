import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'tokens.dart';

/// Başlıklarda Sora (karakterli, geometrik), gövde metinde Manrope
/// (okunaklı, sıcak) — sistem fontu "Inter" hissini kesen premium çift.
/// İkisi de assets/fonts altında paketlenir; google_fonts'un çalışma
/// zamanında internetten font indirmesi offline-first mimariyi bozuyordu.
TextStyle voxelithDisplay({
  required FontWeight fontWeight,
  required double fontSize,
  double? height,
  double? letterSpacing,
  Color? color,
}) => TextStyle(
  fontFamily: 'Sora',
  fontWeight: fontWeight,
  fontSize: fontSize,
  height: height,
  letterSpacing: letterSpacing,
  color: color,
);

TextStyle voxelithBody({
  required FontWeight fontWeight,
  required double fontSize,
  double? height,
  double? letterSpacing,
  Color? color,
}) => TextStyle(
  fontFamily: 'Manrope',
  fontWeight: fontWeight,
  fontSize: fontSize,
  height: height,
  letterSpacing: letterSpacing,
  color: color,
);

ThemeData buildVoxelithTheme() {
  final text = TextTheme(
    displayLarge: voxelithDisplay(
      fontWeight: FontWeight.w700,
      fontSize: 34,
      height: 1.12,
      letterSpacing: -1,
      color: Voxelith.ink,
    ),
    displayMedium: voxelithDisplay(
      fontWeight: FontWeight.w700,
      fontSize: 28,
      height: 1.16,
      letterSpacing: -.6,
      color: Voxelith.ink,
    ),
    headlineMedium: voxelithDisplay(
      fontWeight: FontWeight.w600,
      fontSize: 22,
      height: 1.25,
      letterSpacing: -.25,
      color: Voxelith.ink,
    ),
    titleLarge: voxelithDisplay(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      height: 1.3,
      color: Voxelith.ink,
    ),
    titleMedium: voxelithBody(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      height: 1.35,
      color: Voxelith.ink,
    ),
    bodyLarge: voxelithBody(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 1.5,
      color: Voxelith.ink,
    ),
    bodyMedium: voxelithBody(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 1.5,
      color: Voxelith.muted,
    ),
    labelLarge: voxelithBody(
      fontWeight: FontWeight.w600,
      fontSize: 14,
      letterSpacing: .1,
      color: Colors.white,
    ),
    labelSmall: voxelithBody(
      fontWeight: FontWeight.w600,
      fontSize: 11,
      letterSpacing: .7,
      color: Voxelith.mintDark,
    ),
  );

  const scheme = ColorScheme.light(
    primary: Voxelith.mint,
    onPrimary: Colors.white,
    primaryContainer: Voxelith.mintLight,
    onPrimaryContainer: Voxelith.mintDark,
    secondary: Voxelith.coral,
    onSecondary: Colors.white,
    tertiary: Voxelith.lavender,
    surface: Voxelith.white,
    onSurface: Voxelith.ink,
    surfaceContainerLow: Voxelith.snow,
    surfaceContainer: Voxelith.cloud,
    outline: Voxelith.fog,
    outlineVariant: Voxelith.fog,
    error: Color(0xFFB4453C),
  );

  const pillShape = StadiumBorder();

  return ThemeData(
    useMaterial3: true,
    fontFamily: 'Manrope',
    // Manrope/Sora yalnızca Latin/Kiril/Yunan kapsar — Arapça, Hintçe ve
    // Tayca ders içeriği bu üç fallback olmadan boş kutucuk (tofu)
    // gösterebilir. Aynı düzeltme editorial_theme.dart'ta da var.
    fontFamilyFallback: const [
      VoxelithTokens.editorialArabic,
      VoxelithTokens.editorialDevanagari,
      VoxelithTokens.editorialThai,
    ],
    scaffoldBackgroundColor: Voxelith.snow,
    colorScheme: scheme,
    textTheme: text,
    visualDensity: VisualDensity.standard,
    splashFactory: InkSparkle.splashFactory,
    appBarTheme: AppBarTheme(
      backgroundColor: Voxelith.snow,
      foregroundColor: Voxelith.ink,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      toolbarHeight: 60,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: voxelithDisplay(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: Voxelith.ink,
      ),
    ),
    cardTheme: CardThemeData(
      color: Voxelith.white,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Voxelith.radius),
        side: const BorderSide(color: Voxelith.fog),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: Voxelith.mintDark,
        foregroundColor: Colors.white,
        disabledBackgroundColor: Voxelith.fog,
        disabledForegroundColor: Voxelith.soft,
        minimumSize: const Size.fromHeight(56),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: pillShape,
        elevation: 3,
        shadowColor: Voxelith.mintDark.withValues(alpha: 0.35),
        textStyle: text.labelLarge,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Voxelith.mintDark,
        minimumSize: const Size.fromHeight(56),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        side: const BorderSide(color: Voxelith.fog, width: 1.5),
        shape: pillShape,
        textStyle: text.labelLarge?.copyWith(color: Voxelith.mintDark),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Voxelith.mintDark,
        shape: pillShape,
        textStyle: voxelithBody(fontWeight: FontWeight.w600, fontSize: 14),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Voxelith.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Voxelith.radius),
        borderSide: const BorderSide(color: Voxelith.fog),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Voxelith.radius),
        borderSide: const BorderSide(color: Voxelith.fog),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Voxelith.radius),
        borderSide: const BorderSide(color: Voxelith.mint, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Voxelith.radius),
        borderSide: const BorderSide(color: Voxelith.coral),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      height: 64,
      elevation: 0,
      backgroundColor: Voxelith.white,
      surfaceTintColor: Colors.transparent,
      indicatorColor: Voxelith.mintLight,
      indicatorShape: pillShape,
      labelTextStyle: WidgetStatePropertyAll(
        voxelithBody(fontWeight: FontWeight.w600, fontSize: 11),
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: Voxelith.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Voxelith.radiusLg),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Voxelith.white,
      surfaceTintColor: Colors.transparent,
      showDragHandle: true,
    ),
    dividerColor: Voxelith.fog,
    dividerTheme: const DividerThemeData(color: Voxelith.fog, thickness: 1),
    chipTheme: ChipThemeData(
      backgroundColor: Voxelith.white,
      selectedColor: Voxelith.mintLight,
      side: const BorderSide(color: Voxelith.fog),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
      labelStyle: voxelithBody(
        color: Voxelith.ink,
        fontWeight: FontWeight.w500,
        fontSize: 13,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Voxelith.radiusSm),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Voxelith.ink,
      contentTextStyle: voxelithBody(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Voxelith.radiusSm),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Voxelith.mint,
      linearTrackColor: Voxelith.fog,
      circularTrackColor: Voxelith.fog,
    ),
  );
}
