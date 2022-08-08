import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/view_detail_team_student/view_detail_team_student_bloc.dart';
import '../../../models/entities/participant/view_detail_participant.dart';

class ViewDetailTableStudentMenu extends StatefulWidget {
  final List<ViewDetailParticipantModel> listModel;

  ViewDetailTableStudentMenu({required this.listModel});

  @override
  State<ViewDetailTableStudentMenu> createState() =>
      _ViewDetailTableStudentMenuState();
}

class _ViewDetailTableStudentMenuState
    extends State<ViewDetailTableStudentMenu> {
  List<ViewDetailParticipantModel> get listModel => widget.listModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    ViewDetailTeamStudentBloc bloc =
        BlocProvider.of<ViewDetailTeamStudentBloc>(context);
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
              label: Text('MSSV',
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

  List getRows(List<ViewDetailParticipantModel> member) =>
      listModel.map((ViewDetailParticipantModel member) {
        final cells = [1, 2, 3, 4];
        Iterable<DataCell> getListData = cells.map<DataCell>((e) {
          if (e == 1) {
            return DataCell(Row(children: [
              CircleAvatar(
                  backgroundImage: (member.studentAvatar.isNotEmpty)
                      ? NetworkImage(scale: 50, member.studentAvatar)
                      : NetworkImage(
                          scale: 50, "https://picsum.photos/seed/513/600")),
              if (member.teamRoleName.compareTo("Leader") == 0)
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                )
            ]));
          } else if (e == 2) {
            return DataCell(Container(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Text(
                  member.studentName,
                  style: TextStyle(fontSize: 15),
                )));
          } else if (e == 3) {
            return DataCell(Text(
              member.studentCode,
              style: TextStyle(fontSize: 15),
            ));
          } else {
            return DataCell(
                SizedBox(child: PopupMenuButton<int>(itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: () {},
                  value: 1,
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