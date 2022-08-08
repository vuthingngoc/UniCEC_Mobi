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
import 'component/body_competition_of_participant.dart';
import 'widgets/navbar_competition.dart';
import 'widgets/suggest_competition.dart';
import 'widgets/section_title.dart';


class ViewListCompetitionOfParticipantPage extends StatefulWidget {

  ViewListCompetitionOfParticipantPage();

  @override
  _ViewListCompetitionOfParticipantPageState createState() => _ViewListCompetitionOfParticipantPageState();
}

class _ViewListCompetitionOfParticipantPageState extends State<ViewListCompetitionOfParticipantPage> {

  void initState() {
    // _bloc.listenerStream.listen((event) {});
    // _bloc.add(LoadOutStandingCompetitionEvent());
    // _bloc.isLoading = true;
    // _bloc.add(LoadCompetitionEvent());
  }

  @override
  Widget build(BuildContext context) {
    Log.info('Build competition page');
    // SizeConfig().init(context);
    return Scaffold(
        appBar: NavbarCompetitionOfParticipant(
          title: "Cuộc thi và sự kiện đang tham gia",
          searchBar: true,
          categoryOne: "Liên Trường",
          categoryTwo: "Trong Trường",
          // bloc: _bloc,
          // state: "state",
        ),
        backgroundColor: ArgonColors.bgColorScreen,
        //key: _scaffoldKey,
        drawer: ArgonDrawer(currentPage: "Competition"),
        body: Container(
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                BodyCompetitionOfParticipantPage(),
              ],
            ),
          ),
        ));

  }
}
