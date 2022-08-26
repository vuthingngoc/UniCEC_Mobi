import 'package:equatable/equatable.dart';
import 'package:unicec_mobi/models/common/paging_result.dart';
import 'package:unicec_mobi/models/entities/notification/notification_model.dart';

class NotificationState extends Equatable {
  // final List<NotificationModel>? notifications;
  // final List<NotificationModel>? currentNotifications;
  // final int currentPage;
  // final int pageSize;
  // final bool? hasNext;
  final PagingResult<NotificationModel>? notifications;
  final bool loading;

  NotificationState({this.notifications, required this.loading});

  NotificationState copyWith(
      {PagingResult<NotificationModel>? notifications, required bool loading}) {
    return NotificationState(notifications: notifications, loading: loading);
  }

  @override
  List<Object?> get props => [notifications, loading];
}
