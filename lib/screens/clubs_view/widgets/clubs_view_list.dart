import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loadmore/loadmore.dart';

import '../../../bloc/clubs_view/clubs_view_bloc.dart';
import '../../../bloc/clubs_view/clubs_view_event.dart';
import '../../../bloc/clubs_view/clubs_view_state.dart';
import '../../../utils/dimens.dart';

class ListViewClubs extends StatefulWidget {
  @override
  State<ListViewClubs> createState() => _ListViewClubsState();
}

class _ListViewClubsState extends State<ListViewClubs> {
  void load(BuildContext context) {
    BlocProvider.of<ClubsViewBloc>(context).add(LoadAddMoreEvent());
  }

  //refresh
  void refresh(BuildContext context) {
    BlocProvider.of<ClubsViewBloc>(context).add(ClubsViewInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    ClubsViewBloc bloc = BlocProvider.of<ClubsViewBloc>(context);

    return BlocBuilder<ClubsViewBloc, ClubsViewState>(
      bloc: bloc,
      builder: (context, state) {
        return state.listClubsBelongToUniversity.isEmpty
            ? Center(
                child: Text('Không có dữ liệu danh sách các câu lạc bộ'),
              )
            : RefreshIndicator(
                onRefresh: () {
                  return _refresh(context);
                },
                child: LoadMore(
                  isFinish: state.hasNext == false,
                  onLoadMore: () {
                    return _loadMore(context);
                  },
                  whenEmptyLoad: false,
                  delegate: DefaultLoadMoreDelegate(),
                  textBuilder: DefaultLoadMoreTextBuilder.english,
                  child: ListView.builder(
                    //scrollDirection: Axis.vertical,
                    itemCount: state.listClubsBelongToUniversity.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          //storeBloc.add(NavigatorToStoreDetail(state.currentListStore[index].storeId));
                        },
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 4, bottom: 8, top: 15),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image(
                                    image: AssetImage(
                                        "assets/img/profile-screen-avatar.jpg"),
                                    width: 120,
                                    height: 110,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {
                              //     //nhấn vào đây sẽ di chuyển sang store detail
                              //     storeBloc.add(NavigatorToStoreDetail(state.currentListStore[index].storeId));
                              //   },
                              //   child:
                              // ),
                              SizedBox(
                                width: Dimens.size8,
                              ),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.listClubsBelongToUniversity[index]
                                          .name,
                                      style: TextStyle(
                                          fontSize: Dimens.size20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: Dimens.size10),
                                      child: Text(
                                          state
                                                  .listClubsBelongToUniversity[
                                                      index]
                                                  .isMember
                                              ? "Đã là thành viên"
                                              : "Chưa là thành viên",
                                          style: TextStyle(
                                              fontSize: Dimens.size16)),
                                    ),
                                    // Row(
                                    //     mainAxisAlignment: MainAxisAlignment.start,
                                    //     children: [
                                    //       // Image.asset(
                                    //       //   'assets/images/vnd.png',
                                    //       //   width: Dimens.size18,
                                    //       //   height: Dimens.size25,
                                    //       //   color: Colors.red,
                                    //       // ),
                                    //       SizedBox(width: Dimens.size5,),
                                    //       Text(
                                    //           state.currentListStore[index].phone,
                                    //           style: TextStyle(
                                    //               fontSize: Dimens.size20,
                                    //               color: Colors.red,
                                    //               fontWeight: FontWeight.bold
                                    //           )
                                    //       ),
                                    //     ]
                                    // ),
                                  ])
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
      },
    );
  }

  Future<bool> _loadMore(BuildContext context) async {
    print("onLoadMore");
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    BlocProvider.of<ClubsViewBloc>(context).add(IncrementalEvent());
    //lúc này stateModel cũng có r nhưng mà chưa có hàm render lại cái view
    //phải đưa cái hàm này vào trong để add event và có state
    load(context);
    return true;
  }

  Future<bool> _refresh(BuildContext context) async {
    print("onRefresh");
    BlocProvider.of<ClubsViewBloc>(context).add(RefreshEvent());
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    refresh(context);
    return true;
  }
}
