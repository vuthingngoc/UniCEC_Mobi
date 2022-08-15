import 'package:equatable/equatable.dart';
import 'package:unicec_mobi/models/entities/notification/notification_model.dart';

class NotificationState extends Equatable {
  final List<NotificationModel> notifications;
  final List<NotificationModel> currentNotifications;
  final int currentPage;
  final int pageSize;
  final bool hasNext;

  const NotificationState(
      {required this.notifications,
      required this.currentNotifications,
      required this.currentPage,
      required this.pageSize,
      required this.hasNext});

  NotificationState copyWith(
      List<NotificationModel> notifications, List<NotificationModel> currentNotifications, int? currentPage, int? pageSize, bool hasNext) {
    return NotificationState(
        notifications: notifications,
        currentNotifications: currentNotifications,
        currentPage: currentPage ?? 1,
        pageSize: pageSize ?? 10,
        hasNext: hasNext
    );
  }

  @override
  List<Object?> get props => [notifications, currentNotifications, currentPage, pageSize, hasNext];
}
