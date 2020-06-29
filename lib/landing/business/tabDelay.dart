/* Introduces a tick in-between tab keypresses so tab navigation 
   isn't disrupted by pressing down the tab key too long
*/
class TabDelay {
  final Duration tabDelay = Duration(milliseconds: 100);
  bool tabbedRecently = false;

  void haveTabbedRecently() {
    Future.delayed(tabDelay, () => tabbedRecently = false);
  }
}
