import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/view_detail_match/view_detail_match_bloc.dart';
import '../../../constants/Theme.dart';

class ViewResultTeam extends StatefulWidget {
  @override
  State<ViewResultTeam> createState() => _ViewResultTeamState();
}

class _ViewResultTeamState extends State<ViewResultTeam> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Row(
              children: [
                Row(
                  children: const [
                    Text(
                      'Kết quả các vòng thi',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              children: [
                Icon(
                  Icons.label,
                  size: 23,
                  color: Colors.orange,
                ),
                SizedBox(width: 10.0),
                Text(
                  "Vòng 1:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10.0),
                Text(
                  "Team 1",
                  style: TextStyle(fontSize: 18, color: ArgonColors.warning),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: ArgonColors.warning),
                      color: ArgonColors.warning,
                      borderRadius: const BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    "2 - 1",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                Text(
                  "Team 2",
                  style: TextStyle(
                      fontSize: 18),
                ),
              ],
            ),
          ),
          Divider(
            height: 30.0,
            thickness: 1.5,
            indent: 32.0,
            endIndent: 32.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Row(
              children: [
                Row(
                  children: const [
                    Text(
                      'Kết quả',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              children: [
                Icon(
                  Icons.label,
                  size: 23,
                  color: Colors.orange,
                ),
                SizedBox(width: 10.0),
                Text(
                  "Vòng 1:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10.0),
                Text(
                  "Team 1 thắng",
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: ArgonColors.warning),
                      color: ArgonColors.warning,
                      borderRadius: const BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    "+ 30 điểm",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 30.0,
            thickness: 1.5,
            indent: 32.0,
            endIndent: 32.0,
          ),
        ],
      ),
    );
  }
}
