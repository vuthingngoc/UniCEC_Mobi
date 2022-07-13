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

    //template
    injector.registerFactory<Widget>(() => Home(), instanceName: Routes.home);
  }
}
