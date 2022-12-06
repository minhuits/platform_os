library platform_os;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// [Korean]
///
/// [PlatformOS]는 플랫폼(android, ios, fuchsia, linux, macos, windows, web)에
/// 따라 [widget]을 반환합니다.
///
/// [English]
///
/// [PlatformOS] returns [widget] depending on
/// the platform(android, ios, fuchsia, linux, macos, windows, web).
///
class PlatformOS extends StatelessWidget {
  const PlatformOS({
    Key? key,
    this.android,
    this.iOS,
    this.fuchsia,
    this.linux,
    this.macOS,
    this.windows,
    this.web,
  }) : super(key: key);

  final Widget? android;
  final Widget? iOS;
  final Widget? fuchsia;
  final Widget? macOS;
  final Widget? windows;
  final Widget? linux;
  final Widget? web;

  /// [Korean]
  ///
  /// 플랫폼에 따라 [Widget]을 반환합니다.
  ///
  /// Args:
  ///   platform ([TargetPlatform]): [Widget]이 빌드되는 플랫폼입니다.
  ///
  /// Returns:
  ///   platformMap[platform]!
  ///
  /// [English]
  ///
  /// It returns a [widget] based on the platform.
  ///
  /// Args:
  ///   platform ([TargetPlatform]): The platform that the widget is being built for.
  ///
  /// Returns:
  ///   The platformMap[platform]!;
  ///
  Widget targetPlatforms(TargetPlatform platform) {
    final platformMap = {
      TargetPlatform.android: android,
      TargetPlatform.iOS: iOS,
      TargetPlatform.fuchsia: fuchsia,
      TargetPlatform.linux: linux,
      TargetPlatform.macOS: macOS,
      TargetPlatform.windows: windows,
    };
    return platformMap[platform]!;
  }

  /// [Korean]
  /// 플랫폼을 기반으로 [themeData]를 반환하는 함수.
  ///
  /// [English]
  /// A function that returns a [themeData] based on the platform.
  ///
  static themeData({
    Diagnosticable? android,
    Diagnosticable? iOS,
    Diagnosticable? fuchsia,
    Diagnosticable? macOS,
    Diagnosticable? windows,
    Diagnosticable? linux,
    Diagnosticable? web,
  }) {
    return _themeMaps(
      platform: defaultTargetPlatform,
      android: android,
      iOS: iOS,
      fuchsia: fuchsia,
      macOS: macOS,
      windows: windows,
      linux: linux,
      web: web,
    );
  }

  static Diagnosticable _themeMaps({
    required TargetPlatform platform,
    Diagnosticable? android,
    Diagnosticable? iOS,
    Diagnosticable? fuchsia,
    Diagnosticable? macOS,
    Diagnosticable? windows,
    Diagnosticable? linux,
    Diagnosticable? web,
  }) {
    if (kIsWeb) return web!;

    final themeMaps = {
      TargetPlatform.android: android,
      TargetPlatform.iOS: iOS,
      TargetPlatform.fuchsia: fuchsia,
      TargetPlatform.linux: linux,
      TargetPlatform.macOS: macOS,
      TargetPlatform.windows: windows,
    };

    return themeMaps[platform]!;
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) return web!;

    return targetPlatforms(defaultTargetPlatform);
  }
}
