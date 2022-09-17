import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/view_detail_match/view_detail_match_bloc.dart';
import '../../../constants/Theme.dart';
import '../../../models/entities/match/teams_in_match_model.dart';
import '../../../models/enums/team_in_match_status.dart';

class ViewResultTeamMenu extends StatefulWidget {
  @override
  State<ViewResultTeamMenu> createState() => _ViewResultTeamMenuState();
}

List<TeamsInMatchModel> teamInMatch = <TeamsInMatchModel>[
  TeamsInMatchModel(
      id: 1,
      matchId: 1,
      matchTitle: "Match này xem cho vui",
      teamId: 1,
      teamName:
          "teamName teamName teamName teamName teamName teamName teamName ",
      scores: 30,
      status: TeamInMatchStatus.Win,
      description: "description"),
  TeamsInMatchModel(
      id: 1,
      matchId: 2,
      matchTitle: "Match này xem cho vui",
      teamId: 1,
      teamName: "teamName",
      scores: 30,
      status: TeamInMatchStatus.Win,
      description: "description"),
  TeamsInMatchModel(
      id: 1,
      matchId: 4,
      matchTitle: "Match này xem cho vui",
      teamId: 1,
      teamName: "teamName",
      scores: 30,
      status: TeamInMatchStatus.Win,
      description: "description"),
  TeamsInMatchModel(
      id: 1,
      matchId: 3,
      matchTitle: "Match này xem cho vui",
      teamId: 1,
      teamName: "teamName",
      scores: 30,
      status: TeamInMatchStatus.Win,
      description: "description"),
  TeamsInMatchModel(
      id: 1,
      matchId: 1,
      matchTitle: "Match này xem cho vui",
      teamId: 1,
      teamName: "teamName",
      scores: 30,
      status: TeamInMatchStatus.Win,
      description: "description"),
  TeamsInMatchModel(
      id: 1,
      matchId: 1,
      matchTitle: "Match này xem cho vui",
      teamId: 1,
      teamName: "teamName",
      scores: 30,
      status: TeamInMatchStatus.Lose,
      description: "description"),
  TeamsInMatchModel(
      id: 1,
      matchId: 1,
      matchTitle: "Match này xem cho vui",
      teamId: 1,
      teamName: "teamName",
      scores: 30,
      status: TeamInMatchStatus.Win,
      description: "description"),
  TeamsInMatchModel(
      id: 1,
      matchId: 1,
      matchTitle: "Match này xem cho vui",
      teamId: 1,
      teamName: "teamName",
      scores: 30,
      status: TeamInMatchStatus.Win,
      description: "description"),
  TeamsInMatchModel(
      id: 1,
      matchId: 3,
      matchTitle: "Match này xem cho vui",
      teamId: 1,
      teamName: "teamName",
      scores: 30,
      status: TeamInMatchStatus.Win,
      description: "description"),
  TeamsInMatchModel(
      id: 1,
      matchId: 3,
      matchTitle: "Match này xem cho vui",
      teamId: 1,
      teamName: "teamName",
      scores: 30,
      status: TeamInMatchStatus.Win,
      description: "description"),
  TeamsInMatchModel(
      id: 1,
      matchId: 3,
      matchTitle: "Match này xem cho vui",
      teamId: 1,
      teamName: "teamName",
      scores: 30,
      status: TeamInMatchStatus.Win,
      description: "description"),
];

class _ViewResultTeamMenuState extends State<ViewResultTeamMenu> {
  @override
  Widget build(BuildContext context) {
    return
        //SingleChildScrollView(
        //child:
        SingleChildScrollView(
          child: Column(
      children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: ArgonColors.success),
                      color: ArgonColors.success,
                      borderRadius: const BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    "Xếp hạng: 1",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: ArgonColors.success),
                      color: ArgonColors.success,
                      borderRadius: const BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    "360 điểm",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: teamInMatch.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: TextButton(
                  onPressed: () {
                    //navigator to match detail
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("Vòng 1", style: TextStyle(fontWeight: FontWeight.bold, color: ArgonColors
                          .warning, fontSize: 18),),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        children: [
                          Icon(
                            Icons.label,
                            size: 23,
                            color: Colors.orange,
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: Text(
                              teamInMatch[index].matchTitle,
                              style: TextStyle(fontSize: 18, color: Colors.black87),
                            ),
                          ),
                          SizedBox(width: 30.0),
                          if (teamInMatch[index].status == TeamInMatchStatus.Win)
                            Expanded(
                              child: Text(
                                "Thắng",
                                style: TextStyle(
                                    fontSize: 18, color: ArgonColors.success),
                              ),
                            ),
                          if (teamInMatch[index].status == TeamInMatchStatus.Lose)
                            Expanded(
                              child: Text(
                                "Thua",
                                style: TextStyle(
                                    fontSize: 18, color: ArgonColors.warning),
                              ),
                            ),
                          if (teamInMatch[index].status == TeamInMatchStatus.Draw)
                            Expanded(
                              child: Text(
                                "Hòa",
                                style:
                                TextStyle(fontSize: 18, color: ArgonColors.info),
                              ),
                            ),
                          if (teamInMatch[index].status == TeamInMatchStatus.Cancel)
                            Expanded(
                              child: Text(
                                "Hủy",
                                style:
                                TextStyle(fontSize: 18, color: ArgonColors.muted),
                              ),
                            ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topRight,
                              margin: const EdgeInsets.symmetric(horizontal: 15),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: ArgonColors.warning),
                                  color: ArgonColors.warning,
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                teamInMatch[index].scores.toString() + " điểm",
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 20.0,
                        thickness: 1.5,
                        indent: 32.0,
                        endIndent: 32.0,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
      ],
    ),
        );
    //);
  }
}
