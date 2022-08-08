import 'package:unicec_mobi/models/entities/competition/competition_detail_model.dart';
import 'package:unicec_mobi/models/enums/competition_scope_status.dart';
import 'package:unicec_mobi/models/enums/competition_status.dart';
import 'package:unicec_mobi/utils/base_bloc.dart';
import '../../services/competition_detail_svc/i_competition_detail_service.dart';
import 'competition_detail_event.dart';
import 'competition_detail_state.dart';

class CompetitionDetailBloc
    extends BaseBloc<CompetitionDetailEvent, CompetitionDetailState> {
  final ICompetitionDetailService service;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool isLoading){
    _isLoading = isLoading;
  }

  CompetitionDetailBloc({required this.service})
      : super(CompetitionDetailState(
            competitionDetail: CompetitionDetailModel(
                addressName: '',
                competitionEntities: [],
                maxNumber: 0,
                startTimeRegister: DateTime.now(),
                scope: CompetitionScopeStatus.Club,
                clubsInCompetition: [],
                name: '',
                view: 3,
                seedsDeposited: 20,
                numberOfParticipation: 1,
                address: '',
                status: CompetitionStatus.Approve,
                createTime: DateTime.now(),
                majorsInCompetition: [],
                fee: 30.5,
                isSponsor: true,
                id: 1,
                seedsPoint: 2,
                endTimeRegister: DateTime.now(),
                minNumber: 3,
                startTime: DateTime.now(),
                competitionTypeId: 1,
                endTime: DateTime.now(),
                universityId: 1,
                seedsCode: '',
                competitionTypeName: '',
                content: ''))) {
    on((event, emit) async {
      if (event is LoadCompetitionDetailEvent) {
        print('LoadCompetitionEvent is running ...');
        _isLoading = true;
        CompetitionDetailModel? competition = await service.getById(event.competitionId);
        emit(state.copyWith(competitionDetail: competition));
        _isLoading = false;
      }
    });
  }
}
