import 'dart:developer' as developer;

class Log {
  // This function limits the output to the first
  // 800 characters to avoid flooding the console
  static void d(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    final stack = StackTrace.current;
    final frames = stack.toString().split('\n');
    final frame = frames[1]; // The calling method is usually the second frame

    // Extract file name and line number
    final fileInfo =
        frame.substring(frame.indexOf('(') + 1, frame.indexOf(')'));
    final parts = fileInfo.split(':');
    final fileName = parts[0].split('/').last;
    final lineNumber = parts[1];

    final output =
        '[$fileName:$lineNumber] ${tag != null ? '[$tag] ' : ''}$message';

    // Truncate the output if it's too long
    final truncatedOutput =
        output.length > 800 ? '${output.substring(0, 2000)}...' : output;

    developer.log(
      truncatedOutput,
      stackTrace: stackTrace,
      error: error,
    );
  }
}

/// this call to log with work same as developer.log
/// Instead of Using log from dev library, we can use developer.log directly
void log(
  String message, {
  String? tag,
  Object? error,
  StackTrace? stackTrace,
}) {
  developer.log(message, error: error, stackTrace: stackTrace);
}
