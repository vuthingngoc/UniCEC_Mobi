import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:loadmore/loadmore.dart';
import 'package:unicec_mobi/bloc/view_competition_member_task/view_competition_member_task_event.dart';
import 'package:unicec_mobi/models/common/current_user.dart';
import 'package:unicec_mobi/models/entities/competition/competition_model.dart';
import 'package:unicec_mobi/models/enums/competition_scope_status.dart';
import '../../../bloc/view_competition_member_task/view_competition_member_task_bloc.dart';
import '../../../bloc/view_competition_member_task/view_competition_member_task_state.dart';
import '../../../models/enums/competition_status.dart';
import '../../../utils/router.dart';

class ViewCompetitionMemberTaskMenu extends StatefulWidget {
  const ViewCompetitionMemberTaskMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewCompetitionMemberTaskMenu> createState() =>
      _ViewCompetitionMemberTaskMenuState();
}

class _ViewCompetitionMemberTaskMenuState
    extends State<ViewCompetitionMemberTaskMenu> {
  //load
  void load(BuildContext context) {
    BlocProvider.of<ViewCompetitionMemberTaskBloc>(context)
        .add(LoadAddMoreEvent());
  }

  //refresh
  void refresh(BuildContext context) {
    BlocProvider.of<ViewCompetitionMemberTaskBloc>(context).add(InitEvent());
  }

  @override
  Widget build(BuildContext context) {
    // List<CompetitionModel> fakeData = [
    //   CompetitionModel(
    //     view: 26,
    //     name: 'Competition này được dùng để test thôi, không có gì cả',
    //     clubsInCompetition: [],
    //     scope: CompetitionScopeStatus.Club,
    //     competitionTypeId: 2,
    //     competitionEntities: [],
    //     universityId: 1,
    //     competitionTypeName: ' check check',
    //     status: CompetitionStatus.OnGoing,
    //     startTime: "29/07/2022 5:300",
    //     createTime: '29/07/2022 5:30:00',
    //     majorsInCompetition: [],
    //     isSponsor: true,
    //     id: 1,
    //   ),
    //   CompetitionModel(
    //     view: 26,
    //     name: 'Competition này được dùng để test thôi, không có gì cả',
    //     clubsInCompetition: [],
    //     scope: CompetitionScopeStatus.Club,
    //     competitionTypeId: 2,
    //     competitionEntities: [],
    //     universityId: 1,
    //     competitionTypeName: ' check check',
    //     status: CompetitionStatus.Pending,
    //     startTime: "29/07/2022 5:300",
    //     createTime: '29/07/2022 5:30:00',
    //     majorsInCompetition: [],
    //     isSponsor: true,
    //     id: 1,
    //   ),
    //   CompetitionModel(
    //     view: 26,
    //     name: 'Competition này ',
    //     clubsInCompetition: [],
    //     scope: CompetitionScopeStatus.Club,
    //     competitionTypeId: 2,
    //     competitionEntities: [],
    //     universityId: 1,
    //     competitionTypeName: ' check check',
    //     status: CompetitionStatus.OnGoing,
    //     startTime: "29/07/2022 5:300",
    //     createTime: '29/07/2022 5:30:00',
    //     majorsInCompetition: [],
    //     isSponsor: true,
    //     id: 1,
    //   ),
    //   CompetitionModel(
    //     view: 26,
    //     name: 'Competition này được dùn',
    //     clubsInCompetition: [],
    //     scope: CompetitionScopeStatus.Club,
    //     competitionTypeId: 2,
    //     competitionEntities: [],
    //     universityId: 1,
    //     competitionTypeName: ' check check',
    //     status: CompetitionStatus.Finish,
    //     startTime: "29/07/2022 5:300",
    //     createTime: '29/07/2022 5:30:00',
    //     majorsInCompetition: [],
    //     isSponsor: true,
    //     id: 1,
    //   ),
    // ];
    //bloc
    ViewCompetitionMemberTaskBloc bloc =
        BlocProvider.of<ViewCompetitionMemberTaskBloc>(context);
    return BlocBuilder<ViewCompetitionMemberTaskBloc,
        ViewCompetitionMemberTaskState>(
      bloc: bloc,
      builder: (context, state) {
        return (GetIt.I.get<CurrentUser>().clubIdSelected == 0)
            ? Text('Bạn chưa chọn CLB xin mời Chọn CLB')
            : (state.listCompetition.isEmpty)
                ? Text('Task trống')
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
                        itemCount: state.listCompetition.length,
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
                              onPressed: () {
                                //chuyển sang trang detail
                                Navigator.of(context).pushNamed(
                                    Routes.viewListActivity,
                                    arguments: state.listCompetition[index].id);
                              },
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
                                              state.listCompetition[index].id
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.grey)),
                                        ),
                                        Expanded(
                                          child: Text(
                                              state.listCompetition[index].name,
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
                                          state
                                              .listCompetition[index].createTime
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey)),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16.0, right: 8),
                                        child: Text("|",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.blueGrey)),
                                      ),
                                      if (state.listCompetition[index].status ==
                                          CompetitionStatus.Register)
                                        Text(
                                          "Mở đăng ký",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.green),
                                        ),
                                      if (state.listCompetition[index].status ==
                                          CompetitionStatus.OnGoing)
                                        Text(
                                          "Đang diễn ra",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.amber),
                                        ),
                                      if (state.listCompetition[index].status ==
                                          CompetitionStatus.Publish)
                                        Text(
                                          "Mở",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.purple),
                                        ),
                                      if (state.listCompetition[index].status ==
                                          CompetitionStatus.Pending)
                                        Text(
                                          "Chờ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.deepOrangeAccent),
                                        ),
                                      if (state.listCompetition[index].status ==
                                          CompetitionStatus.Finish)
                                        Text(
                                          "Hoàn thành",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.green),
                                        ),
                                      if (state.listCompetition[index].status ==
                                          CompetitionStatus.Complete)
                                        Text(
                                          "Kết thúc",
                                          style: TextStyle(
                                              fontSize: 18, color: Colors.grey),
                                        ),
                                      if (state.listCompetition[index].status ==
                                          CompetitionStatus.Cancel)
                                        Text(
                                          "Hủy",
                                          style: TextStyle(
                                              fontSize: 18, color: Colors.red),
                                        ),
                                    ],
                                  ),
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
    await Future.delayed(Duration(seconds: 0, milliseconds: 5000));
    BlocProvider.of<ViewCompetitionMemberTaskBloc>(context)
        .add(IncrementalEvent());
    //lúc này stateModel cũng có r nhưng mà chưa có hàm render lại cái view
    //phải đưa cái hàm này vào trong để add event và có state
    load(context);
    return true;
  }

  Future<bool> _refresh(BuildContext context) async {
    print("onRefresh");
    BlocProvider.of<ViewCompetitionMemberTaskBloc>(context).add(RefreshEvent());
    await Future.delayed(Duration(seconds: 0, milliseconds: 5000));
    refresh(context);
    return true;
  }
}
