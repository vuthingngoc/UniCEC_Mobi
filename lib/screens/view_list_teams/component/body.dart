import 'package:flutter/material.dart';
import '../../../constants/Theme.dart';
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 20),
                child: Center(
                  child: FlatButton(
                    textColor: ArgonColors.white,
                    color: ArgonColors.warning,
                    onPressed: () {
                      // Respond to button press
                      Navigator.pushNamed(context, '/');
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(4.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 16.0,
                            right: 16.0,
                            top: 12,
                            bottom: 12),
                        child: Text("Nhập mã tham gia",
                            style: TextStyle(
                                fontWeight:
                                FontWeight.w600,
                                fontSize: 15.0))),
                  ),
                ),
              ),
            ],
          ),
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