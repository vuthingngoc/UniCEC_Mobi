import 'package:flutter/material.dart';
import '../../bloc/view_detail_team/view_detail_team_bloc.dart';
import '../../utils/app_color.dart';
import 'component/view_detail_table.dart';

class ViewListMemberPage extends StatefulWidget {
  //bloc
  final ViewDetailTeamBloc bloc;
  ViewListMemberPage({required this.bloc});
  @override
  State<StatefulWidget> createState() => _ViewListMemberPageState();
}

class _ViewListMemberPageState extends State<ViewListMemberPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  //nhận competition Id
  void didChangeDependencies() {
  }

  @override
  Widget build(BuildContext context) {
          return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                ),
                title: Text(
                  "Danh sách các thành viên trong CLB",
                  style: TextStyle(color: Colors.black),
                ),
                automaticallyImplyLeading: false,
                centerTitle: true,
                backgroundColor: AppColors.backgroundPageColor,
              ),
              body: SingleChildScrollView(
              ));
  }
}
