import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/utils/router.dart';
import '../screens/pages.dart';

class PageDependencies {
  static Future setup(GetIt injector) async {
    //splash
    injector.registerFactory<Widget>(() => SplashPage(injector()),
        instanceName: Routes.splash);

    //login
    injector.registerFactory<Widget>(() => LoginPage(injector()),
        instanceName: Routes.login);

    //university selection page
    injector.registerFactory<Widget>(() => UniversitySelectionPage(injector()),
        instanceName: Routes.universitySelection);

    //HomePage -> show Cuộc Thi và Sự Kiện
    injector.registerFactory<Widget>(() => Home(), instanceName: Routes.home);

    //Profile Page -> show thông tin Student
    injector.registerFactory<Widget>(() => Profile(),
        instanceName: Routes.profile);

    //Club Page -> show Club
    injector.registerFactory<Widget>(() => ClubPage(),
        instanceName: Routes.club);

    //Task Page -> show Tasks
    injector.registerFactory<Widget>(() => TaskPage(),
        instanceName: Routes.task);
  }
}
