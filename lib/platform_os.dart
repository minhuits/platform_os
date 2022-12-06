library platform_os;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

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
  ///
  /// [themeData]는 현재 플랫폼을 기준으로 [ThemeData] 객체를 반환하는 함수입니다.
  ///
  /// Args:
  ///
  ///   android ([ThemeData]): [Android]용 [ThemeData]입니다.
  ///
  ///   iOS ([ThemeData]): [iOS]용 [ThemeData]입니다..
  ///
  ///   macOS ([MacosThemeData]): [macOS]용 [MacosThemeData]입니다.
  ///
  ///   windows ([ThemeData]): [Windows]용 [ThemeData]입니다.
  ///
  ///   linux ([ThemeData]): [Linux]용 [ThemeData]입니다.
  ///
  ///   fuchsia ([ThemeData]): [Fuchsia]용 [ThemeData]입니다.
  ///
  ///   web  ([ThemeData]): [Web]용 [ThemeData]입니다.
  ///
  /// Returns:
  ///   [TargetPlatform]을 가져와 [ThemeData]를 반환하는 함수입니다.
  ///
  ///
  ///
  /// [English]
  ///
  /// [themeData] is a function that returns a [ThemeData] object based on the
  /// current platform
  ///
  /// Args:
  ///   android ([ThemeData]): [ThemeData] for [Android].
  ///
  ///   iOS ([ThemeData]): [ThemeData] for [iOS].
  ///
  ///   macOS ([MacosThemeData]): [MacosThemeData] for [macOS].
  ///
  ///   windows ([ThemeData]): [ThemeData] for [Windows].
  ///
  ///   linux ([ThemeData]):  [ThemeData] for [Linux].
  ///
  ///   fuchsia ([ThemeData]):  [ThemeData] for [Fuchsia].
  ///
  ///   web ([ThemeData]):  [ThemeData] for [Web].
  ///
  /// Returns:
  ///   A function that takes a [TargetPlatform] and returns a [ThemeData].
  ///
  static themeData({
    ThemeData? android,
    ThemeData? iOS,
    ThemeData? fuchsia,
    MacosThemeData? macOS,
    ThemeData? windows,
    ThemeData? linux,
    ThemeData? web,
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
    ThemeData? android,
    ThemeData? iOS,
    ThemeData? fuchsia,
    MacosThemeData? macOS,
    ThemeData? windows,
    ThemeData? linux,
    ThemeData? web,
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
