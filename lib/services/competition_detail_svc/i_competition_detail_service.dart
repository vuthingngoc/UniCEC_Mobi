
import '../../models/entities/competition/competition_detail_model.dart';

abstract class ICompetitionDetailService{
  Future<CompetitionDetailModel> getDetailCompetitionByConditions();
  Future<CompetitionDetailModel?> getById(int id);
}