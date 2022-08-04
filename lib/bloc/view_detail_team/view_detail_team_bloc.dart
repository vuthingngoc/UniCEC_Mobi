import '../../models/entities/participant/view_detail_participant.dart';
import '../../models/entities/team/team_detail_model.dart';
import '../../models/enums/team_status.dart';
import '../../services/team_svc/i_team_service.dart';
import '../../utils/base_bloc.dart';
import 'view_detail_team_event.dart';
import 'view_detail_team_state.dart';

class ViewDetailTeamBloc
    extends BaseBloc<ViewDetailTeamEvent, ViewDetailTeamState> {
  ITeamService service;
  ViewDetailTeamBloc({required this.service})
      : super(ViewDetailTeamState(
            teamDetail: null,
            competitionId: -1,
            teamId: -1,
            userIdIsLeaderTeam: -1,
            valueTeamName: '',
            valueTeamDescription: '',
            status: TeamStatus.Available)) {
    on(
      (event, emit) async {
        if (event is RecieveDataEvent) {
          TeamDetailModel? result = await service.GetDetailTeamModel(
              event.competitionId, event.teamId);
          if (result != null) {
            //
            int userIdIsLeaderTeam = -2;
            //Tìm User Id Leader Team
            for (ViewDetailParticipantModel participant
                in result.participants) {
              if (participant.teamRoleName.compareTo("Leader") == true) {
                userIdIsLeaderTeam = participant.studentId;
              }
            }
            emit(state.copyWith(
                newTeamDetail: result,
                newCompetitionId: event.competitionId,
                newTeamId: event.teamId,
                newUserIdLeaderTeam: userIdIsLeaderTeam,
                newValueTeamName: result.name,
                newValueTeamDescription: result.description,
                newStatus: result.status));
          }
        }
        if (event is ChangeTeamNameValueEvent) {
          emit(state.copyWith(
              newTeamDetail: state.teamDetail,
              newTeamId: state.teamId,
              newCompetitionId: state.competitionId,
              newUserIdLeaderTeam: state.userIdIsLeaderTeam,
              newValueTeamName: event.newNameValue, // change
              newValueTeamDescription: state.valueTeamDescription,
              newStatus: state.status));
        }
        if (event is ChangeTeamDescriptionValueEvent) {
          emit(state.copyWith(
              newTeamDetail: state.teamDetail,
              newTeamId: state.teamId,
              newCompetitionId: state.competitionId,
              newUserIdLeaderTeam: state.userIdIsLeaderTeam,
              newValueTeamName: state.valueTeamName,
              newValueTeamDescription: event.newDescriptionValue, // change
              newStatus: state.status));
        }
        if (event is UpdateTeamNameAndDescriptionEvent) {
          bool check = await service.UpdateTeam(state.teamId,
              state.valueTeamName, state.valueTeamDescription, state.status);
          if (check) {
            TeamDetailModel? result = await service.GetDetailTeamModel(
                state.competitionId, state.teamId);
            if (result != null) {
              emit(state.copyWith(
                  newTeamDetail: result,
                  newCompetitionId: state.competitionId,
                  newTeamId: state.teamId,
                  newUserIdLeaderTeam: state.userIdIsLeaderTeam,
                  newValueTeamName: result.name,
                  newValueTeamDescription: result.description,
                  newStatus: result.status));
            }
          } else {
            listener.add(ShowingSnackBarEvent(message: "Lỗi"));
          }
        }
        if (event is UpdateStatusTeam) {
          bool check = await service.UpdateTeam(state.teamId,
              state.valueTeamName, state.valueTeamDescription, event.status);
          if (check) {
            TeamDetailModel? result = await service.GetDetailTeamModel(
                state.competitionId, state.teamId);
            if (result != null) {
              emit(state.copyWith(
                  newTeamDetail: result,
                  newCompetitionId: state.competitionId,
                  newTeamId: state.teamId,
                  newUserIdLeaderTeam: state.userIdIsLeaderTeam,
                  newValueTeamName: result.name,
                  newValueTeamDescription: result.description,
                  newStatus: result.status));
            }
          } else {
            listener.add(ShowingSnackBarEvent(message: "Lỗi"));
          }
        }
      },
    );
  }
}
