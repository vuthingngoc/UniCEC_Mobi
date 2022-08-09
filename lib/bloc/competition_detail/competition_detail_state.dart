import 'package:equatable/equatable.dart';

import '../../models/entities/competition/competition_detail_model.dart';
import '../../models/entities/competition/competition_model.dart';

class CompetitionDetailState extends Equatable {
  CompetitionDetailModel? competitionDetail;
  bool? isParticipant;

  CompetitionDetailState({this.competitionDetail, this.isParticipant});

  CompetitionDetailState copyWith(
      {CompetitionDetailModel? competitionDetail,
      bool? isParticipant,
      bool? isSuccess,
      List<CompetitionModel>? listCompetitionBelongToCurrentUser}) {
    return CompetitionDetailState(
      competitionDetail: competitionDetail,
      isParticipant: isParticipant
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [competitionDetail, isParticipant];
}
