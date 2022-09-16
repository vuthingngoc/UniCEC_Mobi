import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/view_detail_match/view_detail_match_bloc.dart';
import '../../../constants/Theme.dart';
import '../../../models/entities/match/teams_in_match_model.dart';
import '../../../models/enums/team_in_match_status.dart';

class ViewResultTeam extends StatefulWidget {
  @override
  State<ViewResultTeam> createState() => _ViewResultTeamState();
}

List<TeamsInMatchModel> teamInMatch = <TeamsInMatchModel>[
  TeamsInMatchModel(
      id: 1,
      matchId: 1,
      matchTitle: "",
      teamId: 1,
      teamName:
          "teamName teamName teamName teamName teamName teamName teamName ",
      scores: 30,
      status: TeamInMatchStatus.Win,
      description: "description"),
  TeamsInMatchModel(
      id: 1,
      matchId: 2,
      matchTitle: "",
      teamId: 1,
      teamName: "teamName",
      scores: 30,
      status: TeamInMatchStatus.Win,
      description: "description"),
  TeamsInMatchModel(
      id: 1,
      matchId: 4,
      matchTitle: "",
      teamId: 1,
      teamName: "teamName",
      scores: 30,
      status: TeamInMatchStatus.Win,
      description: "description"),
  TeamsInMatchModel(
      id: 1,
      matchId: 3,
      matchTitle: "",
      teamId: 1,
      teamName: "teamName",
      scores: 30,
      status: TeamInMatchStatus.Win,
      description: "description"),
  TeamsInMatchModel(
      id: 1,
      matchId: 1,
      matchTitle: "",
      teamId: 1,
      teamName: "teamName",
      scores: 30,
      status: TeamInMatchStatus.Win,
      description: "description"),
  TeamsInMatchModel(
      id: 1,
      matchId: 1,
      matchTitle: "",
      teamId: 1,
      teamName: "teamName",
      scores: 30,
      status: TeamInMatchStatus.Lose,
      description: "description"),
  TeamsInMatchModel(
      id: 1,
      matchId: 1,
      matchTitle: "",
      teamId: 1,
      teamName: "teamName",
      scores: 30,
      status: TeamInMatchStatus.Win,
      description: "description"),
  TeamsInMatchModel(
      id: 1,
      matchId: 1,
      matchTitle: "",
      teamId: 1,
      teamName: "teamName",
      scores: 30,
      status: TeamInMatchStatus.Win,
      description: "description"),
  TeamsInMatchModel(
      id: 1,
      matchId: 3,
      matchTitle: "",
      teamId: 1,
      teamName: "teamName",
      scores: 30,
      status: TeamInMatchStatus.Win,
      description: "description"),
  TeamsInMatchModel(
      id: 1,
      matchId: 3,
      matchTitle: "",
      teamId: 1,
      teamName: "teamName",
      scores: 30,
      status: TeamInMatchStatus.Win,
      description: "description"),
  TeamsInMatchModel(
      id: 1,
      matchId: 3,
      matchTitle: "",
      teamId: 1,
      teamName: "teamName",
      scores: 30,
      status: TeamInMatchStatus.Win,
      description: "description"),
  TeamsInMatchModel(
      id: 1,
      matchId: 3,
      matchTitle: "",
      teamId: 1,
      teamName: "teamName",
      scores: 30,
      status: TeamInMatchStatus.Win,
      description: "description"),
  TeamsInMatchModel(
      id: 1,
      matchId: 3,
      matchTitle: "",
      teamId: 1,
      teamName: "teamName",
      scores: 30,
      status: TeamInMatchStatus.Win,
      description: "description"),
];

class _ViewResultTeamState extends State<ViewResultTeam> {
  @override
  Widget build(BuildContext context) {
    return
        //SingleChildScrollView(
        //child:
        Column(
      children: [
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.label,
                      size: 23,
                      color: Colors.orange,
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        "tên Vòng đấu tên Vòng đấu tên",
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
              ),
            );
          },
        ),
      ],
    );
    //);
  }
}
