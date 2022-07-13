import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/bloc/splash/splash_bloc.dart';

class BlocDependencies {
  static Future setup(GetIt injector) async {
    injector.registerFactory<SplashBloc>(() => SplashBloc(injector()));
  }
}
