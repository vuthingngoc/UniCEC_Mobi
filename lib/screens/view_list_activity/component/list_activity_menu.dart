import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loadmore/loadmore.dart';
import '../../../bloc/view_competition_activity/view_competition_activity_bloc.dart';
import '../../../bloc/view_competition_activity/view_competition_activity_event.dart';
import '../../../bloc/view_competition_activity/view_competition_activity_state.dart';
import '../../../constants/Theme.dart';
import '../../../utils/loading.dart';
import '../../../utils/router.dart';
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
  var _controller = TextEditingController();

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
    //size
    Size size = MediaQuery.of(context).size;
    //bloc
    ViewCompetitionActivityBloc bloc =
        BlocProvider.of<ViewCompetitionActivityBloc>(context);

    return BlocBuilder<ViewCompetitionActivityBloc,
            ViewCompetitionActivityState>(
        bloc: bloc,
        builder: (context, state) {
          return Column(
            children: [
              //tìm kiếm
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextFormField(
                          controller: _controller,
                          onFieldSubmitted: (value) {
                            bloc.add(ChangeSearchNameEvent(searchName: value));
                          },
                          autofocus: false,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  _controller.clear;
                                  _controller.text = "";
                                  //sửa lại cái
                                  bloc.add(
                                      ChangeSearchNameEvent(searchName: null));
                                },
                                icon: const Icon(Icons.clear)),
                            labelText: 'Tìm theo tên',
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        //
                        bloc.add(LoadingEvent());
                        //
                        bloc.add(SearchEvent());
                      },
                      child: Icon(Icons.search),
                    ),
                  ],
                ),
              ),

              //dropdown status
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Trạng thái công việc:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: size.width * 0.3,
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: BlocBuilder<ViewCompetitionActivityBloc,
                                ViewCompetitionActivityState>(
                            bloc: bloc,
                            builder: (context, state) {
                              CompetitionActivityStatus dropdownValue =
                                  state.chooseStatus;
                              return DropdownButtonHideUnderline(
                                child:
                                    DropdownButton<CompetitionActivityStatus>(
                                  value: dropdownValue,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: const TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold),
                                  onChanged:
                                      (CompetitionActivityStatus? newValue) {
                                    //
                                    bloc.add(LoadingEvent());
                                    //
                                    bloc.add(ChangeValueStatusEvent(
                                        chooseStatus: newValue!));
                                  },
                                  items: state.loadListStatuses.map<
                                          DropdownMenuItem<
                                              CompetitionActivityStatus>>(
                                      (CompetitionActivityStatus value) {
                                    return DropdownMenuItem<
                                            CompetitionActivityStatus>(
                                        value: value,
                                        child: Text((value ==
                                                CompetitionActivityStatus.All)
                                            ? 'Tất cả'
                                            : (value ==
                                                    CompetitionActivityStatus
                                                        .Open)
                                                ? 'Mở'
                                                : (value ==
                                                        CompetitionActivityStatus
                                                            .OnGoing)
                                                    ? 'Đang làm'
                                                    : (value ==
                                                            CompetitionActivityStatus
                                                                .Finished)
                                                        ? 'Đợi duyệt'
                                                        : (value ==
                                                                CompetitionActivityStatus
                                                                    .Completed)
                                                            ? 'Kết thúc'
                                                            : (value ==
                                                                    CompetitionActivityStatus
                                                                        .Pending)
                                                                ? 'Chờ'
                                                                : 'trạng thái khác'));
                                  }).toList(),
                                ),
                              );
                            }),
                      ),
                    ]),
              ),

              //dropdown priority
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Mức độ công việc:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: size.width * 0.3,
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: BlocBuilder<ViewCompetitionActivityBloc,
                                ViewCompetitionActivityState>(
                            bloc: bloc,
                            builder: (context, state) {
                              PriorityStatus dropdownValue =
                                  state.choosePriorityStatus;
                              return DropdownButtonHideUnderline(
                                child: DropdownButton<PriorityStatus>(
                                  value: dropdownValue,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: const TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold),
                                  onChanged: (PriorityStatus? newValue) {
                                    //
                                    bloc.add(LoadingEvent());
                                    //
                                    bloc.add(ChangeValuePriorityStatusEvent(
                                        choosePriorityStatus: newValue!));
                                  },
                                  items: state.loadPriorityStatus
                                      .map<DropdownMenuItem<PriorityStatus>>(
                                          (PriorityStatus value) {
                                    return DropdownMenuItem<PriorityStatus>(
                                        value: value,
                                        child: Text((value ==
                                                PriorityStatus.All)
                                            ? 'Tất cả'
                                            : (value == PriorityStatus.Low)
                                                ? 'Thấp'
                                                : (value ==
                                                        PriorityStatus.Medium)
                                                    ? 'Trung bình'
                                                    : (value ==
                                                            PriorityStatus.High)
                                                        ? 'Cao'
                                                        : 'trạng thái khác'));
                                  }).toList(),
                                ),
                              );
                            }),
                      ),
                    ]),
              ),

              //
              (state.isLoading &&
                      (state.listCompetitionActivity.isEmpty ||
                          state.listCompetitionActivity.isNotEmpty))
                  ? Loading()
                  : (state.listCompetitionActivity.isNotEmpty)
                      ? RefreshIndicator(
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
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        backgroundColor:
                                            Color.fromARGB(255, 235, 237, 241),
                                      ),
                                      onPressed: () async {
                                        //chuyển sang trang detail competition activity
                                        bool returnData = await Navigator.of(
                                                context)
                                            .pushNamed(
                                                Routes.viewDetailActivity,
                                                arguments: state
                                                    .listCompetitionActivity[
                                                        index]
                                                    .id) as bool;
                                        if (returnData) {
                                          bloc.add(LoadingEvent());
                                          bloc.add(SearchEvent());
                                        }
                                      },
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0),
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
                                                      style: TextStyle(
                                                          fontSize: 18)),
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
                                                        color:
                                                            Colors.blueGrey)),
                                              ),
                                              Text(
                                                  state
                                                      .listCompetitionActivity[
                                                          index]
                                                      .creatorName,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.normal)),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16.0, right: 8),
                                                child: Text("|",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color:
                                                            Colors.blueGrey)),
                                              ),
                                              if (state
                                                      .listCompetitionActivity[
                                                          index]
                                                      .status
                                                      .toString() ==
                                                  "CompetitionActivityStatus.OnGoing")
                                                Text(
                                                  "Đang diễn ra",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.amber),
                                                ),
                                              if (state
                                                      .listCompetitionActivity[
                                                          index]
                                                      .status
                                                      .toString() ==
                                                  "CompetitionActivityStatus.Open")
                                                Text(
                                                  "Mở",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.purple),
                                                ),
                                              if (state
                                                      .listCompetitionActivity[
                                                          index]
                                                      .status
                                                      .toString() ==
                                                  "CompetitionActivityStatus.Pending")
                                                Text(
                                                  "Chờ",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors
                                                          .deepOrangeAccent),
                                                ),
                                              if (state
                                                      .listCompetitionActivity[
                                                          index]
                                                      .status
                                                      .toString() ==
                                                  "CompetitionActivityStatus.Finished")
                                                Text(
                                                  "Đợi duyệt",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.green),
                                                ),
                                              if (state
                                                      .listCompetitionActivity[
                                                          index]
                                                      .status
                                                      .toString() ==
                                                  "CompetitionActivityStatus.Completed")
                                                Text(
                                                  "Kết thúc",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey),
                                                ),
                                              if (state
                                                      .listCompetitionActivity[
                                                          index]
                                                      .status
                                                      .toString() ==
                                                  "CompetitionActivityStatus.Cancelling")
                                                Text(
                                                  "Hủy",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.red),
                                                ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16.0, right: 8),
                                                child: Text("|",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color:
                                                            Colors.blueGrey)),
                                              ),
                                              if (state
                                                      .listCompetitionActivity[
                                                          index]
                                                      .priority
                                                      .toString() ==
                                                  "PriorityStatus.High")
                                                Icon(
                                                  Icons.warning,
                                                  color: Colors.red,
                                                ),
                                              if (state
                                                      .listCompetitionActivity[
                                                          index]
                                                      .priority
                                                      .toString() ==
                                                  "PriorityStatus.Medium")
                                                Icon(
                                                  Icons.warning,
                                                  color: Colors.amber,
                                                ),
                                              if (state
                                                      .listCompetitionActivity[
                                                          index]
                                                      .priority
                                                      .toString() ==
                                                  "PriorityStatus.Low")
                                                Icon(
                                                  Icons.warning,
                                                  color: Colors.green,
                                                ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )))
                      : Padding(
                          padding: const EdgeInsets.only(top: 180.0),
                          child: Column(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          alignment: Alignment.topCenter,
                                          image: AssetImage(
                                              "assets/img/not-found-icon-24.jpg"),
                                          fit: BoxFit.fitWidth))),
                              Image.asset("assets/img/not-found-icon-24.jpg"),
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: Text(
                                  'Không có kết quả mà bạn tìm kiếm',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
            ],
          );
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
