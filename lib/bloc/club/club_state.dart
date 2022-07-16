import 'package:equatable/equatable.dart';

import '../../models/entities/club/club_model.dart';

class ClubState extends Equatable {
  final List<ClubModel>
      listClubModel; // -> load list club ở trường của Current User

  ClubState({required this.listClubModel});

  ClubState copyWith({required List<ClubModel> listClubModel}) {
    return ClubState(listClubModel: listClubModel);
  }

  @override
  List<Object?> get props => [listClubModel];
}
