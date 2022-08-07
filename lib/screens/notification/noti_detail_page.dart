import 'package:flutter/material.dart';

import '../../models/entities/notification/notification_model.dart';
import '../../utils/app_color.dart';
import '../../utils/dimens.dart';

class NotiDetailPage extends StatelessWidget {
  final NotificationModel notification;
  const NotiDetailPage(this.notification);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text('Chi tiết'),
      ),
      body: Card(
        margin: EdgeInsets.all(Dimens.size10),
        elevation: Dimens.size4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.size15),
        ),
        child: Container(
          padding: EdgeInsets.all(Dimens.size10),
          margin: EdgeInsets.all(Dimens.size10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Dimens.size20,
                ),
              ),
              SizedBox(
                height: Dimens.size15,
              ),
              Text(
                notification.createdDate,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: Dimens.size15,
                ),
              ),
              SizedBox(
                height: Dimens.size15,
              ),
              const Divider(
                color: Colors.black26,
              ),
              SizedBox(
                height: Dimens.size15,
              ),
              Text(
                notification.content,
                style: TextStyle(
                  fontSize: Dimens.size16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
