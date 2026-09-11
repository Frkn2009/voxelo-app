#!/usr/bin/env bash
set -e

: "${SUPABASE_URL:?SUPABASE_URL ortam değişkeni gerekli (Supabase Dashboard -> Project Settings -> API -> Project URL)}"
: "${SUPABASE_PUBLISHABLE_KEY:?SUPABASE_PUBLISHABLE_KEY ortam değişkeni gerekli (Supabase Dashboard -> Project Settings -> API -> publishable key)}"
: "${VOXELO_REVENUECAT_API_KEY:?VOXELO_REVENUECAT_API_KEY ortam değişkeni gerekli (RevenueCat panelinden alınır) - bu olmadan gerçek satın alma çalışmaz, uygulama sahte (fake) billing'e düşer}"

DART_DEFINES=(
  --dart-define=SUPABASE_URL="$SUPABASE_URL"
  --dart-define=SUPABASE_PUBLISHABLE_KEY="$SUPABASE_PUBLISHABLE_KEY"
  --dart-define=VOXELO_REVENUECAT_API_KEY="$VOXELO_REVENUECAT_API_KEY"
)

echo "==> Formatting"
dart format .

echo "==> Analyzing"
flutter analyze

echo "==> Running tests"
flutter test

echo "==> Building AAB"
flutter build appbundle --release "${DART_DEFINES[@]}"

echo "==> Building APK"
flutter build apk --release --no-tree-shake-icons "${DART_DEFINES[@]}"

echo "==> Done"
ls -lh build/app/outputs/flutter-apk/*.apk
ls -lh build/app/outputs/bundle/release/*.aab
