import 'package:equatable/equatable.dart';
import 'package:unicec_mobi/models/entities/match/match_model.dart';

class ViewDetailMatchState extends Equatable{
  MatchModel match;

  ViewDetailMatchState({required this.match});

  @override
  // TODO: implement props
  List<Object?> get props => [match];

}