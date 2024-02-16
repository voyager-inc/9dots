import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ninedots/presentation/pages/initializations/policy_terms/presentation/state/policy_terms_notifier.dart';

final policyTermsStateProvider =
StateNotifierProvider.family<PolicyTermsNotifier, AsyncValue<bool>, String>(
      (_, url) => PolicyTermsNotifier(url),
);