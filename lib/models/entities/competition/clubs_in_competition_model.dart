class ClubsInCompetitionModel {
  int id;
  String name;
  String image;
  String fanpage;
  bool isOwner;

  ClubsInCompetitionModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.fanpage,
      required this.isOwner});

  factory ClubsInCompetitionModel.fromJson(Map<String, dynamic> json) {
    int id = json['id'];
    String name = json['name'];
    String image = json['image'];
    String fanpage = json['fanpage'];
    bool isOwner = json['is_owner'];

    return ClubsInCompetitionModel(
        id: id, name: name, image: image, fanpage: fanpage, isOwner: isOwner);
  }
}
