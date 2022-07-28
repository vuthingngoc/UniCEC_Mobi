import 'package:flutter/material.dart';
import '../../constants/Theme.dart';

import '../../utils/app_color.dart';
import '../widgets/input.dart';
import 'component/body_competition_participate.dart';

class ViewCompetitionParticipatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ViewCompetitionParticipatePageState();
}

class _ViewCompetitionParticipatePageState extends State<ViewCompetitionParticipatePage>
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text("Công việc", style: TextStyle(color: Colors.black),),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.backgroundPageColor,
      ),
      body: Body(),
      //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
