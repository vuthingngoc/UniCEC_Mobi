import 'package:intl/intl.dart';

class NotificationModel implements Comparable<NotificationModel> {
  int id;
  String title;
  String content;
  DateTime sortDate;
  String createdDate;

  NotificationModel(
      {required this.id,
      required this.title,
      required this.content,
      required this.sortDate,
      required this.createdDate});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    int id = json['Id'] ?? 0;
    String title = json['Title'] ?? '';
    String content = json['Content'] ?? '';
    DateTime sortDate = DateTime.parse(json['SortDate']);
    String createdDate = DateFormat('dd-MM-yyyy HH:mm').format(sortDate);

    return NotificationModel(
        id: id,
        title: title,
        content: content,
        sortDate: sortDate,
        createdDate: createdDate);
  }

  @override
  int compareTo(NotificationModel other){
    int order = other.sortDate.compareTo(sortDate);
    return order;
  }
}
