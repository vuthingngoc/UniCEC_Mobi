import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unicec_mobi/models/entities/competition/competition_model.dart';
import 'package:unicec_mobi/models/enums/competition_scope_status.dart';
import 'package:unicec_mobi/models/enums/priority_status.dart';
import '../../../constants/Theme.dart';
import '../../../models/entities/competition_activity/competition_activity_model.dart';
import '../../../models/enums/competition_activity_status.dart';
import '../../../models/enums/competition_status.dart';

class ViewCompetitionParticipateMenu extends StatelessWidget {
  const ViewCompetitionParticipateMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CompetitionModel> fakeData = [
      CompetitionModel(
        view: 26,
        name: 'Competition này được dùng để test thôi, không có gì cả',
        clubsInCompetition: [],
        scope: CompetitionScopeStatus.Club,
        competitionTypeId: 2,
        competitionEntities: [],
        universityId: 1,
        competitionTypeName: ' check check',
        status: CompetitionStatus.OnGoing,
        startTime: "29/07/2022 5:300",
        createTime: '29/07/2022 5:30:00',
        majorsInCompetition: [],
        isSponsor: true,
        id: 1,
      ),
      CompetitionModel(
        view: 26,
        name: 'Competition này được dùng để test thôi, không có gì cả',
        clubsInCompetition: [],
        scope: CompetitionScopeStatus.Club,
        competitionTypeId: 2,
        competitionEntities: [],
        universityId: 1,
        competitionTypeName: ' check check',
        status: CompetitionStatus.Pending,
        startTime: "29/07/2022 5:300",
        createTime: '29/07/2022 5:30:00',
        majorsInCompetition: [],
        isSponsor: true,
        id: 1,
      ),
      CompetitionModel(
        view: 26,
        name: 'Competition này ',
        clubsInCompetition: [],
        scope: CompetitionScopeStatus.Club,
        competitionTypeId: 2,
        competitionEntities: [],
        universityId: 1,
        competitionTypeName: ' check check',
        status: CompetitionStatus.OnGoing,
        startTime: "29/07/2022 5:300",
        createTime: '29/07/2022 5:30:00',
        majorsInCompetition: [],
        isSponsor: true,
        id: 1,
      ),
      CompetitionModel(
        view: 26,
        name: 'Competition này được dùn',
        clubsInCompetition: [],
        scope: CompetitionScopeStatus.Club,
        competitionTypeId: 2,
        competitionEntities: [],
        universityId: 1,
        competitionTypeName: ' check check',
        status: CompetitionStatus.Finish,
        startTime: "29/07/2022 5:300",
        createTime: '29/07/2022 5:30:00',
        majorsInCompetition: [],
        isSponsor: true,
        id: 1,
      ),
    ];
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: fakeData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black87,
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Color.fromARGB(255, 235, 237, 241),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                      context, '/viewListActivity');
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(fakeData[index].id.toString(),
                                style: TextStyle(
                                    fontSize: 20, color: Colors.grey)),
                          ),
                          Expanded(
                            child: Text(fakeData[index].name,
                                style: TextStyle(fontSize: 18)),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 8),
                          child: Text("|",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey)),
                        ),
                        Text(fakeData[index].createTime,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.grey)),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 8),
                          child: Text("|",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey)),
                        ),
                        if (fakeData[index].status.toString() ==
                            "CompetitionStatus.OnGoing")
                          Text(
                            "Đang diễn ra",
                            style: TextStyle(fontSize: 18, color: Colors.amber),
                          ),
                        if (fakeData[index].status.toString() ==
                            "CompetitionStatus.Open")
                          Text(
                            "Mở",
                            style:
                                TextStyle(fontSize: 18, color: Colors.purple),
                          ),
                        if (fakeData[index].status.toString() ==
                            "CompetitionStatus.Pending")
                          Text(
                            "Chờ",
                            style: TextStyle(
                                fontSize: 18, color: Colors.deepOrangeAccent),
                          ),
                        if (fakeData[index].status.toString() ==
                            "CompetitionStatus.Finish")
                          Text(
                            "Hoàn thành",
                            style: TextStyle(fontSize: 18, color: Colors.green),
                          ),
                        if (fakeData[index].status.toString() ==
                            "CompetitionStatus.Complete")
                          Text(
                            "Kết thúc",
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        if (fakeData[index].status.toString() ==
                            "CompetitionStatus.Cancel")
                          Text(
                            "Hủy",
                            style: TextStyle(fontSize: 18, color: Colors.red),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
    // return ListView.builder(
    //   return Padding(
    //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    //
    //     ),
    // ),
    // );
  }
}
