import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import '../../utils/app_color.dart';
import '../../utils/loading.dart';
import '../../utils/router.dart';
import '../view_result_team/component/view_result_team_menu.dart';

class ViewResultTeamPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ViewResultTeamPageState();
}

class _ViewResultTeamPageState
    extends State<ViewResultTeamPage>
    with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: const Text(
          "Kết quả các vòng đấu",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
      ),
      body: ViewResultTeamMenu()
    );
  }
}
