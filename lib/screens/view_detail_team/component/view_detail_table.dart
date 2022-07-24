import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unicec_mobi/models/entities/team/team_model.dart';

import '../../../constants/Theme.dart';
import '../../../models/enums/team_status.dart';
import '../../constants.dart';

class ViewDetailTableMenu extends StatelessWidget {
  const ViewDetailTableMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      SizedBox(
        height: 20,
      ),
      // Center(
      //     child: Text(
      //   'Danh sách thành viên',
      //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      // )),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text("Mã: DWD16GH",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    )),
              ),
            ],
          ),
          Expanded(child: SizedBox(width: 10,)),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text("Mã tham gia: PASS",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    )),
              ),
            ],
          ),
        ],
      ),
      DataTable(
        columns: [
          DataColumn(
              label: Text('',
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Tên',
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('MSSV',
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Trường',
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold))),
        ],
        rows: [
          DataRow(
              onLongPress: () {
                PopupMenuButton<int>(
                    icon: Icon(Icons.filter_alt_outlined),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          onTap: () {},
                          value: 1,
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.access_time_sharp, size: 18),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text('Ngày gần nhất'),
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          onTap: () {},
                          value: 2,
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.delete, size: 18),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text('Mới nhất'),
                              ),
                            ],
                          ),
                        ),
                      ];
                    });
              },
              cells: [
                DataCell(
                  Padding(
                    //padding: const EdgeInsets.fromLTRB(6.0, 2.0, 10.0, 2.0),
                    padding: const EdgeInsets.all(0),
                    child: Container(
                        child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                scale: 50,
                                "https://i.guim.co.uk/img/media/8f3a8ada36ac29ebe3ea48c5a15b1011367a4b88/0_1347_2848_1707/master/2848.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=85c6ae7f192ba52424045118356548ab"))),
                  ),
                ),
                DataCell(Text('Captain America')),
                DataCell(Text('SE140164')),
                DataCell(Text('Social University')),
              ]),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 16),  
        child: Center(
          child: FlatButton(
            textColor: ArgonColors.white,
            color: ArgonColors.error,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Padding(
                padding: EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 12, bottom: 12),
                child: Text("Khóa nhóm",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18.0))),
          ),
        ),
      ),
    ]);
  }
}
