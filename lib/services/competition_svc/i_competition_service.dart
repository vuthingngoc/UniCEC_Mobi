import 'package:unicec_mobi/models/entities/competition/competition_request_model.dart';

import '../../models/entities/competition/competition_model.dart';

abstract class ICompetitionService{
  Future<CompetitionModel?> loadCompetition(CompetitionRequestModel request);
}