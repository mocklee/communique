import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class FocusUpdater extends ChangeNotifier {
  // public
  FocusNode currentFocus;
  FocusNode nextFocus;

  void updateCurrentFocus(FocusNode newFocus) {
    currentFocus = newFocus;
    notifyListeners();
  }

  void updateNextFocus(FocusNode futureFocus) {
    nextFocus = futureFocus;
    notifyListeners();
  }
}
