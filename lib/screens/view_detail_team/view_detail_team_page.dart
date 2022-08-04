import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/view_detail_team/view_detail_team_bloc.dart';
import '../../bloc/view_detail_team/view_detail_team_event.dart';
import '../../bloc/view_detail_team/view_detail_team_state.dart';
import '../../constants/Theme.dart';
import '../../models/entities/team/sending_data_model.dart';
import '../../utils/app_color.dart';
import '../widgets/input.dart';
import 'component/view_detail_table.dart';

class ViewDetailTeamPage extends StatefulWidget {
  //bloc
  final ViewDetailTeamBloc bloc;
  ViewDetailTeamPage({required this.bloc});
  @override
  State<StatefulWidget> createState() => _ViewDetailTeamPageState();
}

class _ViewDetailTeamPageState extends State<ViewDetailTeamPage>
    with AutomaticKeepAliveClientMixin {
  //bloc
  ViewDetailTeamBloc get bloc => widget.bloc;
  //
  final _formKeyTeamDetailName = GlobalKey<FormState>();

  final _formKeyTeamDetailDescription = GlobalKey<FormState>();
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  //nhận competition Id
  void didChangeDependencies() {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    if (settings.arguments != null) {
      SendingDataModel data = settings.arguments as SendingDataModel;
      if (data != null) {
        bloc.add(RecieveDataEvent(
            teamId: data.teamId, competitionId: data.competitionId));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<ViewDetailTeamBloc, ViewDetailTeamState>(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
              floatingActionButton: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: FloatingActionButton(
                  heroTag: "Chỉnh sửa thông tin đội",
                  backgroundColor: ArgonColors.warning,
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            scrollable: true,
                            title: Container(
                                child: Text(
                              'Chỉnh sửa',
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            )),
                            content: Padding(
                              padding: const EdgeInsets.only(
                                top: 8,
                              ),
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Row(
                                    children: [
                                      Text('Tên đội'),
                                    ],
                                  ),
                                ),
                                Form(
                                  key: _formKeyTeamDetailName,
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.label),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      maxLength: 50,
                                      minLines: 1,
                                      maxLines: 3,
                                      validator: (value) {
                                        if (value!.length < 10) {
                                          return 'Nhập ít nhất 10 ký tự';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        if (_formKeyTeamDetailName.currentState!
                                            .validate()) {
                                          bloc.add(ChangeTeamNameValueEvent(
                                              newNameValue: value));
                                        }
                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Row(
                                    children: [
                                      Text('Miêu tả'),
                                    ],
                                  ),
                                ),
                                Form(
                                  key: _formKeyTeamDetailDescription,
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.description),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      maxLength: 100,
                                      minLines: 1,
                                      maxLines: 5,
                                      validator: (value) {
                                        if (value!.length < 10) {
                                          return 'Nhập ít nhất 10 ký tự';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        if (_formKeyTeamDetailDescription
                                            .currentState!
                                            .validate()) {
                                          bloc.add(
                                              ChangeTeamDescriptionValueEvent(
                                                  newDescriptionValue: value));
                                        }
                                      }),
                                )
                              ]),
                            ),
                            actions: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Center(
                                  child: FlatButton(
                                    textColor: ArgonColors.white,
                                    color: ArgonColors.warning,
                                    onPressed: () {
                                      if (_formKeyTeamDetailDescription
                                          .currentState!
                                          .validate()) {
                                        if (_formKeyTeamDetailName.currentState!
                                            .validate()) {
                                          bloc.add(
                                              UpdateTeamNameAndDescriptionEvent());
                                        }
                                      }
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 16.0,
                                            right: 16.0,
                                            top: 12,
                                            bottom: 12),
                                        child: Text("Xác nhận",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15.0))),
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.edit),
                ),
              ),
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                ),
                title: Text(
                  state.teamDetail?.name ?? "Chưa Load Team Name",
                  style: TextStyle(color: Colors.black),
                ),
                automaticallyImplyLeading: false,
                centerTitle: true,
                backgroundColor: AppColors.backgroundPageColor,
              ),
              body: SingleChildScrollView(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 15, top: 20),
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.green),
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text("Mã: DWD16GH",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                )),
                          ),
                        ],
                      ),
                      Expanded(
                          child: SizedBox(
                        width: 10,
                      )),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 15, top: 20),
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.green),
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text("Mã tham gia: PASS",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                  (state.teamDetail?.participants != null)
                      ? ViewDetailTableMenu(
                          listModel: state.teamDetail!.participants)
                      : Text("Chưa có load danh sách Team"),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Center(
                      child: FlatButton(
                        textColor: ArgonColors.white,
                        color: ArgonColors.error,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 16.0, right: 16.0, top: 12, bottom: 12),
                            child: Text("Khóa nhóm",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Center(
                      child: FlatButton(
                        textColor: ArgonColors.white,
                        color: ArgonColors.muted,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 16.0, right: 16.0, top: 12, bottom: 12),
                            child: Text("Thoát khỏi nhóm",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0))),
                      ),
                    ),
                  ),
                ]),
              ));
        },
      ),
    );
  }
}
