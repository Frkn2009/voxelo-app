/// VOXELITH — Supabase bağlantı bilgileri.
///
/// Değerler artık koda gömülmüyor; build/run sırasında --dart-define ile
/// verilir, örn:
///   flutter run --dart-define=SUPABASE_URL=https://xxx.supabase.co \
///     --dart-define=SUPABASE_PUBLISHABLE_KEY=sb_publishable_xxx
///
/// Verilmezse uygulama eskisi gibi tamamen yerel çalışır, hiçbir şey
/// bozulmaz. Verilince bulut senkronu otomatik açılır.
class SupaConfig {
  static const String url = String.fromEnvironment('SUPABASE_URL');
  static const String publishableKey =
      String.fromEnvironment('SUPABASE_PUBLISHABLE_KEY');

  /// Anahtarlar girildi mi? (yeni sb_ veya eski eyJ formatı)
  static bool get isSet =>
      url.startsWith('https://') &&
      (publishableKey.startsWith('sb_') || publishableKey.startsWith('eyJ'));
}
