import 'package:equatable/equatable.dart';
import 'package:unicec_mobi/models/entities/match/match_model.dart';

import '../../models/entities/match/teams_in_match_model.dart';

class ViewDetailMatchState extends Equatable{
  MatchModel match;
  List<TeamsInMatchModel> teamsInMatch;

  ViewDetailMatchState({required this.match, required this.teamsInMatch});

  @override
  // TODO: implement props
  List<Object?> get props => [match];

}