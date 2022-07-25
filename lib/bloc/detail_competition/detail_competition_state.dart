import 'package:equatable/equatable.dart';

import '../../models/entities/competition/competition_detail_model.dart';

class DetailCompetitionState extends Equatable{
  CompetitionDetailModel detailCompetition;

  DetailCompetitionState({required this.detailCompetition});

  @override
  // TODO: implement props
  List<Object?> get props => [detailCompetition];

}