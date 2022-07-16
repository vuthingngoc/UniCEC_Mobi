class ClubEvent {}

//get list club of current user
class GetListClubOfCurrentUser extends ClubEvent {}

//Navigator to Club Selection
class NavigatorClubSelection extends ClubEvent {
  final int clubIdSelection;
  NavigatorClubSelection({required this.clubIdSelection});
}
