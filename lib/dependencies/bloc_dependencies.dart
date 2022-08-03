import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/bloc/add_team_dialog/add_team_dialog_bloc.dart';
import '/bloc/club/club_bloc.dart';
import '/bloc/clubs_view/clubs_view_bloc.dart';
import '/bloc/competition/competition_bloc.dart';
import '/bloc/home/home_bloc.dart';
import '/bloc/login/login_bloc.dart';
import '/bloc/my_account/my_account_bloc.dart';
import '/bloc/splash/splash_bloc.dart';
import '/bloc/university_selection/university_selection_bloc.dart';
import '/services/services.dart';
import '../bloc/club_selection/club_selection_bloc.dart';
import '../bloc/club_view_detail/club_view_detail_bloc.dart';
import '../bloc/event/event_bloc.dart';
import '../bloc/main/main_bloc.dart';
import '../bloc/profile/profile_bloc.dart';
import '../bloc/seeds_wallet/seeds_wallet_bloc.dart';
import '../bloc/team/team_bloc.dart';
import '../bloc/view_competition_activity/view_competition_activity_bloc.dart';
import '../bloc/view_competition_member_task/view_competition_member_task_bloc.dart';
import '../bloc/view_detail_activity/view_detail_activity_bloc.dart';
import '../bloc/view_list_team/view_list_team_bloc.dart';

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

    injector.registerSingleton<CompetitionBloc>(
        CompetitionBloc(service: injector()));

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

    // import view competition activity
    injector.registerFactory<ViewCompetitionActivityBloc>(
        () => ViewCompetitionActivityBloc(service: injector()));

    // import view detail competition activity
    injector.registerFactory<ViewDetailActivityBloc>(
        () => ViewDetailActivityBloc(service: injector()));

    // import view list teams
    injector.registerSingleton<ViewListTeamBloc>(
        ViewListTeamBloc(service: injector()));

    //import add team dialog
    injector.registerFactory<AddTeamDialogBloc>(() => AddTeamDialogBloc());
  }
}
