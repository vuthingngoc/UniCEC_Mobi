import 'package:equatable/equatable.dart';
import 'package:unicec_mobi/models/entities/competition_activity/competition_activity_detail_model.dart';
import 'package:unicec_mobi/models/enums/competition_activity_status.dart';

class ViewDetailActivityState extends Equatable {
  //load dữ liệu
  CompetitionActivityDetailModel? competitionActivityDetail;
  //chọn status nào và cập nhật
  CompetitionActivityStatus status;

  ViewDetailActivityState(
      {required this.competitionActivityDetail, required this.status});

  ViewDetailActivityState copyWith(
      {required CompetitionActivityDetailModel newCompetitionActivityDetail,
      required CompetitionActivityStatus newStatus}) {
    return ViewDetailActivityState(
        competitionActivityDetail: newCompetitionActivityDetail,
        status: newStatus);
  }

  @override
  List<Object?> get props => [competitionActivityDetail, status];
}
