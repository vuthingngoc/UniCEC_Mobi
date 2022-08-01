class ViewCompetitionActivityEvent {}

//init event
class ViewCompetitionActivityInitEvent extends ViewCompetitionActivityEvent {}

//recieve data
class RecieveDataEvent extends ViewCompetitionActivityEvent {
  final int competitionId;
  RecieveDataEvent({required this.competitionId});
}

//LoadMore
class IncrementalEvent extends ViewCompetitionActivityEvent {}

class RefreshEvent extends ViewCompetitionActivityEvent {}

class LoadAddMoreEvent extends ViewCompetitionActivityEvent {}
