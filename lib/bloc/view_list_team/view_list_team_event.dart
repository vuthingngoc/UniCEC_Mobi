class ViewListTeamEvent {}

class ViewListTeamInitEvent {}

//recieve data
class RecieveDataEvent extends ViewListTeamEvent {
  int competitionId;
  RecieveDataEvent({required this.competitionId});
}

//LoadMore
class IncrementalEvent extends ViewListTeamEvent {}

class RefreshEvent extends ViewListTeamEvent {}

class LoadAddMoreEvent extends ViewListTeamEvent {}
