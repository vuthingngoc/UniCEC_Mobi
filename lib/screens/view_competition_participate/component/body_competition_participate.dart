import 'package:flutter/material.dart';
import '../../../constants/Theme.dart';
import '../../widgets/input.dart';
import 'list_competition_participate_menu.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [

          ViewListActivityMenu(),
        ],
      ),
    );
  }
}