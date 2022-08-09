import '../../models/enums/competition_scope_status.dart';

class ViewListCompetitionParticipantEvent {}

class LoadListCompetitionParticipantEvent
    extends ViewListCompetitionParticipantEvent {}

//LoadMore
class IncrementalEvent extends ViewListCompetitionParticipantEvent {}

class RefreshEvent extends ViewListCompetitionParticipantEvent {}

class LoadAddMoreEvent extends ViewListCompetitionParticipantEvent {}

//ChangeName
class ChangeSearchNameEvent extends ViewListCompetitionParticipantEvent {
  String? searchName;
  ChangeSearchNameEvent({required this.searchName});
}

//Chang Competition Scope
class ChangeCompetitionScopeEvent extends ViewListCompetitionParticipantEvent {
  CompetitionScopeStatus? scope;
  ChangeCompetitionScopeEvent({required this.scope});
}

//Search Event
class SearchEvent extends ViewListCompetitionParticipantEvent {}

//Reset Filter
class ResetFilterEvent extends ViewListCompetitionParticipantEvent {}
