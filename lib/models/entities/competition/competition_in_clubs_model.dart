class CompetitionInClubsModel {
  int id;
  String name;
  String image;
  String fanpage;
  bool isOwner;

  CompetitionInClubsModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.fanpage,
      required this.isOwner});

  factory CompetitionInClubsModel.fromJson(Map<String, dynamic> json) {
    int id = json['id'];
    String name = json['name'];
    String image = json['image'];
    String fanpage = json['fanpage'];
    bool isOwner = json['is_owner'];

    return CompetitionInClubsModel(
        id: id, name: name, image: image, fanpage: fanpage, isOwner: isOwner);
  }
}
