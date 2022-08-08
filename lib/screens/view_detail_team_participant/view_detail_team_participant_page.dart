import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/screens/club_view_detail/widgets/default_button.dart';
import '../../bloc/view_detail_team_participant/view_detail_team_participant_bloc.dart';
import '../../bloc/view_detail_team_participant/view_detail_team_participant_event.dart';
import '../../bloc/view_detail_team_participant/view_detail_team_participant_state.dart';
import '../../constants/Theme.dart';
import '../../models/common/current_user.dart';
import '../../models/entities/team/sending_data_model.dart';
import '../../models/enums/team_status.dart';
import '../../utils/app_color.dart';
import '../widgets/input.dart';
import 'component/view_detail_table.dart';

class ViewDetailTeamParticipantPage extends StatefulWidget {
  //bloc
  final ViewDetailTeamParticipantBloc bloc;
  ViewDetailTeamParticipantPage({required this.bloc});
  @override
  State<StatefulWidget> createState() => _ViewDetailTeamParticipantPageState();
}

class _ViewDetailTeamParticipantPageState
    extends State<ViewDetailTeamParticipantPage>
    with AutomaticKeepAliveClientMixin {
  //bloc
  ViewDetailTeamParticipantBloc get bloc => widget.bloc;
  //
  final _formKeyTeamDetailName = GlobalKey<FormState>();

  final _formKeyTeamDetailDescription = GlobalKey<FormState>();
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    bloc.listenerStream.listen((event) {
      if (event is BackPreviousPageEvent) {
        Navigator.of(context).pop();
      } else if (event is ShowingSnackBarEvent) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(event.message)));
      }
    });
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
      child: BlocBuilder<ViewDetailTeamParticipantBloc,
          ViewDetailTeamParticipantState>(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
              floatingActionButton: (state.userIdIsLeaderTeam ==
                      GetIt.I.get<CurrentUser>().id)
                  ? Padding(
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
                                        padding:
                                            const EdgeInsets.only(bottom: 10.0),
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
                                                      BorderRadius.circular(
                                                          10)),
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
                                              if (_formKeyTeamDetailName
                                                  .currentState!
                                                  .validate()) {
                                                bloc.add(
                                                    ChangeTeamNameValueEvent(
                                                        newNameValue: value));
                                              }
                                            }),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10.0),
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
                                              prefixIcon:
                                                  Icon(Icons.description),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
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
                                                        newDescriptionValue:
                                                            value));
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
                                              if (_formKeyTeamDetailName
                                                  .currentState!
                                                  .validate()) {
                                                bloc.add(
                                                    UpdateTeamNameAndDescriptionEvent());
                                                Navigator.of(context).pop();
                                              }
                                            }
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 16.0,
                                                  right: 16.0,
                                                  top: 12,
                                                  bottom: 12),
                                              child: Text("Xác nhận",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
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
                    )
                  : Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                    ),
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
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
                child: Column(children: [
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
                            child: Text(
                                (state.teamDetail != null)
                                    ? "Mã: T-${state.teamDetail!.id}"
                                    : "Chưa có load mã",
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
                      if (GetIt.I.get<CurrentUser>().id ==
                          state.userIdIsLeaderTeam)
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
                              child: Text(
                                  (state.teamDetail != null)
                                      ? "Mã mời: ${state.teamDetail!.invitedCode}"
                                      : "Chưa có load mã",
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
                  if (state.status == TeamStatus.Available &&
                      GetIt.I.get<CurrentUser>().id == state.userIdIsLeaderTeam)
                    DefaultButton(
                      text: "Khóa nhóm",
                      press: () {
                        bloc.add(UpdateStatusTeam(status: TeamStatus.IsLocked));
                      },
                    ),
                  if (state.status == TeamStatus.IsLocked &&
                      GetIt.I.get<CurrentUser>().id == state.userIdIsLeaderTeam)
                    DefaultButton(
                      text: "Mở nhóm",
                      press: () {
                        bloc.add(
                            UpdateStatusTeam(status: TeamStatus.Available));
                      },
                    ),
                  if (state.userIdIsLeaderTeam == GetIt.I.get<CurrentUser>().id)
                    DefaultButton(
                      text: "Xóa nhóm",
                      press: () {
                        bloc.add(DeleteTeamByLeaderEvent());
                      },
                    ),
                  if (state.userIdInTeam == GetIt.I.get<CurrentUser>().id &&
                      state.userIdInTeam != state.userIdIsLeaderTeam)
                    DefaultButton(
                      text: "Thoát khỏi nhóm",
                      press: () {
                        bloc.add(MemberOutTeamEvent());
                      },
                    ),
                ]),
              ));
        },
      ),
    );
  }
}
