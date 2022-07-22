import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Routes {
  static String get defaultRoute => '/';
  static String get main => '/main';
  static String get test => '/test';
  static String get competition => '/competition';
  static String get detailCompetition => '/detailCompetition';

  //
  static String get splash => '/splash';
  static String get home => '/home';
  static String get club => '/club';
  static String get clubSelection => '/clubSelection';
  static String get clubsView => '/clubsView';
  static String get profile => '/profile';
  static String get myAccount => '/profile/my-account';
  static String get universitySelection => '/universitySelection';
  static String get login => '/login';
  static String get task => '/task';

  static MaterialPageRoute getRoute(RouteSettings settings) {
    Widget widget;

    try {
      widget = GetIt.I.get<Widget>(instanceName: settings.name);
    } catch (e) {
      widget = Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text('Page not found nè'),
        ),
      );
    }
    return MaterialPageRoute(builder: (_) => widget, settings: settings);
  }
}
