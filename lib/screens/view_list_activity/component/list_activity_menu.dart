import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loadmore/loadmore.dart';
import '../../../bloc/view_competition_activity/view_competition_activity_bloc.dart';
import '../../../bloc/view_competition_activity/view_competition_activity_event.dart';
import '../../../bloc/view_competition_activity/view_competition_activity_state.dart';
import '/models/enums/priority_status.dart';
import '../../../models/entities/competition_activity/competition_activity_model.dart';
import '../../../models/enums/competition_activity_status.dart';

class ViewListActivityMenu extends StatefulWidget {
  const ViewListActivityMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewListActivityMenu> createState() => _ViewListActivityMenuState();
}

class _ViewListActivityMenuState extends State<ViewListActivityMenu> {
  //load
  void load(BuildContext context) {
    BlocProvider.of<ViewCompetitionActivityBloc>(context)
        .add(LoadAddMoreEvent());
  }

  //refresh
  void refresh(BuildContext context) {
    BlocProvider.of<ViewCompetitionActivityBloc>(context)
        .add(ViewCompetitionActivityInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    // List<CompetitionActivityModel> fakeData = [
    //   CompetitionActivityModel(
    //     id: 1,
    //     competitionId: 1,
    //     createTime: "createTime",
    //     ending: "ending",
    //     name:
    //         "Task này dùng để test thôi Task này dùng để test thôi Task này dùng để test thôi Task này dùng để test thôi",
    //     creatorName: "Lam Minh An",
    //     priority: PriorityStatus.High,
    //     status: CompetitionActivityStatus.Open,
    //   ),
    //   CompetitionActivityModel(
    //     id: 2,
    //     competitionId: 1,
    //     createTime: "createTime",
    //     ending: "ending",
    //     name: "Task này dùng để test thôi",
    //     assigner: "Lam Minh An",
    //     priority: PriorityStatus.Medium,
    //     status: CompetitionActivityStatus.OnGoing,
    //   ),
    //   CompetitionActivityModel(
    //     id: 3,
    //     competitionId: 1,
    //     createTime: "createTime",
    //     ending: "ending",
    //     name: "Task này dùng để test thôi",
    //     assigner: "Lam Minh An",
    //     priority: PriorityStatus.Low,
    //     status: CompetitionActivityStatus.Pending,
    //   ),
    //   CompetitionActivityModel(
    //     id: 3,
    //     competitionId: 1,
    //     createTime: "createTime",
    //     ending: "ending",
    //     name: "Task này dùng để test thôi",
    //     assigner: "Lam Minh An",
    //     priority: PriorityStatus.Low,
    //     status: CompetitionActivityStatus.Finished,
    //   ),
    //   CompetitionActivityModel(
    //     id: 3,
    //     competitionId: 1,
    //     createTime: "createTime",
    //     ending: "ending",
    //     name: "Task này dùng để test thôi",
    //     assigner: "Lam Minh An",
    //     priority: PriorityStatus.Low,
    //     status: CompetitionActivityStatus.Completed,
    //   ),
    //   CompetitionActivityModel(
    //     id: 3,
    //     competitionId: 1,
    //     createTime: "createTime",
    //     ending: "ending",
    //     name: "Task này dùng để test thôi",
    //     assigner: "Lam Minh An",
    //     priority: PriorityStatus.Low,
    //     status: CompetitionActivityStatus.Cancelling,
    //   ),
    // ];

    //bloc
    ViewCompetitionActivityBloc bloc =
        BlocProvider.of<ViewCompetitionActivityBloc>(context);

    return BlocBuilder<ViewCompetitionActivityBloc,
            ViewCompetitionActivityState>(
        bloc: bloc,
        builder: (context, state) {
          return (state.listCompetitionActivity.isEmpty)
              ? Text('Chưa load dữ liệu')
              : RefreshIndicator(
                  onRefresh: () {
                    return _refresh(context);
                  },
                  child: LoadMore(
                      isFinish: !state.hasNext,
                      onLoadMore: () {
                        return _loadMore(context);
                      },
                      whenEmptyLoad: false,
                      delegate: DefaultLoadMoreDelegate(),
                      textBuilder: DefaultLoadMoreTextBuilder.english,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.listCompetitionActivity.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.black87,
                                padding: EdgeInsets.all(20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                backgroundColor:
                                    Color.fromARGB(255, 235, 237, 241),
                              ),
                              onPressed: () {},
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Text(
                                              state
                                                  .listCompetitionActivity[
                                                      index]
                                                  .id
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.grey)),
                                        ),
                                        Expanded(
                                          child: Text(
                                              state
                                                  .listCompetitionActivity[
                                                      index]
                                                  .name,
                                              style: TextStyle(fontSize: 18)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16.0, right: 8),
                                        child: Text("|",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.blueGrey)),
                                      ),
                                      Text(
                                          state.listCompetitionActivity[index]
                                              .creatorName,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal)),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16.0, right: 8),
                                        child: Text("|",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.blueGrey)),
                                      ),
                                      if (state.listCompetitionActivity[index]
                                              .status
                                              .toString() ==
                                          "CompetitionActivityStatus.OnGoing")
                                        Text(
                                          "Đang diễn ra",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.amber),
                                        ),
                                      if (state.listCompetitionActivity[index]
                                              .status
                                              .toString() ==
                                          "CompetitionActivityStatus.Open")
                                        Text(
                                          "Mở",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.purple),
                                        ),
                                      if (state.listCompetitionActivity[index]
                                              .status
                                              .toString() ==
                                          "CompetitionActivityStatus.Pending")
                                        Text(
                                          "Chờ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.deepOrangeAccent),
                                        ),
                                      if (state.listCompetitionActivity[index]
                                              .status
                                              .toString() ==
                                          "CompetitionActivityStatus.Finished")
                                        Text(
                                          "Hoàn thành",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.green),
                                        ),
                                      if (state.listCompetitionActivity[index]
                                              .status
                                              .toString() ==
                                          "CompetitionActivityStatus.Completed")
                                        Text(
                                          "Kết thúc",
                                          style: TextStyle(
                                              fontSize: 18, color: Colors.grey),
                                        ),
                                      if (state.listCompetitionActivity[index]
                                              .status
                                              .toString() ==
                                          "CompetitionActivityStatus.Cancelling")
                                        Text(
                                          "Hủy",
                                          style: TextStyle(
                                              fontSize: 18, color: Colors.red),
                                        ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16.0, right: 8),
                                        child: Text("|",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.blueGrey)),
                                      ),
                                      if (state.listCompetitionActivity[index]
                                              .priority
                                              .toString() ==
                                          "PriorityStatus.High")
                                        Icon(
                                          Icons.warning,
                                          color: Colors.red,
                                        ),
                                      if (state.listCompetitionActivity[index]
                                              .priority
                                              .toString() ==
                                          "PriorityStatus.Medium")
                                        Icon(
                                          Icons.warning,
                                          color: Colors.amber,
                                        ),
                                      if (state.listCompetitionActivity[index]
                                              .priority
                                              .toString() ==
                                          "PriorityStatus.Low")
                                        Icon(
                                          Icons.warning,
                                          color: Colors.green,
                                        )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )));
        });
  }

  Future<bool> _loadMore(BuildContext context) async {
    print("onLoadMore");
    await Future.delayed(Duration(seconds: 0, milliseconds: 5000));
    BlocProvider.of<ViewCompetitionActivityBloc>(context)
        .add(IncrementalEvent());
    //lúc này stateModel cũng có r nhưng mà chưa có hàm render lại cái view
    //phải đưa cái hàm này vào trong để add event và có state
    load(context);
    return true;
  }

  Future<bool> _refresh(BuildContext context) async {
    print("onRefresh");
    BlocProvider.of<ViewCompetitionActivityBloc>(context).add(RefreshEvent());
    await Future.delayed(Duration(seconds: 0, milliseconds: 5000));
    refresh(context);
    return true;
  }
}
