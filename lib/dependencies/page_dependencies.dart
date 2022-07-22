import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/screens/detail_competition/detail_competition.dart';
import 'package:unicec_mobi/utils/router.dart';
import '../screens/main_page/main_page.dart';
import '../screens/pages.dart';

class PageDependencies {
  static Future setup(GetIt injector) async {

    injector.registerFactory<Widget>(() => MainPage(injector()), instanceName: Routes.main);

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

    //HomePage -> show Cuộc Thi và Sự Kiện
    injector.registerFactory<Widget>(() => Home(), instanceName: Routes.home);


    //Profile Page -> show general info Student
    injector.registerFactory<Widget>(() => DetailCompetition(), instanceName: Routes.detailCompetition);

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
  }
}
