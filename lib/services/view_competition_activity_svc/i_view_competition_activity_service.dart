import 'package:unicec_mobi/models/entities/competition_activity/competition_activity_model.dart';

import '../../models/common/paging_result.dart';
import '../../models/entities/competition_activity/competition_activity_request_model.dart';

abstract class ICompetitionActivityService {
  Future<PagingResult<CompetitionActivityModel>?> getListCompetititonActivity(
      CompetitionActivityRequestModel request);
}
