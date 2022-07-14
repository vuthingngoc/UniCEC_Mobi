import 'package:equatable/equatable.dart';

import '../../models/entities/temp/temp.dart';

class UniversitySelectionState extends Equatable {
  final List<UniBelongToEmail> listUniBelongToEmail;

  UniversitySelectionState({
    required this.listUniBelongToEmail,
  });

  UniversitySelectionState copyWith({
    required List<UniBelongToEmail> listUniBelongToEmail,
  }) {
    return UniversitySelectionState(
      listUniBelongToEmail: listUniBelongToEmail,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [listUniBelongToEmail];
}
