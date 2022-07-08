import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Routes{
  static String get defaultRoute => '/';
  static String get login => '/login';
  static String get main => '/main';
  static String get profile => '/profile';
  static String get competition => '/competition';
  static String get club => '/club';
  
  static MaterialPageRoute getRoute(RouteSettings settings){
    Widget widget;

    try{
      widget = GetIt.I.get<Widget>(instanceName: settings.name);
    }catch(e){
      widget = Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text('Page not found'),
        ),
      );
    }

    return MaterialPageRoute(builder: (_) => widget, settings: settings);
  }
}