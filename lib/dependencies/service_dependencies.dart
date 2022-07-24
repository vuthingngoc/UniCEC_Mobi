import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/models/entities/team/team_model.dart';
import 'package:unicec_mobi/services/detail_competition_svc/detail_competition.dart';
import 'package:unicec_mobi/services/detail_competition_svc/i_detail_competition.dart';

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

    injector.registerFactory<ICompetitionService>(() => CompetitionService());
    injector.registerFactory<IDetailCompetitionService>(() => DetailCompetitionService());

    injector.registerFactory<ITeamService>(() => TeamService());

    injector.registerFactory<ISeedsWalletService>(() => SeedsWalletService());

    injector.registerFactory<IMemberService>(() => MemberService());

    injector.registerFactory<IViewListTeamService>(() => ViewListTeamService());
  }
}
