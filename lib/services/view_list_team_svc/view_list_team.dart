import 'package:unicec_mobi/models/entities/competition/competition_detail_model.dart';
import 'package:unicec_mobi/models/entities/team/team_model.dart';
import 'package:unicec_mobi/services/detail_competition_svc/i_detail_competition.dart';
import 'package:unicec_mobi/services/view_list_team_svc/i_view_list_team.dart';

class ViewListTeamService implements IViewListTeamService{
  @override
  Future<TeamModel> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<TeamModel> getListTeamByConditions() {
    // TODO: implement getListTeamByConditions
    throw UnimplementedError();
  }

}