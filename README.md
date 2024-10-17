# Flutter Advanced Logger

## Description

Flutter Advanced Logger is a powerful and flexible logging utility designed to enhance debugging and error tracking in Flutter applications. It provides detailed context for each log entry, including file names and line numbers, making it easier to trace the origin of messages in your codebase.

## Features

- **File and Line Information**: Automatically includes the source file name and line number for each log entry.
- **Custom Tagging**: Allows adding custom tags to log messages for better categorization.
- **Error and Stack Trace Support**: Can include error objects and stack traces in log entries.
- **Truncation**: Automatically truncates long messages to prevent console flooding.
- **Developer Mode Compatibility**: Uses `dart:developer` for improved performance and integration with Flutter's developer tools.

## Why We Created This

Debugging complex Flutter applications can be challenging, especially when dealing with asynchronous operations and deep widget trees. Standard `print` statements often lack context, making it difficult to trace issues to their source. We created this logger to:

1. Provide more context for each log message.
2. Make it easier to filter and search through log output.
3. Improve the debugging experience for Flutter developers.
4. Offer a flexible logging solution that can grow with your project's needs.

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_advanced_logger: ^1.0.0
```

## Usage

Here are some examples of how to use the Flutter Advanced Logger:

```dart
import 'package:flutter_advanced_logger/flutter_advanced_logger.dart';

// Basic usage
Log.d('This is a debug message');

// With a tag
Log.d('User logged in successfully', tag: 'AUTH');

// With an error and stack trace
try {
  // Some code that might throw an error
} catch (e, stackTrace) {
  Log.d('An error occurred', error: e, stackTrace: stackTrace);
}

// Using the simplified log function
log('This uses the developer.log directly');
```

## Output Example

```
[main.dart:42] This is a debug message
[auth_service.dart:15] [AUTH] User logged in successfully
[api_client.dart:78] An error occurred
  Error: HTTP connection failed
  #0 ApiClient.makeRequest (package:my_app/api_client.dart:76:3)
  #1 LoginScreen.attemptLogin (package:my_app/screens/login_screen.dart:25:5)
  ...
```

## Contributing

We welcome contributions to the Flutter Advanced Logger! Please feel free to submit issues, feature requests, or pull requests.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
