import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ContentType {
  ContentType(this.message, [this.color]);

  final String message;

  final Color? color;

  static ContentType help =
      ContentType('help', ColorTheme.secondaryContainerColor);
  static ContentType failure = ContentType('failure', ColorTheme.failureRed);
  static ContentType success =
      ContentType('success', ColorTheme.mainGreenColor);
  static ContentType warning = ContentType('warning', ColorTheme.warningYellow);
}
