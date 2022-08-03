import 'package:flutter/material.dart';
import '../../../constants/Theme.dart';

class ViewDetailTableMenu extends StatelessWidget {
  const ViewDetailTableMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _showDeleteDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Cảnh báo'),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text('Bạn có chắc chắn muốn xóa?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Đồng ý'),
                onPressed: () {
                  print('Confirmed');
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Hủy'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

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
          Expanded(
              child: SizedBox(
            width: 10,
          )),
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Tên',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('MSSV',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Chi tiết',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
        ],
        rows: [
          DataRow(
              onLongPress: () {
                _showDeleteDialog();
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
                DataCell(PopupMenuButton<int>(
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
                                child: Text('Chọn làm đội trưởng'),
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          onTap: () {
                            _showDeleteDialog();
                          },
                          value: 2,
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.remove_red_eye, size: 18),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text('Xem thông tin'),
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          onTap: () {
                            _showDeleteDialog();
                          },
                          value: 3,
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.delete, size: 18),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text('Xóa thành viên'),
                              ),
                            ],
                          ),
                        ),
                      ];
                    }),),
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
      Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Center(
          child: FlatButton(
            textColor: ArgonColors.white,
            color: ArgonColors.muted,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Padding(
                padding: EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 12, bottom: 12),
                child: Text("Thoát khỏi nhóm",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18.0))),
          ),
        ),
      ),
    ]);
  }
}
