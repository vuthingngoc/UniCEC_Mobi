import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unicec_mobi/bloc/notification/notification_state.dart';
import 'package:unicec_mobi/utils/base_bloc.dart';

import '../../models/entities/notification/notification_model.dart';
import 'notification_event.dart';

class NotificationBloc extends BaseBloc<NotificationEvent, NotificationState>{
  int pageSize = 10;

  NotificationBloc() : super(NotificationState(notifications: [], currentPage: 1, pageSize: 10)){
    on(((event, emit) async {
      if(event is LoadNotificationsEvent){
        List<NotificationModel> notifications = [];
        QuerySnapshot<Map<String, dynamic>> querySnapshot = 
          await FirebaseFirestore.instance.collection('Notification').get();
        
        for(var element in querySnapshot.docs){
          Map<String, dynamic> data = element.data();
          notifications.add(NotificationModel.fromJson(data));
        }
        notifications.sort();

        if(notifications.length > pageSize){
          for(int i = 0; i < pageSize; i++){
            // state.
          }
        }
      }
    }));
  }

}