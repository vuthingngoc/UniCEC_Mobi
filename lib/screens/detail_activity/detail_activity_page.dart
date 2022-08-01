import 'package:flutter/material.dart';

import '../../constants/Theme.dart';
import '../../utils/app_color.dart';
import '../widgets/drawer.dart';
import 'component/activity_menu.dart';

class ViewDetailActivityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ViewDetailActivityPageState();
}

class _ViewDetailActivityPageState extends State<ViewDetailActivityPage>
    with AutomaticKeepAliveClientMixin {

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.black),
          ),
          title: Text("Chi tiết",
              style: TextStyle(color: Colors.black, fontSize: 23)),
          centerTitle: true,
          backgroundColor: AppColors.backgroundPageColor,
        ),
        backgroundColor: ArgonColors.bgColorScreen,
        drawer: ArgonDrawer(currentPage: "Profile"),
        body: ViewDetailActivityMenu());
  }
}
