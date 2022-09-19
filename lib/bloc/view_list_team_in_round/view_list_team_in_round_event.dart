class ViewListTeamInRoundEvent {}

//LoadMore
class IncrementalEvent extends ViewListTeamInRoundEvent {}

class RefreshEvent extends ViewListTeamInRoundEvent {}

class LoadAddMoreEvent extends ViewListTeamInRoundEvent {}

//recieve data
class ReceiveDataEvent extends ViewListTeamInRoundEvent {
  int roundId;
  ReceiveDataEvent({required this.roundId});
}

class LoadingEvent extends ViewListTeamInRoundEvent {}

class ViewListTeamInitEvent extends ViewListTeamInRoundEvent {}
