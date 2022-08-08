import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/view_detail_team_student/view_detail_team_student_bloc.dart';
import '../../bloc/view_detail_team_student/view_detail_team_student_event.dart';
import '../../bloc/view_detail_team_student/view_detail_team_student_state.dart';
import '../../models/entities/team/sending_data_model.dart';
import '../../utils/app_color.dart';
import 'component/view_detail_team_student_table.dart';

class ViewDetailTeamStudentPage extends StatefulWidget {
  //bloc
  final ViewDetailTeamStudentBloc bloc;
  ViewDetailTeamStudentPage({required this.bloc});
  @override
  State<StatefulWidget> createState() => _ViewDetailTeamStudentPageState();
}

class _ViewDetailTeamStudentPageState extends State<ViewDetailTeamStudentPage>
    with AutomaticKeepAliveClientMixin {
  //bloc
  ViewDetailTeamStudentBloc get bloc => widget.bloc;

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
      child: BlocBuilder<ViewDetailTeamStudentBloc, ViewDetailTeamStudentState>(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
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
                      )
                    ],
                  ),
                  (state.teamDetail?.participants != null)
                      ? ViewDetailTableStudentMenu(
                          listModel: state.teamDetail!.participants)
                      : Text("Chưa có load danh sách Team"),
                ]),
              ));
        },
      ),
    );
  }
}