import 'package:equatable/equatable.dart';

import '../../models/entities/club/club_model.dart';

class ClubSelectionState extends Equatable {
  final List<ClubModel> listClubsBelongToStudent;

  ClubSelectionState({required this.listClubsBelongToStudent});

  ClubSelectionState copyWith(
      {required List<ClubModel> listClubsBelongToStudent}) {
    return ClubSelectionState(
        listClubsBelongToStudent: listClubsBelongToStudent);
  }

  @override
  List<Object?> get props => [listClubsBelongToStudent];
}
