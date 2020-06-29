import 'package:flutter/material.dart';

class RepFocusUpdater {
  FocusNode cityFocus;
  FocusNode countyFocus;
  FocusNode stateFocus;
  FocusNode federalFocus;
  FocusNode locationFocus;
  FocusNode searchFocus;

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
}
