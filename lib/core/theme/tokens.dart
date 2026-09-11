import 'package:flutter/material.dart';

/// VOXELITH Tema Tokenleri — Duolingo/Drops tarzı canlı, oyunsu, samimi
class VoxelithTokens {
  VoxelithTokens._();

  // Editorial Calm: isolated palette; existing themes retain their tokens.
  static const editorialPaper = Color(0xFFF7F3EC);
  static const editorialInk = Color(0xFF2B2620);
  static const editorialMuted = Color(0xFF71665A);
  static const editorialLine = Color(0xFFD9CFC1);
  static const editorialAccent = Color(0xFFA24E30);
  static const editorialAccentLight = Color(0xFFE08A63);
  static const editorialOnAccent = editorialInk;
  static const editorialTransparent = Color(0x00000000);
  static const editorialSerif = 'IBMPlexSerif';
  static const editorialSans = 'IBMPlexSans';
  static const editorialArabic = 'IBMPlexSansArabic';
  // Dark ink over the pale end keeps small CTA text legible.
  // The dark accent remains a narrow edge so it never sits behind the label.
  static const editorialCtaGradient = LinearGradient(
    colors: [editorialAccentLight, editorialAccentLight, editorialAccent],
    stops: [0, 0.86, 1],
  );

  // Arka plan
  static const background = Color(0xFFF7F7F7);
  static const surface = Colors.white;

  // Ana renkler
  static const primary = Color(0xFF58CC02); // Yeşil — başarı, devam
  static const primaryDark = Color(0xFF46A302);
  static const accent = Color(0xFF1CB0F6); // Mavi — bilgi, AI
  static const accentDark = Color(0xFF158DD0);
  static const danger = Color(0xFFFF4B4B); // Kırmızı — hata, kalp
  static const gold = Color(0xFFFFC800); // Altın — ödül, streak, çark
  static const goldDark = Color(0xFFDBA800);
  static const purple = Color(0xFF9B72CF); // Mor — premium

  // Metin
  static const textPrimary = Color(0xFF3C3C3C);
  static const textSecondary = Color(0xFF777777);
  static const textOnPrimary = Colors.white;

  // Gradient
  static const heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1CB0F6), Color(0xFF58CC02)],
  );

  // Radius
  static const radiusSmall = 14.0;
  static const radiusMedium = 24.0;
  static const radiusLarge = 32.0;
  static const radiusPill = 999.0;

  // Spacing
  static const padSmall = 8.0;
  static const pad = 16.0;
  static const padLarge = 24.0;

  // Shadow — iki katman: yakın/keskin + geniş/yumuşak, tek düz gölgeden
  // daha "tasarlanmış" bir derinlik hissi verir.
  static List<BoxShadow> get softShadow => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.045),
      blurRadius: 3,
      offset: const Offset(0, 1),
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.09),
      blurRadius: 20,
      offset: const Offset(0, 10),
    ),
  ];

  // Renkli/tonlu gölge — CTA'lar ve öne çıkan kartlar için marka rengine
  // boyalı, düz siyah gölgeden daha "premium" hissettiren varyant.
  static List<BoxShadow> tintedShadow(Color color, {double opacity = 0.28}) => [
    BoxShadow(
      color: color.withValues(alpha: opacity),
      blurRadius: 24,
      offset: const Offset(0, 12),
    ),
  ];

  // Eski isimlerin uyumluluğu — mevcut kod kırılmasın
  static const mint = primary;
  static const mintDark = primaryDark;
  static const mintLight = Color(0xFFD4F5D0);
  static const coral = danger;
  static const peach = gold;
  static const sunflower = gold;
  static const lavender = purple;
  static const sky = accent;
  static const snow = background;
  static const cloud = Color(0xFFF0F0F3);
  static const fog = Color(0xFFE8E8ED);
  static const ink = textPrimary;
  static const muted = textSecondary;
  // Eskiden 0xFFB2BEC3 idi — beyaz zeminde ~1.9:1 kontrast (WCAG AA'nın
  // gerektirdiği 4.5:1'in çok altında), gövde metni/placeholder olarak
  // kullanıldığında okunmuyordu. Aynı "yumuşak" ton karakterini korurken
  // ~4.7:1 kontrasta çıkarıldı.
  static const soft = Color(0xFF70787F);
  // Etkinlik kartındaki pembe ton (home_screen.dart) daha önce token'sız,
  // satır içi bir renkti — burada isimlendirilerek tutarlı hale getirildi.
  static const eventTint = Color(0xFFF5E8E5);
  static const terr = danger;
  static const terrSoft = gold;
  static const line = fog;
  static const pale = mintLight;
  static const card = surface;
  static const cream = background;
  static const cream2 = cloud;
  static const forest = primaryDark;
  static const forestMid = primaryDark;
  static const white = Colors.white;
  static const radius = radiusMedium;
  static const radiusSm = radiusSmall;
  static const radiusLg = radiusLarge;
}

// Voxelith alias — eski kodla uyum
typedef Voxelith = VoxelithTokens;
