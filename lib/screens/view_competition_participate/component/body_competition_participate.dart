import 'package:flutter/material.dart';
import '../../../constants/Theme.dart';
import '../../widgets/input.dart';
import 'list_competition_participate_menu.dart';

class BodyCompetitionParticipate extends StatelessWidget {
  BodyCompetitionParticipate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [

          ViewCompetitionParticipateMenu(),
        ],
      ),
    );
  }
}