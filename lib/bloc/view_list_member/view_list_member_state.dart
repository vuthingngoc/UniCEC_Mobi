import 'package:equatable/equatable.dart';

import '../../models/entities/member/member_model.dart';

class ViewListMemberState extends Equatable {
  List<MemberModel>? listMember;

  ViewListMemberState({required this.listMember});

  ViewListMemberState copyWith({required List<MemberModel> newListMember}) {
    return ViewListMemberState(listMember: newListMember);
  }

  @override
  List<Object?> get props => [listMember];
}
