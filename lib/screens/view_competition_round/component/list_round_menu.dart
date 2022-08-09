import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicec_mobi/bloc/competition_round/competition_round_bloc.dart';
import 'package:unicec_mobi/models/enums/competition_round_status.dart';
import 'package:unicec_mobi/utils/log.dart';
import '../../../constants/Theme.dart';
import '../../../models/entities/competition_round/competition_round_model.dart';

class ViewListRoundMenu extends StatefulWidget {
  List<CompetitionRoundModel> competitionRounds;

  ViewListRoundMenu({Key? key, required this.competitionRounds})
      : super(key: key);

  @override
  _ViewListRoundMenuState createState() => _ViewListRoundMenuState();
}

class _ViewListRoundMenuState extends State<ViewListRoundMenu> {
  List<CompetitionRoundModel>? get _competitionRounds =>
      widget.competitionRounds;

  @override
  Widget build(BuildContext context) {
    CompetitionRoundBloc _bloc = BlocProvider.of<CompetitionRoundBloc>(context);
    Log.info('data competitionRound: ${_competitionRounds}');
    List<CompetitionRoundModel> fakeData = [
      CompetitionRoundModel(
          id: 1,
          competitionId: 1,
          title: "Show what you got",
          description: "Dui dẻ hỏng quạo",
          startTime: "26/07/2020 3:00",
          endTime: "26/07/2020 5:00",
          numberOfTeam: 5,
          seedsPoint: 30,
          status: CompetitionRoundStatus.Active),
      CompetitionRoundModel(
          id: 1,
          competitionId: 1,
          title: "Show what you got",
          description: "Dui dẻ hỏng quạo",
          startTime: "26/07/2020 3:00",
          endTime: "26/07/2020 5:00",
          numberOfTeam: 5,
          seedsPoint: 30,
          status: CompetitionRoundStatus.Cancel),
      CompetitionRoundModel(
          id: 1,
          competitionId: 1,
          title: "Show what you got",
          description: "Dui dẻ hỏng quạo",
          startTime: "26/07/2020 3:00",
          endTime: "26/07/2020 5:00",
          numberOfTeam: 5,
          seedsPoint: 30,
          status: CompetitionRoundStatus.Finished),
    ];
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: _competitionRounds?.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black87,
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: const Color.fromARGB(255, 235, 237, 241),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          child: AlertDialog(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            scrollable: true,
                            title: Container(
                                child: const Text(
                              'Chi tiết',
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            )),
                            content: Padding(
                              padding: const EdgeInsets.only(
                                top: 8,
                              ),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: [
                                      const Text(
                                        "Tên:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          fakeData[index].title,
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 8),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "Thời gian bắt đầu:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 8.0, bottom: 8, left: 8),
                                          padding:
                                              const EdgeInsets.only(left: 3.0),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.orangeAccent),
                                              color: Colors.orangeAccent,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: Text(fakeData[index].startTime,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Thời gian kết thúc:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 8.0, bottom: 8, left: 8),
                                          padding:
                                              const EdgeInsets.only(left: 3.0),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.orangeAccent),
                                              color: Colors.orangeAccent,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: Text(fakeData[index].endTime,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Nội dung:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            fakeData[index].description,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Điểm:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                              fakeData[index]
                                                  .seedsPoint
                                                  .toString(),
                                              style: TextStyle(fontSize: 18)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8, top: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Trạng thái:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Row(
                                              children: [
                                                if (fakeData[index]
                                                        .status
                                                        .toString() ==
                                                    "CompetitionRoundStatus.Active")
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 8.0,
                                                            bottom: 8,
                                                            left: 8),
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 3.0),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.green),
                                                        color: Colors.green,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                    child: Text("Sắp diên ra",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                        )),
                                                  )
                                                else if (fakeData[index]
                                                        .status
                                                        .toString() ==
                                                    "CompetitionRoundStatus.Cancel")
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 8.0,
                                                            bottom: 8,
                                                            left: 8),
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 3.0),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.red),
                                                        color: Colors.red,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                    child: Text("Đã hủy",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                        )),
                                                  )
                                                else if (fakeData[index]
                                                        .status
                                                        .toString() ==
                                                    "CompetitionRoundStatus.Happening")
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 8.0,
                                                            bottom: 8,
                                                            left: 8),
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 3.0),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors
                                                                .yellowAccent),
                                                        color:
                                                            Colors.yellowAccent,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                    child: Text("Đang diễn ra",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                        )),
                                                  )
                                                else if (fakeData[index]
                                                        .status
                                                        .toString() ==
                                                    "CompetitionRoundStatus.Finished")
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 8.0,
                                                            bottom: 8,
                                                            left: 8),
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 3.0),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.grey),
                                                        color: Colors.grey,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                    child: Text("Kết thúc",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                        )),
                                                  )
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              Container(
                                width: double.infinity,
                                margin: new EdgeInsets.only(
                                    right: 15, left: 15, bottom: 15),
                                child: FlatButton(
                                  textColor: ArgonColors.white,
                                  color: ArgonColors.warning,
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 16.0,
                                          right: 16.0,
                                          top: 12,
                                          bottom: 12),
                                      child: Text("Tham gia",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18.0))),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                            (_bloc.state.competitionRounds
                                .elementAt(index)
                                .title),
                            style: const TextStyle(fontSize: 15))),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Text(
                            (_bloc.state.competitionRounds
                                .elementAt(index)
                                .startTime),
                            style: const TextStyle(fontSize: 15))),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Text(
                            (_bloc.state.competitionRounds
                                .elementAt(index)
                                .endTime),
                            style: const TextStyle(fontSize: 15))),
                    const Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
