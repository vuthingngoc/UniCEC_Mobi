import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unicec_mobi/models/entities/team/team_model.dart';

import '../../../models/enums/team_status.dart';
import '../../../utils/router.dart';
import '../../constants.dart';

class ViewListTeamMenu extends StatelessWidget {
  const ViewListTeamMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TeamModel> fakeData = [
      TeamModel(
          id: 1,
          competitionId: 1,
          name: "name name name ame name",
          description: "description",
          invitedCode: "invitedCode",
          status: TeamStatus.Available),
      TeamModel(
          id: 2,
          competitionId: 2,
          name: "name2",
          description: "description",
          invitedCode: "invitedCode2",
          status: TeamStatus.Available),
      TeamModel(
          id: 3,
          competitionId: 3,
          name: "name3",
          description: "description",
          invitedCode: "invitedCode3",
          status: TeamStatus.IsLocked),
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
                  Navigator.pushNamed(context, '/viewDetailTeam');
                },
                child: Row(
                  children: [
                    Expanded(child: Text(fakeData[index].name, style: TextStyle(fontSize: 15))),
                    SizedBox(width: 10,),
                    Expanded(child: Text(fakeData[index].invitedCode, style: TextStyle(fontSize: 15))),
                    SizedBox(width: 30,),
                    if (fakeData[index].status.toString() == "TeamStatus.Available")
                      Image.network(
                          "https://uxwing.com/wp-content/themes/uxwing/download/36-arts-graphic-shapes/circle.png",
                          scale: 50,
                          color: Colors.green)
                    else
                      Image.network(
                          "https://uxwing.com/wp-content/themes/uxwing/download/36-arts-graphic-shapes/circle.png",
                          scale: 50,
                          color: Colors.red),
                    SizedBox(
                      width: 10,
                    ),
                    if (fakeData[index].status.toString() == "TeamStatus.Available")
                      Expanded(child: Text("Mở", style: TextStyle(fontSize: 15)))
                    else
                      Expanded(child: Text("Đóng", style: TextStyle(fontSize: 15))),
                     Icon(Icons.arrow_forward_ios,),
                    //Icon(Icons.remove_red_eye),
                    // Row(
                    //   children: [
                    //     Image.network(
                    //         "https://uxwing.com/wp-content/themes/uxwing/download/36-arts-graphic-shapes/circle.png",
                    //         scale: 50,
                    //         color: Colors.green),
                    //     SizedBox(
                    //       width: 10,
                    //     ),
                    //     Expanded(child: Text("Mở")),
                    //     Icon(Icons.arrow_forward_ios),
                    //   ],
                    // ),
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
