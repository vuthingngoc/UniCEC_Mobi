import '../../models/enums/competition_scope_status.dart';

class CompetitionEvent {}

class LoadOutStandingCompetitionEvent extends CompetitionEvent {}

class LoadCompetitionEvent extends CompetitionEvent {}

class SelectACompetitionEvent extends CompetitionEvent {
  final int competitionId;
  SelectACompetitionEvent({required this.competitionId});
}

//---------------------------------TA
//ChangeName
class ChangeSearchNameEvent extends CompetitionEvent {
  String? searchName;
  ChangeSearchNameEvent({required this.searchName});
}

//Chang Competition Scope
class ChangeCompetitionScopeEvent extends CompetitionEvent {
  CompetitionScopeStatus? scope;
  ChangeCompetitionScopeEvent({required this.scope});
}

//Search Event
class SearchEvent extends CompetitionEvent {}

//Reset Filter
class ResetFilterEvent extends CompetitionEvent {}

//LoadMore
class IncrementalEvent extends CompetitionEvent {}

class RefreshEvent extends CompetitionEvent {}

class LoadAddMoreEvent extends CompetitionEvent {}

class LoadRefreshEvent extends CompetitionEvent {}
