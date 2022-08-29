import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicec_mobi/bloc/competition_round/competition_round_bloc.dart';
import 'package:unicec_mobi/models/enums/competition_round_status.dart';
import 'package:unicec_mobi/utils/log.dart';
import '../../../constants/Theme.dart';
import '../../../models/entities/competition_round/competition_round_model.dart';
import '../../../utils/app_color.dart';
import '../../../utils/router.dart';

class ViewListRoundMenu extends StatefulWidget {
  List<CompetitionRoundModel> competitionRounds;

  ViewListRoundMenu({Key? key, required this.competitionRounds})
      : super(key: key);

  @override
  _ViewListRoundMenuState createState() => _ViewListRoundMenuState();
}

class _ViewListRoundMenuState extends State<ViewListRoundMenu> {
  List<CompetitionRoundModel> get _competitionRounds =>
      widget.competitionRounds;

  @override
  Widget build(BuildContext context) {
    CompetitionRoundBloc _bloc = BlocProvider.of<CompetitionRoundBloc>(context);
    Log.info('data competitionRound: ${_competitionRounds}');

    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: _competitionRounds.length,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Wrap(
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
                                          _competitionRounds[index].title,
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 8),
                                    child: Wrap(
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
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10))),
                                          child: Text(
                                              _competitionRounds[index]
                                                  .startTime,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Wrap(
                                      children: [
                                        const Text(
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
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10))),
                                          child: Text(
                                              _competitionRounds[index].endTime,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Wrap(
                                      children: [
                                        const Text(
                                          "Nội dung:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            _competitionRounds[index]
                                                .description,
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 8),
                                    child: Wrap(
                                      children: [
                                        const Text(
                                          "Điểm:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                              _competitionRounds[index]
                                                  .seedsPoint
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 18)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8, top: 8),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "Trạng thái:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Row(
                                              children: [
                                                if (_competitionRounds[index]
                                                        .status ==
                                                    CompetitionRoundStatus
                                                        .Active)
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                      top: 8.0,
                                                      bottom: 8,
                                                      left: 8,
                                                    ),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.green),
                                                        color: Colors.green,
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    10))),
                                                    child: const Text(
                                                        "Sắp diên ra",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                        )),
                                                  )
                                                else if (_competitionRounds[
                                                            index]
                                                        .status ==
                                                    CompetitionRoundStatus
                                                        .Cancel)
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 8.0,
                                                            bottom: 8,
                                                            left: 8),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.red),
                                                        color: Colors.red,
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    10))),
                                                    child: const Text(
                                                        "Đã hủy",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                        )),
                                                  )
                                                else if (_competitionRounds[
                                                            index]
                                                        .status ==
                                                    CompetitionRoundStatus
                                                        .Happening)
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 8.0,
                                                            bottom: 8,
                                                            left: 8),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors
                                                                .yellowAccent),
                                                        color:
                                                            Colors.yellowAccent,
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    10))),
                                                    child: const Text(
                                                        "Đang diễn ra",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                        )),
                                                  )
                                                else if (_competitionRounds[
                                                            index]
                                                        .status ==
                                                    CompetitionRoundStatus
                                                        .Finished)
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 8.0,
                                                            bottom: 8,
                                                            left: 8),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.grey),
                                                        color: Colors.grey,
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    10))),
                                                    child: const Text(
                                                        "Kết thúc",
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
                                margin: const EdgeInsets.only(
                                    right: 15, left: 15, bottom: 15),
                                child: (_competitionRounds[index].status ==
                                        CompetitionRoundStatus.Finished)
                                    ? FlatButton(
                                        textColor: ArgonColors.white,
                                        color: AppColors.mainColor,
                                        onPressed: () {
                                          Navigator.pushNamed(context, Routes.viewCompetitionRoundResult, arguments: {'competitionRoundId': _competitionRounds[index].id});
                                        },
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: const Padding(
                                            padding: EdgeInsets.only(
                                                left: 16.0,
                                                right: 16.0,
                                                top: 12,
                                                bottom: 12),
                                            child: Text("Kết quả vòng thi",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18.0))),
                                      )
                                    : FlatButton(
                                        textColor: ArgonColors.white,
                                        color: AppColors.mainColor,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: const Padding(
                                            padding: EdgeInsets.only(
                                                left: 16.0,
                                                right: 16.0,
                                                top: 12,
                                                bottom: 12),
                                            child: Text("Đóng",
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_competitionRounds[index].title,
                        style: const TextStyle(fontSize: 15)),
                    Text(_competitionRounds[index].description,
                        style: const TextStyle(fontSize: 15)),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.mainColor,
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
