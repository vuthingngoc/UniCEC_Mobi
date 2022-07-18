class ClubEvent {}

//Navigator to Club Selection page
class NavigatorClubSelectionPage extends ClubEvent {}

class ShowingSnackBarEvent extends ClubEvent {
  final String message;

  ShowingSnackBarEvent({required this.message});
}
