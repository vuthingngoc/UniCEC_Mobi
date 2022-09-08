import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/loading.dart';
import '/bloc/view_competition_member_task/view_competition_member_task_event.dart';
import '../../bloc/view_competition_member_task/view_competition_member_task_bloc.dart';
import '../../utils/app_color.dart';
import 'component/list_match_menu.dart';

class ViewListMatchPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() =>
      _ViewListMatchPageState();
}

class _ViewListMatchPageState
    extends State<ViewListMatchPage>
    with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: Text(
          "Danh sách các trận đấu",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
      ),
      body: ListMatchMenu(),
    );
  }
}
