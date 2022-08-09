class ParticipantModel{
  int id;
  int competitionId;
  String studentId;
  String avatar;
  DateTime registerTime;

  ParticipantModel({
    required this.id,
    required this.competitionId,
    required this.studentId,
    required this.avatar,
    required this.registerTime
  });

  factory ParticipantModel.fromJson(Map<String, dynamic> json){
    int id = json['id'] ?? 0;
    int competitionId = json['competition_id'] ?? 0;
    String studentId = json['student_id'] ?? 0;
    String avatar = json['avatar'] ?? '';
    DateTime registerTime = DateTime.parse(json['register_time']);

    return ParticipantModel(
      id: id, 
      competitionId: competitionId, 
      studentId: studentId, 
      avatar: avatar,
      registerTime: registerTime
    );
  }
}