import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

SystemUiOverlayStyle coBuySystemUiOverlayStyle(Brightness backgroundBrightness) {
  final Brightness iconBrightness = backgroundBrightness == Brightness.light
      ? Brightness.dark
      : Brightness.light;

  return SystemUiOverlayStyle(
    // Status bar
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: iconBrightness, // Android
    statusBarBrightness: backgroundBrightness, // iOS
    // System navigation bar
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: iconBrightness,
    systemNavigationBarContrastEnforced: false,
  );
}
