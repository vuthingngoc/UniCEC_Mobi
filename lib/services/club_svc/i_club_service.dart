import '../../models/entities/club/club_model.dart';

abstract class IClubService {
  Future<ClubModel?> getClubSelected(int? ClubId);
}
