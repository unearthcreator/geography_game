// lib/shared/services/logger.dart

import 'package:logger/logger.dart' as pkg_logger;

/// A simple global logger wrapper.
/// 
/// Call `Logger.init()` once (e.g. in main.dart),
/// then use `Logger.i` everywhere.
class Logger {
  static late pkg_logger.Logger i;

  /// Initialize the underlying logger.
  static void init() {
    i = pkg_logger.Logger(
      printer: pkg_logger.PrettyPrinter(
        methodCount: 2,       // number of stack frames to show
        errorMethodCount: 8,  // stack frames for errors
        lineLength: 80,
        colors: true,
        printEmojis: true,
        printTime: false,
      ),
    );
  }
}