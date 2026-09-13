import 'package:flutter/foundation.dart';

/// Minimal event logger — projede henüz Firebase/Mixpanel/Amplitude gibi bir
/// analytics SDK'sı yok. Şimdilik olayları debug konsoluna yazar; gerçek bir
/// sağlayıcı eklendiğinde [AnalyticsEvents.log] içindeki gövde o SDK'nın
/// `logEvent` çağrısıyla değiştirilir — çağıran taraflar (onboarding, auth,
/// speak session) değişmez.
class AnalyticsEvents {
  AnalyticsEvents._();

  static void log(String name, [Map<String, Object?> params = const {}]) {
    if (kDebugMode) {
      debugPrint('[analytics] $name ${params.isEmpty ? '' : params}');
    }
  }

  static const onboardingStarted = 'onboarding_started';
  static const onboardingQuestionAnswered = 'onboarding_question_answered';
  static const onboardingCompleted = 'onboarding_completed';
  static const planPreviewViewed = 'plan_preview_viewed';
  static const planDurationAdjusted = 'plan_duration_adjusted';
  static const signupCompleted = 'signup_completed';
  static const firstLessonStarted = 'first_lesson_started';
  static const day1Return = 'day1_return';
}
