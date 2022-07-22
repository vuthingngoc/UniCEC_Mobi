class MainEvent{}

class SwitchingPageEvent extends MainEvent{
  int pageIndex;

  SwitchingPageEvent({required this.pageIndex});
}

class HidingFloatingActionButtonEvent extends MainEvent{}

class ShowingFloatingActionButtonEvent extends MainEvent{}