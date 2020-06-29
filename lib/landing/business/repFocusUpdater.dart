import 'package:flutter/material.dart';

class RepFocusUpdater {
  FocusNode cityFocus;
  FocusNode countyFocus;
  FocusNode stateFocus;
  FocusNode federalFocus;
  FocusNode locationFocus;
  FocusNode searchFocus;

  final _nextWidgetFocus; // TODO: continue tab focus direction left-to-right

  // for init of repCard nodes on load
  void repInit() {
    cityFocus = FocusNode();
    countyFocus = FocusNode();
    stateFocus = FocusNode();
    federalFocus = FocusNode();
    locationFocus = FocusNode();
    searchFocus = FocusNode();
  }

  // for disposing repCard nodes on removal
  void repDispose() {
    cityFocus.dispose();
    countyFocus.dispose();
    stateFocus.dispose();
    federalFocus.dispose();
    locationFocus.dispose();
    searchFocus.dispose();
  }

  FocusNode nextWidgetFocus() {
    return _nextWidgetFocus.cityFocus;
  }
}
