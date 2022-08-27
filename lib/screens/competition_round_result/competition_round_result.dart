import 'package:flutter/material.dart';
import '../../utils/app_color.dart';
import 'component/competition_round_result_menu.dart';

class ViewCompetitionRoundResultPage extends StatefulWidget {
  // ViewCompetitionRoundResultPage({required this.bloc});

  @override
  State<StatefulWidget> createState() => _ViewCompetitionRoundResultPageState();
}

class _ViewCompetitionRoundResultPageState
    extends State<ViewCompetitionRoundResultPage>
    with AutomaticKeepAliveClientMixin {
  //bloc
  // ViewCompetitionMemberTaskBloc get bloc => widget.bloc;

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
            Navigator.of(context).pop(true);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: Text(
          "Kết quả vòng thi",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
      ),
      body: ViewCompetitionRoundResultMenu(),
    );
  }
}
