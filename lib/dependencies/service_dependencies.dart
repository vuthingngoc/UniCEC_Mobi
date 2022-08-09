import 'package:get_it/get_it.dart';

import '../services/competition_detail_svc/competition_detail_service.dart';
import '../services/competition_detail_svc/i_competition_detail_service.dart';
import '../services/competition_round_svc/competition_round_service.dart';
import '../services/competition_round_svc/i_competition_round_service.dart';
import '../services/i_services.dart';
import '../services/services.dart';

class ServiceDependencies {
  static Future setup(GetIt injector) async {
    injector.registerFactory<ICityService>(() => CityService());

    //import splash service
    injector.registerFactory<ISplashService>(() => SplashService());

    //import login service
    injector.registerFactory<ILoginService>(() => LoginService());

    //import unversity_selection_service
    injector.registerFactory<IUniversitySelectionService>(
        () => UniversitySelectionService());

    injector.registerFactory<IUserService>(() => UserService());

    //import club_service
    injector.registerFactory<IClubService>(() => ClubService());

    //competition
    injector.registerFactory<ICompetitionService>(() => CompetitionService());
    
    injector.registerFactory<ICompetitionDetailService>(
        () => CompetitionDetailService());
    
    //round
    injector.registerFactory<ICompetitionRoundService>(
        () => CompetitionRoundService());

    //service
    injector.registerFactory<IViewListTeamService>(() => ViewListTeamService());
    injector.registerFactory<ITeamService>(() => TeamService());

    injector.registerFactory<ISeedsWalletService>(() => SeedsWalletService());

    injector.registerFactory<IMemberService>(() => MemberService());

    //competition activity
    injector.registerFactory<ICompetitionActivityService>(
        () => CompetitionActivityService());
  }
}
