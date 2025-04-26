import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:geography_game/shared/services/logger.dart';

class ErrorHandler {
  static void init() {
    // 1. Catch Flutter framework errors
    FlutterError.onError = (FlutterErrorDetails details) {
      Logger.i.e(
        'Flutter framework error',
        error: details.exception,
        stackTrace: details.stack,
      );
      FlutterError.dumpErrorToConsole(details);
    };

    // 2. Catch uncaught async errors
    runZonedGuarded<Future<void>>(
      () async {
        // no-op: main() continues after init()
      },
      (error, stack) {
        Logger.i.e(
          'Uncaught async error',
          error: error,
          stackTrace: stack,
        );
      },
    );

    // 3. Catch platform‐level errors
    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      Logger.i.e(
        'PlatformDispatcher error',
        error: error,
        stackTrace: stack,
      );
      return true;
    };
  }
}