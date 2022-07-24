import 'package:flutter/material.dart';
import 'list_team_menu.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: 40,),
              Expanded(child: Text("Tên đội", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)),
              Expanded(child: Text("Số thành viên", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)),
              SizedBox(width: 20,),
              Expanded(child: Text("Trạng thái", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)),
              Expanded(child: Text("Chi tiết", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)),
            ],
          ),
          ViewListTeamMenu(),
        ],
      ),
    );
  }
}