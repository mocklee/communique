import 'package:communique/landing/business/repFocusUpdater.dart';
import 'package:flutter/material.dart';

// Contains focus nodes for introCard
// nextWidgetFocus hands off to repCard
class IntroFocusUpdater {
  FocusNode nameFocus;
  FocusNode locationFocus;
  FocusNode saveFocus;

  final _nextWidgetFocus = RepFocusUpdater();

  // for init of repCard nodes on load
  void introInit() {
    nameFocus = FocusNode();
    locationFocus = FocusNode();
    saveFocus = FocusNode();
  }

  void introDispose() {
    nameFocus.dispose();
    locationFocus.dispose();
    saveFocus.dispose();
  }

  FocusNode nextWidgetFocus() {
    return _nextWidgetFocus.searchFocus;
  }
}
