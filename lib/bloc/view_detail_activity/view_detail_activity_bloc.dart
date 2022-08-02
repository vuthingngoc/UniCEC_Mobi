import '/models/entities/competition_activity/competition_activity_detail_model.dart';
import '../../models/enums/competition_activity_status.dart';
import '../../services/view_competition_activity_svc/i_view_competition_activity_service.dart';
import '/bloc/view_detail_activity/view_detail_activity_event.dart';
import '../../utils/base_bloc.dart';
import 'view_detail_activity_state.dart';

class ViewDetailActivityBloc
    extends BaseBloc<ViewDetailActivityEvent, ViewDetailActivityState> {
  ICompetitionActivityService service;

  ViewDetailActivityBloc({required this.service})
      : super(ViewDetailActivityState(
            competitionActivityDetail: null,
            status: CompetitionActivityStatus.Open,
            selectedImageIndex: 0)) {
    (on(
      (event, emit) async {
        //recieve data
        if (event is RecieveDataEvent) {
          CompetitionActivityDetailModel? result = await service
              .getCompetititonActivityDetail(event.competitionActivityId);
          if (result != null) {
            emit(state.copyWith(
                newCompetitionActivityDetail: result,
                newStatus: result.status,
                newSelectedImageIndex: state.selectedImageIndex));
          }
        }
        //change status
        if (event is ChangeStatusEvent) {
          emit(state.copyWith(
              newCompetitionActivityDetail: state.competitionActivityDetail!,
              newStatus: event.newStatus, // change
              newSelectedImageIndex: state.selectedImageIndex));
        }
        //update status competition activity
        if (event is UpdateStatusEvent) {
          bool check = await service.updateStatusCompetitionActivity(
              state.status, state.competitionActivityDetail!.id);
          if (check) {
            CompetitionActivityDetailModel? result =
                await service.getCompetititonActivityDetail(
                    state.competitionActivityDetail!.id);
            if (result != null) {
              //
              listener.add(ShowingSnackBarEvent(message: "Update Thành Công"));
              //
              emit(state.copyWith(
                  newCompetitionActivityDetail: result,
                  newStatus: result.status,
                  newSelectedImageIndex: state.selectedImageIndex));
            }
          } else {
            listener.add(ShowingSnackBarEvent(message: "Update Lỗi"));
          }
        }
        //change image index
        if (event is ChangeImageIndex) {
          emit(state.copyWith(
                  newCompetitionActivityDetail:
                      state.competitionActivityDetail!,
                  newStatus: state.status,
                  newSelectedImageIndex: event.imageIndex) // change
              );
        }
      },
    ));
  }
}
