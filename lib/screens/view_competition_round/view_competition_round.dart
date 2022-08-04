import 'package:flutter/material.dart';
import '../../constants/Theme.dart';

import '../../utils/app_color.dart';
import '../widgets/input.dart';
import 'component/body_round.dart';

class ViewCompetitionRoundPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ViewCompetitionRoundPageState();
}

class _ViewCompetitionRoundPageState extends State<ViewCompetitionRoundPage>
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
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Text("Các vòng thi", style: TextStyle(color: Colors.black),),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.backgroundPageColor,
      ),
      body: Body(),
      //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
