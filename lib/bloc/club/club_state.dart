import 'package:equatable/equatable.dart';
import 'package:unicec_mobi/models/entities/member/member_detail_model.dart';

import '../../models/entities/club/club_model.dart';

class ClubState extends Equatable {
  final ClubModel? ClubSelected; // -> load club của Current User chọn
  final MemberDetailModel? MemberSelected;

  ClubState({this.ClubSelected, this.MemberSelected});

  ClubState copyWith(
      {ClubModel? ClubSelected, MemberDetailModel? MemberSelected}) {
    return ClubState(
        ClubSelected: ClubSelected, MemberSelected: MemberSelected);
  }

  @override
  List<Object?> get props => [ClubSelected, MemberSelected];
}
