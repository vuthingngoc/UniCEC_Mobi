class MemberTakesActivityModel{
  int id;
  int competitionActivityId;
  int memberId;
  String memberName;
  int bookerId;
  String bookerName;

  MemberTakesActivityModel({
    required this.id,
    required this.competitionActivityId,
    required this.memberId,
    required this.memberName,
    required this.bookerId,
    required this.bookerName
  });

  factory MemberTakesActivityModel.fromJson(Map<String, dynamic> json){
    int id = json['id'];
    int competitionActivityId = json['competition_activity_id'];
    int memberId = json['member_id'];
    String memberName = json['member_name'];
    int bookerId = json['booker_id'];
    String bookerName = json['booker_name'];

    return MemberTakesActivityModel(
      id: id, 
      competitionActivityId: competitionActivityId, 
      memberId: memberId, 
      memberName: memberName, 
      bookerId: bookerId, 
      bookerName: bookerName
    );
  }
}