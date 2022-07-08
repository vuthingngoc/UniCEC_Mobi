import 'package:unicec_mobi/models/common/paging_request.dart';

import '../../enums/competition_scope_status.dart';
import '../../enums/competition_status.dart';

class CompetitionRequestModel extends PagingRequest{
  int? clubId;
  bool? event;
  CompetitionScopeStatus? scope;
  List<CompetitionStatus>? statuses;

  CompetitionRequestModel({this.clubId, this.event, this.scope, this.statuses});
}