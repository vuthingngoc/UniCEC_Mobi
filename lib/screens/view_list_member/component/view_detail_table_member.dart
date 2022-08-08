import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../bloc/view_list_member/view_list_member_bloc.dart';
import '../../../models/common/current_user.dart';
import '../../../models/entities/member/member_model.dart';

class ViewDetailTableMenu extends StatefulWidget {
  final List<MemberModel> listModel;

  ViewDetailTableMenu({required this.listModel});

  @override
  State<ViewDetailTableMenu> createState() => _ViewDetailTableMenuState();
}

class _ViewDetailTableMenuState extends State<ViewDetailTableMenu> {
  List<MemberModel> get listModel => widget.listModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    ViewListMemberBloc bloc = BlocProvider.of<ViewListMemberBloc>(context);
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        return DataTable(columns: [
          DataColumn(
              label: Container(
            width: width * 0.1,
            child: Text('',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          )),
          DataColumn(
              label: Container(
            width: width * 0.2,
            child: Text('Tên',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          )),
          DataColumn(
              label: Text('Chức vụ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Container(
            width: width * 0.15,
            child: Text('Chi tiết',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          )),
        ], rows: getRows(listModel).cast());
      },
    );
  }

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

  List getRows(List<MemberModel> member) => listModel.map((MemberModel member) {
        final cells = [1, 2, 3, 4];
        Iterable<DataCell> getListData = cells.map<DataCell>((e) {
          if (e == 1) {
            return DataCell(Row(children: [
              CircleAvatar(
                  backgroundImage: (member.avatar.isNotEmpty)
                      ? NetworkImage(scale: 50, member.avatar)
                      : NetworkImage(
                          scale: 50, "https://picsum.photos/seed/513/600")),
            ]));
          } else if (e == 2) {
            return DataCell(Container(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Text(
                  member.name,
                  style: TextStyle(fontSize: 15),
                )));
          } else if (e == 3) {
            return DataCell(Text(
              member.clubRoleName,
              style: TextStyle(fontSize: 15),
            ));
          } else {
            return DataCell(
                SizedBox(child: PopupMenuButton<int>(itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: () {
                    //_showDeleteDialog();
                  },
                  value: 3,
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
              ];
            })));
          }
        });
        return DataRow(cells: getListData.toList());
      }).toList();
}