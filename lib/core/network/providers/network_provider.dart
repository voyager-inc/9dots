import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ninedots/core/di/di_container.dart';
import 'package:ninedots/core/network/api_client.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  return locator<ApiClient>();
});