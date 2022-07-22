import 'package:unicec_mobi/bloc/competition/competition_event.dart';
import 'package:unicec_mobi/bloc/competition/competition_state.dart';
import 'package:unicec_mobi/models/entities/competition/competition_detail_model.dart';
import 'package:unicec_mobi/models/entities/competition/competition_model.dart';
import 'package:unicec_mobi/models/entities/competition/competition_request_model.dart';
import 'package:unicec_mobi/models/enums/competition_scope_status.dart';
import 'package:unicec_mobi/models/enums/competition_status.dart';
import 'package:unicec_mobi/services/detail_competition_svc/i_detail_competition.dart';
import 'package:unicec_mobi/services/i_services.dart';
import 'package:unicec_mobi/utils/base_bloc.dart';
import 'package:unicec_mobi/utils/log.dart';

import '../../models/entities/competition/competition_in_majors_model.dart';
import 'detail_competition_event.dart';
import 'detail_competition_state.dart';

class DetailCompetitionBloc
    extends BaseBloc<DetailCompetitionEvent, DetailCompetitionState> {
  final IDetailCompetitionService service;

  DetailCompetitionBloc({required this.service})
      : super(DetailCompetitionState(
            detailCompetition: CompetitionDetailModel(
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
      if (event is GetDetailCompetitionEvent) {
        print('LoadCompetitionEvent is running ...');
        // CompetitionRequestModel request =
        //     CompetitionRequestModel(); // add more params if you want
        // CompetitionModel? competition = await service.loadCompetition(request);
        // return (competition != null)
        //     ? competition
        //     : Log.error("Competition model is null");
      }
    });
  }
}
