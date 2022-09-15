import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unicec_mobi/models/entities/match/match_model.dart';
import 'package:unicec_mobi/models/enums/match_status.dart';
import 'package:unicec_mobi/models/enums/team_in_match_status.dart';

import '../../../bloc/view_detail_match/view_detail_match_bloc.dart';
import '../../../bloc/view_detail_match/view_detail_match_state.dart';
import '../../../constants/Theme.dart';
import '../../../models/entities/match/match_model.dart';
import '../../../models/entities/match/teams_in_match_model.dart';
import '../../../utils/loading.dart';

class ViewDetailMatchMenu extends StatefulWidget {
  @override
  State<ViewDetailMatchMenu> createState() => _ViewDetailMatchMenuState();
}

List<MatchModel> match = <MatchModel>[
  MatchModel(
      id: 1,
      roundId: 1,
      roundName: "Round 1",
      isLoseMatch: true,
      address: "Sân 2, DT741, xã tân tiến, huyện Đồng Phú, tỉnh Bình Dương",
      title: "Ttitle này để check thô icacs bạn ơi",
      description:
          "description này cũng để check thôi à description này cũng để check thôi à description này cũng để check thôi à",
      createTime: DateTime.now(),
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      numberOfTeam: 5,
      status: MatchStatus.Ready),
];

List<TeamsInMatchModel> teamInMatch = <TeamsInMatchModel>[
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
      teamName: "teamName2",
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
];

List<Widget> ListTeamInMatch(List<TeamsInMatchModel>? teamInMatch) {
  List<Widget> result = [];
  if (teamInMatch != null) {
    result = teamInMatch
        .map<Widget>((e) => Container(
              margin: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  border: Border.all(color: ArgonColors.success),
                  color: ArgonColors.success,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Text(
                '${e.teamName}',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ))
        .toList();
  }
  return result;
}

List<Widget> ListTeamInMatchResult(List<TeamsInMatchModel>? teamInMatchResult) {
  int count =1;
  List<Widget> result = [];
  if (teamInMatchResult != null) {
    result = teamInMatchResult
        .map<Widget>((e) =>
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Wrap(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.label,
                    size: 23,
                    color: Colors.orange,
                  ),
                  SizedBox(width: 10.0),
                  Text("${count++}", style: TextStyle(fontSize: 18)),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Text(
                      '${e.teamName}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.symmetric(
                        vertical: 3, horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: ArgonColors.warning),
                        color: ArgonColors.warning,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      "${e.scores} điểm",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ))
        .toList();
  }
  return result;
}

class _ViewDetailMatchMenuState extends State<ViewDetailMatchMenu> {
  @override
  Widget build(BuildContext context) {
    // ViewDetailMatchBloc bloc = BlocProvider.of<ViewDetailMatchBloc>(context);
    // return BlocBuilder<ViewDetailMatchBloc, ViewDetailMatchState>(
    //   bloc: bloc,
    //   builder: (context, state) {
    //     return bloc.isLoading
    //         ? Loading()
    //         : SingleChildScrollView(
    return ListView.builder(
      itemCount: match.length,
      itemBuilder: (context, index) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only( bottom: 10, top: 20, right: 20),
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.amber),
                        color: Colors.amber,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      match[index].status.toString(),
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Align(
                  child: Text(match[index].title,
                      style: const TextStyle(
                          color: Color.fromRGBO(50, 50, 93, 1),
                          fontSize: 28.0)),
                ),
              ),
              //MatchType
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
                child: Row(
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Các đội tham gia',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.supervised_user_circle_outlined,
                      size: 23,
                      color: Colors.orange,
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Wrap(
                          alignment: WrapAlignment.start,
                          direction: Axis.horizontal,
                          children: ListTeamInMatch(teamInMatch)),
                    )
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
                          'Kết quả vòng đấu',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Wrap(
                  alignment: WrapAlignment.start,
                  direction: Axis.horizontal,
                  children: ListTeamInMatchResult(teamInMatch)),
              Divider(
                height: 30.0,
                thickness: 1.5,
                indent: 32.0,
                endIndent: 32.0,
              ),
              //Address
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Row(
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Địa điểm thi đấu',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
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
                      Icons.location_on,
                      size: 23,
                      color: Colors.orange,
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                        child: Text(
                      match[index].address,
                      style: TextStyle(fontSize: 18),
                    )),
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
                          'Thể thức thi đấu',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
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
                      Icons.adjust_sharp,
                      size: 23,
                      color: Colors.orange,
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                        child: Text(
                      "Loại trực tiếp",
                      style: TextStyle(fontSize: 18),
                    )),
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
                          'Mô tả',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.description,
                      size: 23,
                      color: Colors.orange,
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                        child: Text(
                      match[index].description,
                      style: TextStyle(fontSize: 18),
                    )),
                  ],
                ),
              ),
              Divider(
                height: 30.0,
                thickness: 1.5,
                indent: 32.0,
                endIndent: 32.0,
              ),
              //Startitme
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Row(
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Thời gian bắt đầu',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
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
                      Icons.calendar_today,
                      size: 23,
                      color: Colors.orange,
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                        child: Text(
                      match[index].startTime.toString(),
                      style: TextStyle(fontSize: 18),
                    )),
                  ],
                ),
              ),
              Divider(
                height: 30.0,
                thickness: 1.5,
                indent: 32.0,
                endIndent: 32.0,
              ),
              //Endtime
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Row(
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Thời gian kết thúc',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
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
                      Icons.calendar_today_outlined,
                      size: 23,
                      color: Colors.orange,
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                        child: Text(
                      match[index].endTime.toString(),
                      style: TextStyle(fontSize: 18),
                    )),
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
      },
    );
    //   },
    // );
  }
}
