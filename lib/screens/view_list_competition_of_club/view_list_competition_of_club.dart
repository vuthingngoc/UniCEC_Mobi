import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicec_mobi/bloc/competition/competition_bloc.dart';
import 'package:unicec_mobi/bloc/competition/competition_state.dart';
import 'package:unicec_mobi/screens/view_list_competition_of_club/status/approve.dart';
import 'package:unicec_mobi/screens/view_list_competition_of_club/status/cancel.dart';
import 'package:unicec_mobi/screens/view_list_competition_of_club/status/complete.dart';
import 'package:unicec_mobi/screens/view_list_competition_of_club/status/draft.dart';
import 'package:unicec_mobi/screens/view_list_competition_of_club/status/end.dart';
import 'package:unicec_mobi/screens/view_list_competition_of_club/status/on_going.dart';
import 'package:unicec_mobi/screens/view_list_competition_of_club/status/pending.dart';
import 'package:unicec_mobi/screens/view_list_competition_of_club/status/pending_review.dart';
import 'package:unicec_mobi/screens/view_list_competition_of_club/status/publish.dart';
import 'package:unicec_mobi/screens/view_list_competition_of_club/status/register.dart';
import 'package:unicec_mobi/screens/view_list_competition_of_club/status/start.dart';
import 'package:unicec_mobi/screens/view_list_competition_of_club/status/upcoming.dart';
import 'package:unicec_mobi/utils/app_color.dart';
import 'package:unicec_mobi/utils/log.dart';

import '../../bloc/competition/competition_event.dart';
import '../../constants/theme.dart';

//widgets
import '../../utils/loading.dart';
import '../../utils/router.dart';
import '../size_config.dart';
import '../widgets/card-small.dart';
import '../widgets/drawer.dart';
import 'widgets/navbar_competition.dart';
import 'widgets/suggest_competition.dart';
import 'widgets/section_title.dart';

class ViewListCompetitionOfClubPage extends StatefulWidget {
  ViewListCompetitionOfClubPage();

  @override
  _ViewListCompetitionOfClubPageState createState() =>
      _ViewListCompetitionOfClubPageState();
}

class _ViewListCompetitionOfClubPageState
    extends State<ViewListCompetitionOfClubPage> {
  void initState() {}

  @override
  Widget build(BuildContext context) {
    Log.info('Build competition page');
    return Scaffold(
        // appBar: NavbarCompetitionOfClub(
        //   title: "Cuộc thi và sự kiện trong CLB",
        //   searchBar: true,
        //   categoryOne: "Cuộc Thi",
        //   categoryTwo: "Sự Kiện",
        //   // bloc: _bloc,
        //   // state: "state",
        // ),
        backgroundColor: ArgonColors.bgColorScreen,
        //key: _scaffoldKey,
        drawer: ArgonDrawer(currentPage: "Competition"),
        body: Container(
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ApprovePage(),
                CancelPage(),
                CompletePage(),
                DraftPage(),
                EndPage(),
                OnGoingPage(),
                PendingPage(),
                PendingReviewPage(),
                PublishPage(),
                RegisterPage(),
                StartPage(),
                UpComingPage(),
              ],
            ),
          ),
        ));
  }
}
