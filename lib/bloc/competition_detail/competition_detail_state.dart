import 'package:equatable/equatable.dart';

import '../../models/entities/competition/competition_detail_model.dart';

class CompetitionDetailState extends Equatable{
  CompetitionDetailModel? competitionDetail;

  CompetitionDetailState({this.competitionDetail});

  CompetitionDetailState copyWith({CompetitionDetailModel? competitionDetail}){
    return CompetitionDetailState(competitionDetail: competitionDetail);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [competitionDetail];

}