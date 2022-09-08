import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import '../../constants/Theme.dart';
import '../../utils/app_color.dart';
import 'component/detail_match_menu.dart';

class ViewDetailMatchPage extends StatefulWidget {
  //bloc

  @override
  State<StatefulWidget> createState() => _ViewDetailMatchPageState();
}

class _ViewDetailMatchPageState extends State<ViewDetailMatchPage>
    with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {}


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
          "Chi tiết trận đấu",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
      ),
      body: ViewDetailMatchMenu(),
    );
  }
}
