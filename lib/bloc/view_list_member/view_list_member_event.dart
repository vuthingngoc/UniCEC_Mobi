class ViewListMemberEvent {}

class LoadListMemberEvent extends ViewListMemberEvent {}

//ChangeName
class ChangeSearchNameEvent extends ViewListMemberEvent {
  String? searchName;
  ChangeSearchNameEvent({required this.searchName});
}

//ChangeRoleId
class ChangeClubRoleIdEvent extends ViewListMemberEvent {
  int? clubRoleId;
  ChangeClubRoleIdEvent({required this.clubRoleId});
}

//Search Filter
class SearchEvent extends ViewListMemberEvent {}

//Reset Filter
class ResetFilterEvent extends ViewListMemberEvent {}
