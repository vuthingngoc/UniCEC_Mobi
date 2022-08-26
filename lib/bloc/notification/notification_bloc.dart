import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/bloc/notification/notification_state.dart';
import 'package:unicec_mobi/models/common/paging_request.dart';
import 'package:unicec_mobi/utils/base_bloc.dart';

import '../../models/common/current_user.dart';
import '../../models/common/paging_result.dart';
import '../../models/entities/notification/notification_model.dart';
import '../../services/notification_svc/i_notification_service.dart';
import 'notification_event.dart';

class NotificationBloc extends BaseBloc<NotificationEvent, NotificationState> {
  INotificationService service;

  int pageSize = 10;
  // bool _isLoading = false;

  // bool get isLoading => _isLoading;

  // set isLoading(bool isLoading) {
  //   _isLoading = isLoading;
  // }

  NotificationBloc({required this.service})
      : super(NotificationState(
            loading: true,
            notifications: PagingResult<NotificationModel>(
                currentPage: 1,
                hasNext: false,
                hasPrevious: false,
                items: [],
                pageSize: 10,
                totalCount: 0,
                totalPages: 1))) {
    on(((event, emit) async {
      int userId = GetIt.I.get<CurrentUser>().id;
      if (event is LoadNotificationsEvent) {
        // List<NotificationModel> notifications = [];
        // QuerySnapshot<Map<String, dynamic>> querySnapshot =
        //     await FirebaseFirestore.instance.collection('Notification').get();

        // Log.info("querySnapshot: ${querySnapshot.size}");

        // for (var element in querySnapshot.docs) {
        //   Map<String, dynamic> data = element.data();
        //   Log.info('data notification: $data');
        //   notifications.add(NotificationModel.fromJson(data));
        // }
        // notifications.sort();

        // if (notifications.length > pageSize) {
        //   for (int i = 0; i < pageSize; i++) {
        //     state.currentNotifications.add(notifications[i]);
        //   }
        //   emit(state.copyWith(
        //       notifications, state.currentNotifications, 1, pageSize, true));
        // } else {
        //   state.currentNotifications.addAll(notifications);
        //   emit(state.copyWith(
        //       notifications, state.currentNotifications, 1, pageSize, false));
        // }
        PagingResult<NotificationModel>? notifications =
            await service.GetAllNotisByUser(userId, null);
        emit(state.copyWith(notifications: notifications, loading: false));
      }

      if (event is LoadMoreEvent) {
        int currentPage = (state.notifications?.currentPage)! + 1;
        PagingRequest request =
            PagingRequest(currentPage: currentPage, pageSize: 10);

        PagingResult<NotificationModel>? notifications =
            await service.GetAllNotisByUser(userId, request);
        emit(
            state.copyWith(notifications: state.notifications, loading: false));
      }

      if (event is RefreshNotificationsEvent) {
        emit(state.copyWith(
            notifications: PagingResult<NotificationModel>(
              currentPage: 1,
              hasNext: false,
              hasPrevious: false,
              items: [],
              pageSize: 10,
              totalCount: 0,
              totalPages: 1,
            ),
            loading: true));
      }

      if (event is LoadingEvent) {
        emit(state.copyWith(loading: true, notifications: state.notifications));
      }
    }));
  }
}
