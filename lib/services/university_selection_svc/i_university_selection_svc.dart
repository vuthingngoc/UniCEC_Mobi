import '../../models/entities/user/complete_profile.dart';

abstract class IUniversitySelectionService {
  Future<bool> completeProfile(CompleteProfile model);
}
