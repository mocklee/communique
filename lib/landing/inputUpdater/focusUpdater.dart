import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class FocusUpdater extends ChangeNotifier {
  // public
  FocusNode currentFocus;

  void updateFocus(FocusNode newFocus) {
    currentFocus = newFocus;
    notifyListeners();
  }
}
