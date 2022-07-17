class Api {
  static String get uri => "https://unicec.ddns.net";
  //static String get uri => "https://10.0.2.2:44361/index.html";
  static String get authentication => "/api/v1/firebase";
  static String get activitiesEntity => "/api/vi/activities-entity";
  static String get cities => "/api/v1/cities";
  static String get clubs => "/api/v1/clubs";
  static String get clubsBelongToStudent => "/api/v1/clubs/user";
  static String get clubRoles => "/api/v1/club-roles";
  static String get competitions => "/api/v1/competitions";
  static String get competitionActivities => "/api/v1/competition-activities";
  static String get competitionEntities => "/api/v1/competition-entities";
  static String get competitionHistories => "/api/v1/competition-histories";
  static String get competitionRoles => "/api/v1/competition-roles";
  static String get competitionRounds => "/api/v1/competition-rounds";
  static String get competitionTypes => "/api/v1/competition-types";
  static String get departments => "/api/v1/departments";
  static String get entityTypes => "/api/v1/entity-types";
  static String get majors => "/api/v1/majors";
  static String get members => "/api/v1/members";
  static String get participants => "/api/v1/participants";
  static String get roles => "/api/v1/roles";
  static String get seedsWallets => "/api/v1/seeds-wallets";
  static String get teams => "/api/v1/teams";
  static String get teamsInRound => "/api/v1/teams-in-round";
  static String get universities => "/api/v1/universities";
  static String get users => "/api/v1/users";
  static String get usersUpdateWithJWT => "/api/v1/users/token";

  static String GetUrl({required String apiPath}) {
    return uri + apiPath;
  }
}
