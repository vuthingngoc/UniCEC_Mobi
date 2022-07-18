import 'package:equatable/equatable.dart';

import '../../models/entities/club/club_model.dart';

class ClubState extends Equatable {
  final ClubModel? ClubSelected; // -> load club của Current User chọn

  ClubState({required this.ClubSelected});

  ClubState copyWith({required ClubModel ClubSelected}) {
    return ClubState(ClubSelected: ClubSelected);
  }

  @override
  List<Object?> get props => [ClubSelected];
}
