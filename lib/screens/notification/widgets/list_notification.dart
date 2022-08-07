import '../../../bloc/notification/notification_event.dart';
import 'package:loadmore/loadmore.dart';

import '../../../bloc/notification/notification_bloc.dart';
import '../../../bloc/notification/notification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../models/entities/notification/notification_model.dart';
import '../../../utils/dimens.dart';
import '../noti_detail_page.dart';

class ListNotification extends StatelessWidget {
  const ListNotification();
  
  Future _loadMore(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 0, milliseconds: 2000));
    BlocProvider.of<NotificationBloc>(context).add(LoadMoreEvent());
  }

  Future _refresh(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 0, milliseconds: 2000));
    BlocProvider.of<NotificationBloc>(context).add(RefreshNotificationsEvent());
    BlocProvider.of<NotificationBloc>(context).add(LoadNotificationsEvent());
  }
  @override
  Widget build(BuildContext context) {
    NotificationBloc _bloc = BlocProvider.of<NotificationBloc>(context);
    return BlocBuilder<NotificationBloc, NotificationState>(
        bloc: _bloc,
        builder: (context, state) {
          List<NotificationModel> list = state.currentNotifications;
          bool hasNext = state.hasNext;
          return list.isNotEmpty ?
          RefreshIndicator(
            onRefresh: () async{
              var refresh = _refresh(context);
              return refresh;
            },
            child: LoadMore(
              isFinish: !hasNext,
              onLoadMore: () async{
                await _loadMore(context);
                return true;
              },
              whenEmptyLoad: true,
              delegate: const DefaultLoadMoreDelegate(),
              textBuilder: DefaultLoadMoreTextBuilder.english,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(Dimens.size10),
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Dimens.size15),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(Dimens.size10),
                        margin: EdgeInsets.all(Dimens.size10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => NotiDetailPage(list[index])),
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                list[index].title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimens.size20,
                                ),
                                maxLines: 2,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      list[index].createdDate,
                                      style: TextStyle(
                                        color: Colors.black26,
                                        fontSize: Dimens.size15,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Dimens.size15,
                              ),
                              Text(
                                list[index].content,
                                style: TextStyle(fontSize: Dimens.size16),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ) : const Text('Đang tải...');
        });
  }  
}
