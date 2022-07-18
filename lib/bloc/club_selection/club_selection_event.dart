class ClubSelectionEvent {}

class ChooseClubSelectionEvent extends ClubSelectionEvent {
  final int clubIdSelected;
  ChooseClubSelectionEvent({required this.clubIdSelected});
}

class NavigatorClubPageEvent extends ClubSelectionEvent {}
