

class AppException implements Exception {
  final String? message;
  final int? statusCode;
  final String? identifier;
  final String? which;

  AppException(
      {required this.message,
      required this.statusCode,
      required this.identifier,
      required this.which}) {
        _init();
      }

  void _init() {
    // Add to Firebase Crashlytics.
  }

  @override
  String toString() {
    return 'AppException{message: $message, statusCode: $statusCode, identifier: $identifier, which: $which}';
  }
}
