import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/bloc/club/club_bloc.dart';
import 'package:unicec_mobi/bloc/competition/competition_bloc.dart';
import 'package:unicec_mobi/bloc/login/login_bloc.dart';
import 'package:unicec_mobi/bloc/splash/splash_bloc.dart';
import 'package:unicec_mobi/bloc/university_selection/university_selection_bloc.dart';

import '../bloc/profile/profile_bloc.dart';

class BlocDependencies {
  static Future setup(GetIt injector) async {
    //spalsh bloc
    injector.registerFactory<SplashBloc>(() => SplashBloc(service: injector()));

    //import login bloc
    injector.registerFactory<LoginBloc>(() => LoginBloc(service: injector()));

    //import UniversitySelectionBloc
    injector.registerFactory<UniversitySelectionBloc>(
        () => UniversitySelectionBloc(service: injector()));

    injector.registerFactory<ProfileBloc>(() => ProfileBloc(service: injector()));

    //import ClubBloc
    injector.registerFactory<ClubBloc>(() => ClubBloc(service: injector()));

    injector.registerFactory<CompetitionBloc>(() => CompetitionBloc(service: injector()));
  }
}
