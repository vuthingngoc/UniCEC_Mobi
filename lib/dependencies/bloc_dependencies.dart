import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/bloc/club/club_bloc.dart';
import 'package:unicec_mobi/bloc/clubs_view/clubs_view_bloc.dart';
import 'package:unicec_mobi/bloc/competition/competition_bloc.dart';
import 'package:unicec_mobi/bloc/home/home_bloc.dart';
import 'package:unicec_mobi/bloc/login/login_bloc.dart';
import 'package:unicec_mobi/bloc/my_account/my_account_bloc.dart';
import 'package:unicec_mobi/bloc/splash/splash_bloc.dart';
import 'package:unicec_mobi/bloc/university_selection/university_selection_bloc.dart';
import 'package:unicec_mobi/services/services.dart';
import '../bloc/club_selection/club_selection_bloc.dart';
import '../bloc/club_view_detail/club_view_detail_bloc.dart';
import '../bloc/event/event_bloc.dart';
import '../bloc/main/main_bloc.dart';
import '../bloc/profile/profile_bloc.dart';
import '../bloc/seeds_wallet/seeds_wallet_bloc.dart';
import '../bloc/team/team_bloc.dart';
import '../bloc/view_competition_member_task/view_competition_member_task_bloc.dart';

class BlocDependencies {
  static Future setup(GetIt injector) async {
    //mainBloc
    injector.registerFactory<MainBloc>(() => MainBloc());

    //spalsh bloc
    injector.registerFactory<SplashBloc>(() => SplashBloc(service: injector()));

    //import login bloc
    injector.registerFactory<LoginBloc>(() => LoginBloc(service: injector()));

    //import UniversitySelectionBloc
    injector.registerFactory<UniversitySelectionBloc>(
        () => UniversitySelectionBloc(service: injector()));

    //import ClubSelectionBloc
    injector.registerFactory<ClubSelectionBloc>(
        () => ClubSelectionBloc(service: injector()));

    injector
        .registerFactory<ProfileBloc>(() => ProfileBloc(service: injector()));

    injector.registerFactory<MyAccountBloc>(
        () => MyAccountBloc(service: injector()));

    //import ClubBloc
    injector.registerFactory<ClubBloc>(() => ClubBloc(service: injector()));

    injector.registerFactory<CompetitionBloc>(
        () => CompetitionBloc(service: injector()));

    injector.registerFactory<EventBloc>(() => EventBloc(service: injector()));

    injector.registerFactory<TeamBloc>(() => TeamBloc(service: injector()));

    injector.registerFactory<SeedsWalletBloc>(
        () => SeedsWalletBloc(service: injector()));
    //import Club View Bloc
    injector.registerFactory<ClubsViewBloc>(
        () => ClubsViewBloc(service: injector()));

    injector.registerFactory<HomeBloc>(() => HomeBloc(service: injector()));

    injector.registerFactory<ClubViewDetailBloc>(
        () => ClubViewDetailBloc(service: injector()));

    // improt view competition member task
    injector.registerFactory<ViewCompetitionMemberTaskBloc>(
        () => ViewCompetitionMemberTaskBloc(service: injector()));
  }
}
