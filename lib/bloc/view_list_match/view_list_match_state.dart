import 'package:equatable/equatable.dart';

import '../../models/entities/match/match_model.dart';

class ViewListMatchState extends Equatable{
  List<MatchModel>? matches;

  ViewListMatchState({this.matches});  

  @override
  // TODO: implement props
  List<Object?> get props => [matches];

}