import 'package:get_it/get_it.dart';

import '../../models/common/current_user.dart';
import '../../models/common/resultCRUD.dart';
import '../../models/entities/participant/view_detail_participant.dart';
import '../../models/entities/team/team_detail_model.dart';
import '../../models/enums/team_status.dart';
import '../../services/team_svc/i_team_service.dart';
import '../../utils/base_bloc.dart';
import 'view_detail_team_participant_event.dart';
import 'view_detail_team_participant_state.dart';

class ViewDetailTeamParticipantBloc extends BaseBloc<
    ViewDetailTeamParticipantEvent, ViewDetailTeamParticipantState> {
  ITeamService service;
  ViewDetailTeamParticipantBloc({required this.service})
      : super(ViewDetailTeamParticipantState(
            teamDetail: null,
            competitionId: -1,
            teamId: -1,
            userIdIsLeaderTeam: -1,
            userIdInTeam: -1,
            valueTeamName: '',
            valueTeamDescription: '',
            status: TeamStatus.Available)) {
    on((event, emit) async {
      if (event is RecieveDataEvent) {
        TeamDetailModel? result =
            await service.GetDetailTeamModel(event.competitionId, event.teamId);
        if (result != null) {
          //
          int userIdIsLeaderTeam = -1;
          int userIdInTeam = -1;
          //Tìm User Id Leader Team
          for (ViewDetailParticipantModel participant in result.participants) {
            //Tìm User Id Leader Team
            if (participant.teamRoleName.compareTo("Leader") == 0) {
              userIdIsLeaderTeam = participant.studentId;
            }
            //Tìm UserId xem là thằng đang vào trang này có trong team kh
            if (participant.studentId == GetIt.I.get<CurrentUser>().id) {
              userIdInTeam = participant.studentId;
            }
          }
          emit(state.copyWith(
              newTeamDetail: result,
              newCompetitionId: event.competitionId,
              newTeamId: event.teamId,
              newUserIdLeaderTeam: userIdIsLeaderTeam,
              newUserIdInTeam: userIdInTeam,
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
            newUserIdInTeam: state.userIdInTeam,
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
            newUserIdInTeam: state.userIdInTeam,
            newValueTeamName: state.valueTeamName,
            newValueTeamDescription: event.newDescriptionValue, // change
            newStatus: state.status));
      }
      if (event is UpdateTeamNameAndDescriptionEvent) {
        ResultCRUD result = await service.UpdateTeam(state.teamId,
            state.valueTeamName, state.valueTeamDescription, state.status);
        if (result.check) {
          TeamDetailModel? result = await service.GetDetailTeamModel(
              state.competitionId, state.teamId);
          if (result != null) {
            emit(state.copyWith(
                newTeamDetail: result,
                newCompetitionId: state.competitionId,
                newTeamId: state.teamId,
                newUserIdLeaderTeam: state.userIdIsLeaderTeam,
                newUserIdInTeam: state.userIdInTeam,
                newValueTeamName: result.name,
                newValueTeamDescription: result.description,
                newStatus: result.status));
            listener
                .add(ShowingSnackBarEvent(message: "Cập nhật thành công !"));
          }
        } else {
          listener.add(ShowingSnackBarEvent(message: result.errorMessage));
        }
      }
      if (event is UpdateStatusTeam) {
        ResultCRUD result = await service.UpdateTeam(state.teamId,
            state.valueTeamName, state.valueTeamDescription, event.status);
        if (result.check) {
          TeamDetailModel? result = await service.GetDetailTeamModel(
              state.competitionId, state.teamId);
          if (result != null) {
            emit(state.copyWith(
                newTeamDetail: result,
                newCompetitionId: state.competitionId,
                newTeamId: state.teamId,
                newUserIdLeaderTeam: state.userIdIsLeaderTeam,
                newUserIdInTeam: state.userIdInTeam,
                newValueTeamName: result.name,
                newValueTeamDescription: result.description,
                newStatus: result.status));

            listener
                .add(ShowingSnackBarEvent(message: "Cập nhật thành công !"));
          }
        } else {
          listener.add(ShowingSnackBarEvent(message: result.errorMessage));
        }
      }
      if (event is MemberOutTeamEvent) {
        bool check = await service.MemberOutTeam(state.teamDetail!.id);
        if (check) {
          TeamDetailModel? result = await service.GetDetailTeamModel(
              state.competitionId, state.teamId);
          if (result != null) {
            //
            int userIdIsLeaderTeam = -2;
            int userIdInTeam = -2;
            //Tìm User Id Leader Team
            for (ViewDetailParticipantModel participant
                in result.participants) {
              //Tìm User Id Leader Team
              if (participant.teamRoleName.compareTo("Leader") == 0) {
                userIdIsLeaderTeam = participant.studentId;
              }
              //Tìm UserId xem là thằng đang vào trang này có trong team kh
              if (participant.studentId == GetIt.I.get<CurrentUser>().id) {
                userIdInTeam = participant.studentId;
              }
            }
            emit(state.copyWith(
                newTeamDetail: result,
                newCompetitionId: state.competitionId,
                newTeamId: state.teamId,
                newUserIdLeaderTeam: userIdIsLeaderTeam,
                newUserIdInTeam: userIdInTeam,
                newValueTeamName: result.name,
                newValueTeamDescription: result.description,
                newStatus: result.status));
            listener.add(
                ShowingSnackBarEvent(message: "Thoát khỏi nhóm thành công"));
          }
        }
      }
      if (event is DeleteTeamByLeaderEvent) {
        bool check = await service.DeleteTeam(state.teamDetail!.id);
        if (check) {
          listener.add(BackPreviousPageEvent());
        }
      }
      if (event is DeleteMemberByTeamLeaderEvent) {
        bool check = await service.DeleteMemberByTeamLeader(
            state.teamDetail!.id, event.participantId);
        if (check) {
          TeamDetailModel? result = await service.GetDetailTeamModel(
              state.competitionId, state.teamId);
          if (result != null) {
            //
            int userIdIsLeaderTeam = -2;
            int userIdInTeam = -2;
            //Tìm User Id Leader Team
            for (ViewDetailParticipantModel participant
                in result.participants) {
              //Tìm User Id Leader Team
              if (participant.teamRoleName.compareTo("Leader") == 0) {
                userIdIsLeaderTeam = participant.studentId;
              }
              //Tìm UserId xem là thằng đang vào trang này có trong team kh
              if (participant.studentId == GetIt.I.get<CurrentUser>().id) {
                userIdInTeam = participant.studentId;
              }
            }
            emit(state.copyWith(
                newTeamDetail: result,
                newCompetitionId: state.competitionId,
                newTeamId: state.teamId,
                newUserIdLeaderTeam: userIdIsLeaderTeam,
                newUserIdInTeam: userIdInTeam,
                newValueTeamName: result.name,
                newValueTeamDescription: result.description,
                newStatus: result.status));
            listener.add(ShowingSnackBarEvent(
                message: "Xóa thành viên khỏi nhóm thành công"));
          }
        }
      }
      if (event is UpdateMemberRoleEvent) {
        ResultCRUD resultUpdate =
            await service.UpdateRoleToLeader(event.participantInTeamId);
        if (resultUpdate.check) {
          TeamDetailModel? result = await service.GetDetailTeamModel(
              state.competitionId, state.teamId);
          if (result != null) {
            //
            int userIdIsLeaderTeam = -2;
            int userIdInTeam = -2;
            //Tìm User Id Leader Team
            for (ViewDetailParticipantModel participant
                in result.participants) {
              //Tìm User Id Leader Team
              if (participant.teamRoleName.compareTo("Leader") == 0) {
                userIdIsLeaderTeam = participant.studentId;
              }
              //Tìm UserId xem là thằng đang vào trang này có trong team kh
              if (participant.studentId == GetIt.I.get<CurrentUser>().id) {
                userIdInTeam = participant.studentId;
              }
            }
            emit(state.copyWith(
                newTeamDetail: result,
                newCompetitionId: state.competitionId,
                newTeamId: state.teamId,
                newUserIdLeaderTeam: userIdIsLeaderTeam,
                newUserIdInTeam: userIdInTeam,
                newValueTeamName: result.name,
                newValueTeamDescription: result.description,
                newStatus: result.status));
            listener
                .add(ShowingSnackBarEvent(message: "Cập nhật thành công !"));
          }
        } else {
          listener
              .add(ShowingSnackBarEvent(message: resultUpdate.errorMessage));
        }
      }
    });
  }
}
