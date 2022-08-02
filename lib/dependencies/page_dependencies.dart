import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '/screens/club_view_detail/club_view_detail_page.dart';
import '/utils/router.dart';
import '../screens/event/event_page.dart';
import '../screens/pages.dart';

class PageDependencies {
  static Future setup(GetIt injector) async {
    injector.registerFactory<Widget>(() => MainPage(injector()),
        instanceName: Routes.main);

    //splash
    injector.registerFactory<Widget>(() => SplashPage(bloc: injector()),
        instanceName: Routes.splash);

    //login
    injector.registerFactory<Widget>(() => LoginPage(bloc: injector()),
        instanceName: Routes.login);

    //university selection page
    injector.registerFactory<Widget>(
        () => UniversitySelectionPage(bloc: injector()),
        instanceName: Routes.universitySelection);

    //club selection page
    injector.registerFactory<Widget>(() => ClubSelectionPage(bloc: injector()),
        instanceName: Routes.clubSelection);

    //CompetitionPage -> show Cuộc Thi
    injector.registerFactory<Widget>(() => CompetitionPage(bloc: injector()),
        instanceName: Routes.competition);

    //EventPage -> show Sự Kiện
    injector.registerFactory<Widget>(() => EventPage(bloc: injector()),
        instanceName: Routes.event);

    //Profile Page -> show general info Student
    injector.registerFactory<Widget>(() => DetailCompetitionPage(),
        instanceName: Routes.detailCompetition);

    injector.registerFactory<Widget>(() => ViewListTeamPage(bloc: injector()),
        instanceName: Routes.viewListTeam);

    injector.registerFactory<Widget>(() => ViewDetailTeamPage(),
        instanceName: Routes.viewDetailTeam);

    //round
    injector.registerFactory<Widget>(() => ViewCompetitionRoundPage(),
        instanceName: Routes.viewCompetitionRound);

    //--------------------------TASK
    //competition member task
    injector.registerFactory<Widget>(
        () => ViewCompetitionMemberTaskPage(bloc: injector()),
        instanceName: Routes.viewComptitionMemberTask);

    //list actitvity of competition member task // view competition activity
    injector.registerFactory<Widget>(
        () => ViewListActivityPage(bloc: injector()),
        instanceName: Routes.viewListActivity);

    //
    injector.registerFactory<Widget>(
        () => ViewDetailActivityPage(bloc: injector()),
        instanceName: Routes.viewDetailActivity);

    //Profile Page -> show thông tin Student
    injector.registerFactory<Widget>(() => ProfilePage(bloc: injector()),
        instanceName: Routes.profile);

    injector.registerFactory<Widget>(() => MyAccountPage(bloc: injector()),
        instanceName: Routes.myAccount);

    //Club Page -> show Club
    injector.registerFactory<Widget>(() => ClubPage(bloc: injector()),
        instanceName: Routes.club);

    //Clubs View
    injector.registerFactory<Widget>(() => ClubsViewPage(bloc: injector()),
        instanceName: Routes.clubsView);

    //Task Page -> show Tasks
    injector.registerFactory<Widget>(() => TaskPage(),
        instanceName: Routes.task);

    injector.registerFactory<Widget>(() => ClubViewDetailPage(bloc: injector()),
        instanceName: Routes.clubViewDetail);
  }
}
