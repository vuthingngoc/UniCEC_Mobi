import '../../common/paging_request.dart';

class TeamRequestModel extends PagingRequest {
  int competitionId;

  TeamRequestModel({required this.competitionId});
}
