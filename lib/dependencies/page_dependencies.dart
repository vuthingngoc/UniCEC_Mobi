import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../screens/view_detai_match/view_detail_match.dart';
import '../screens/view_list_match/view_list_match.dart';
import '/utils/router.dart';
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
    // injector.registerFactory<Widget>(() => EventPage(bloc: injector()),
    //     instanceName: Routes.event);

    //Profile Page -> show general info Student
    injector.registerFactory<Widget>(
        () => CompetitionDetailPage(bloc: injector()),
        instanceName: Routes.detailCompetition);

//--------------------------------PARTICIPANT
    injector.registerFactory<Widget>(
        () => ViewListTeamParticipantPage(bloc: injector()),
        instanceName: Routes.viewListTeamParticipant);

    injector.registerFactory<Widget>(
        () => ViewDetailTeamParticipantPage(bloc: injector()),
        instanceName: Routes.viewDetailTeamParticipant);

//--------------------------------STUDENT (who not join in competition)
    injector.registerFactory<Widget>(
        () => ViewListTeamStudentPage(bloc: injector()),
        instanceName: Routes.viewListTeamStudent);

    injector.registerFactory<Widget>(
        () => ViewDetailTeamStudentPage(bloc: injector()),
        instanceName: Routes.viewDetailTeamStudent);

    //round
    injector.registerFactory<Widget>(
        () => ViewCompetitionRoundPage(bloc: injector()),
        instanceName: Routes.viewCompetitionRound);

    injector.registerFactory<Widget>(
        () => ViewCompetitionRoundResultPage(bloc: injector()),
        instanceName: Routes.viewCompetitionRoundResult);

    // match
    injector.registerFactory<Widget>(
      () => ViewListMatchPage(bloc: injector()), instanceName: Routes.viewListMatch);

    injector.registerFactory<Widget>(
      () => ViewDetailMatchPage(bloc: injector()), instanceName: Routes.viewDetailMatch);

    //--------------------------TASK
    //competition member task
    injector.registerFactory<Widget>(
        () => ViewCompetitionMemberTaskPage(bloc: injector()),
        instanceName: Routes.viewCompetitionMemberTask);

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

    injector.registerFactory<Widget>(() => EditMyAccountPage(bloc: injector()),
        instanceName: Routes.editMyAccount);

    //Club Page -> show Club
    injector.registerFactory<Widget>(() => ClubPage(bloc: injector()),
        instanceName: Routes.club);

    //Clubs View
    injector.registerFactory<Widget>(() => ClubsViewPage(bloc: injector()),
        instanceName: Routes.clubsView);

    injector.registerFactory<Widget>(
        () => ViewListCompetitionOfClubPage(bloc: injector()),
        instanceName: Routes.viewListCompetitionOfClub);

    //Task Page -> show Tasks
    // injector.registerFactory<Widget>(() => TaskPage(),
    //     instanceName: Routes.task);

    injector.registerFactory<Widget>(() => ClubViewDetailPage(bloc: injector()),
        instanceName: Routes.clubViewDetail);

    injector.registerFactory<Widget>(() => ViewListMemberPage(bloc: injector()),
        instanceName: Routes.viewListMember);

    injector.registerFactory<Widget>(
        () => ViewListCompetitionOfParticipantPage(bloc: injector()),
        instanceName: Routes.viewListCompetitionOfParticipant);
  }
}
