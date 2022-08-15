import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unicec_mobi/bloc/notification/notification_state.dart';
import 'package:unicec_mobi/utils/base_bloc.dart';
import 'package:unicec_mobi/utils/log.dart';

import '../../models/entities/notification/notification_model.dart';
import 'notification_event.dart';

class NotificationBloc extends BaseBloc<NotificationEvent, NotificationState> {
  int pageSize = 10;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  
  set isLoading(bool isLoading){
    _isLoading = isLoading;
  }

  NotificationBloc()
      : super(NotificationState(
            notifications: [],
            currentNotifications: [],
            currentPage: 1,
            pageSize: 10,
            hasNext: false)) {
    on(((event, emit) async {
      if (event is LoadNotificationsEvent) {
        List<NotificationModel> notifications = [];
        QuerySnapshot<Map<String, dynamic>> querySnapshot =
            await FirebaseFirestore.instance.collection('Notification').get();

        Log.info("querySnapshot: ${querySnapshot.size}");    

        for (var element in querySnapshot.docs) {
          Map<String, dynamic> data = element.data();
          Log.info('data notification: $data');
          notifications.add(NotificationModel.fromJson(data));
        }
        notifications.sort();

        if (notifications.length > pageSize) {
          for (int i = 0; i < pageSize; i++) {
            state.currentNotifications.add(notifications[i]);
          }
          emit(state.copyWith(
              notifications, state.currentNotifications, 1, pageSize, true));
        } else {
          state.currentNotifications.addAll(notifications);
          emit(state.copyWith(
              notifications, state.currentNotifications, 1, pageSize, false));
        }
      }
      
      if (event is LoadMoreEvent) {
        int currentPage = state.currentPage + 1;
        bool hasNext = false;

        if (state.notifications.length > currentPage * pageSize) hasNext = true;

        for (int i = state.currentPage * pageSize;
            i < currentPage * pageSize;
            i++) {
          state.currentNotifications.add(state.notifications[i]);
        }
        emit(state.copyWith(state.notifications, state.currentNotifications,
            currentPage, pageSize, hasNext));
      } 
      
      if (event is RefreshNotificationsEvent) {
        emit(state.copyWith([], [], 1, pageSize, false));
      }
    }));
  }
}
