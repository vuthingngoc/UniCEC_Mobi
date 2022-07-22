import 'package:equatable/equatable.dart';
import 'package:unicec_mobi/models/entities/competition/competition_model.dart';

import '../../models/entities/competition/competition_detail_model.dart';
import '../../screens/detail_competition/detail_competition.dart';

class DetailCompetitionState extends Equatable{
  CompetitionDetailModel detailCompetition;

  DetailCompetitionState({required this.detailCompetition});

  @override
  // TODO: implement props
  List<Object?> get props => [detailCompetition];

}