import 'package:equatable/equatable.dart';
import 'package:unicec_mobi/models/entities/notification/notification_model.dart';

class NotificationState extends Equatable {
  final List<NotificationModel> notifications;
  int currentPage;
  int pageSize;

  NotificationState(
      {required this.notifications,
      required this.currentPage,
      required this.pageSize});

  NotificationState copyWith(
      List<NotificationModel> notifications, int currentPage, int pageSize) {
    return NotificationState(
        notifications: notifications,
        currentPage: currentPage,
        pageSize: pageSize
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [notifications, currentPage, pageSize];
}
