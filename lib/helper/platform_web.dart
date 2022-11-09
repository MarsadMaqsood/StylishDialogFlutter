// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html';

String get operatingSystem {
  final s = window.navigator.userAgent.toLowerCase();
  if (s.contains('android')) return 'android';

  if (s.contains('iphone') ||
      s.contains('ipad') ||
      s.contains('ipod') ||
      s.contains('watch os')) return 'ios';

  if (s.contains('mac os')) return 'macos';

  if (s.contains('fuchsia')) return 'fuchsia';

  if (s.contains('linux') || s.contains('cros') || s.contains('chromebook')) {
    return 'linux';
  }

  if (s.contains('windows')) return 'windows';

  return '';
}

bool get isAndroid => operatingSystem == 'android';
bool get isFuchsia => operatingSystem == 'fuchsia';
bool get isIOS => operatingSystem == 'ios';
bool get isMacOS => operatingSystem == 'macos';
bool get isWindows => operatingSystem == 'windows';
bool get isLinux => operatingSystem == 'linux';
