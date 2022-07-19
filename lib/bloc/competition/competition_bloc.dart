import 'package:unicec_mobi/bloc/competition/competition_event.dart';
import 'package:unicec_mobi/bloc/competition/competition_state.dart';
import 'package:unicec_mobi/models/entities/competition/competition_model.dart';
import 'package:unicec_mobi/models/entities/competition/competition_request_model.dart';
import 'package:unicec_mobi/models/enums/competition_scope_status.dart';
import 'package:unicec_mobi/models/enums/competition_status.dart';
import 'package:unicec_mobi/services/i_services.dart';
import 'package:unicec_mobi/utils/base_bloc.dart';
import 'package:unicec_mobi/utils/log.dart';

import '../../models/entities/competition/competition_in_majors_model.dart';

class CompetitionBloc extends BaseBloc<CompetitionEvent, CompetitionState> {
  final ICompetitionService service;

  CompetitionBloc({required this.service})
      : super(CompetitionState(
            competition: CompetitionModel(
                id: 0,
                universityId: 0,
                name: '',
                competitionTypeId: 0,
                competitionTypeName: '',
                createTime: DateTime.now(),
                startTime: DateTime.now(),
                isSponsor: false,
                scope: CompetitionScopeStatus.Club,
                status: CompetitionStatus.Cancel,
                view: 0,
                clubsInCompetition: [],
                majorsInCompetition: [],
                competitionEntities: []))) {
                  on((event, emit) async {
                    if(event is LoadCompetitionEvent){
                      print('LoadCompetitionEvent is running ...');
                      CompetitionRequestModel request = CompetitionRequestModel(); // add more params if you want
                      CompetitionModel? competition = await service.loadCompetition(request);
                      return (competition != null) ? competition : Log.error("Competition model is null");
                    }
                  });
                }
}
