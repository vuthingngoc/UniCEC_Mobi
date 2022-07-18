import '../../../bloc/club_selection/club_selection_bloc.dart';
import '../../../bloc/club_selection/club_selection_event.dart';
import '../../../bloc/club_selection/club_selection_state.dart';
import '../../../models/entities/club/club_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/dimens.dart';

class ClubCard extends StatefulWidget {
  const ClubCard({
    Key? key,
    this.width = 250,
    this.aspectRetio = 1.02,
    required this.club,
  }) : super(key: key);

  final double width, aspectRetio;
  final ClubModel club;

  @override
  State<ClubCard> createState() => _ClubCardState();
}

class _ClubCardState extends State<ClubCard> {
  @override
  Widget build(BuildContext context) {
    ClubSelectionBloc bloc = BlocProvider.of<ClubSelectionBloc>(context);

    return BlocBuilder<ClubSelectionBloc, ClubSelectionState>(
      bloc: bloc,
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.all(Dimens.size5),
          padding: EdgeInsets.all(Dimens.size10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(Dimens.size0p8),
            borderRadius: BorderRadius.circular(18),
          ),
          child: InkWell(
            onTap: () {
              bloc.add(
                  ChooseClubSelectionEvent(clubIdSelected: widget.club.id));
            },
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  color: Colors.orange[600],
                ),
                margin: EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: Dimens.size30),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 5),
                      Text(
                        widget.club.name,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                )),
          ),
          // child: SizedBox(
          //     width: widget.width,
          //     child: GestureDetector(
          //       onTap: () {
          //         bloc.add(ChooseClubSelectionEvent(
          //             clubIdSelected: widget.club.id));
          //       },
          //       child: Column(
          //         children: [
          //           Text(
          //             widget.club.name,
          //             style: TextStyle(
          //                 fontSize: Dimens.size22,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //           SizedBox(height: Dimens.size5),
          //         ],
          //       ),
          //     )
          //     )
          //
        );
      },
    );
  }
}
