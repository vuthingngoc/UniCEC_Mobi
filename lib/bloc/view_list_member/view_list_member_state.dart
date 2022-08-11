import 'package:equatable/equatable.dart';

import '../../models/entities/member/member_model.dart';

class ViewListMemberState extends Equatable {
  List<MemberModel> listMember;
  String? searchName;
  int? clubRoleId;

  ViewListMemberState(
      {required this.listMember,
      required this.searchName,
      required this.clubRoleId});

  ViewListMemberState copyWith(
      {required List<MemberModel> newListMember,
      required String? newSearchName,
      required int? newClubRoleId}) {
    return ViewListMemberState(
        listMember: newListMember,
        searchName: newSearchName,
        clubRoleId: newClubRoleId);
  }

  @override
  List<Object?> get props => [listMember, searchName, clubRoleId];
}
