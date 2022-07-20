import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../bloc/club_selection/club_selection_bloc.dart';
import '../../../bloc/club_selection/club_selection_state.dart';
import '../../../utils/dimens.dart';
import 'club_card.dart';

class ShowClubsBelongToStudent extends StatefulWidget {
  const ShowClubsBelongToStudent({Key? key}) : super(key: key);

  @override
  State<ShowClubsBelongToStudent> createState() =>
      _ShowClubsBelongToStudentState();
}

class _ShowClubsBelongToStudentState extends State<ShowClubsBelongToStudent> {
  @override
  Widget build(BuildContext context) {
    ClubSelectionBloc bloc = BlocProvider.of<ClubSelectionBloc>(context);
    return Column(
      children: [
        SizedBox(height: Dimens.size40),
        Text('Chọn câu lạc bộ của bạn',
            style:TextStyle(
                fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
        ),
        BlocBuilder<ClubSelectionBloc, ClubSelectionState>(
            bloc: bloc,
            builder: (context, state) {
              return ListView.builder(
                itemCount: state.listClubsBelongToStudent.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ClubCard(
                      club: state.listClubsBelongToStudent.elementAt(index));
                },
              );
            }),
      ],
    );
  }
}