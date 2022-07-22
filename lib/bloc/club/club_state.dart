import 'package:equatable/equatable.dart';
import 'package:unicec_mobi/models/entities/member/member_detail_model.dart';

import '../../models/entities/club/club_model.dart';

class ClubState extends Equatable {
  final ClubModel? ClubSelected; // -> load club của Current User chọn
  final MemberDetailModel? MemberSelected;

  ClubState({required this.ClubSelected, required this.MemberSelected});

  ClubState copyWith(
      {required ClubModel ClubSelected,
      required MemberDetailModel? MemeberSelected}) {
    return ClubState(
        ClubSelected: ClubSelected, MemberSelected: MemeberSelected);
  }

  @override
  List<Object?> get props => [ClubSelected, MemberSelected];
}
