import 'package:equatable/equatable.dart';

import '../../models/entities/competition/competition_detail_model.dart';
import '../../models/entities/competition/competition_model.dart';

class CompetitionDetailState extends Equatable {
  CompetitionDetailModel? competitionDetail;

  bool? isParticipant;
  bool? isSuccess = false;

  CompetitionDetailState({this.competitionDetail, this.isParticipant, this.isSuccess});

  CompetitionDetailState copyWith(
      {CompetitionDetailModel? competitionDetail,
      bool? isParticipant,
      bool? isSuccess,
      List<CompetitionModel>? listCompetitionBelongToCurrentUser}) {
    return CompetitionDetailState(
      competitionDetail: competitionDetail,
      isParticipant: isParticipant,
      isSuccess: isSuccess
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [competitionDetail, isParticipant, isSuccess];
}
