class ViewListTeamInRoundEvent {}

//LoadMore
class IncrementalEvent extends ViewListTeamInRoundEvent {}

class RefreshEvent extends ViewListTeamInRoundEvent {}

class LoadAddMoreEvent extends ViewListTeamInRoundEvent {}

//recieve data
class RecieveDataEvent extends ViewListTeamInRoundEvent {
  int roundId;
  RecieveDataEvent({required this.roundId});
}

class LoadingEvent extends ViewListTeamInRoundEvent {}

class ViewListTeamInitEvent extends ViewListTeamInRoundEvent {}
