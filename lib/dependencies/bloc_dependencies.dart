import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/bloc/login/login_bloc.dart';
import 'package:unicec_mobi/bloc/splash/splash_bloc.dart';
import 'package:unicec_mobi/bloc/university_selection/university_selection_bloc.dart';

class BlocDependencies {
  static Future setup(GetIt injector) async {
    injector.registerFactory<SplashBloc>(() => SplashBloc(injector()));

    //import login bloc
    injector.registerFactory<LoginBloc>(() => LoginBloc(injector()));

    //import UniversitySelectionBloc
    injector.registerFactory<UniversitySelectionBloc>(
        () => UniversitySelectionBloc(injector()));
  }
}
