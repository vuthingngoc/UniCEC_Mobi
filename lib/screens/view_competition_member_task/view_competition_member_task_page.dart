import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicec_mobi/bloc/view_competition_member_task/view_competition_member_task_event.dart';
import '../../bloc/view_competition_member_task/view_competition_member_task_bloc.dart';
import '../../utils/app_color.dart';
import 'component/list_competition_member_task_menu.dart';

class ViewCompetitionMemberTaskPage extends StatefulWidget {
  final ViewCompetitionMemberTaskBloc bloc;
  ViewCompetitionMemberTaskPage({required this.bloc});

  @override
  State<StatefulWidget> createState() =>
      _ViewCompetitionMemberTaskPagePageState();
}

class _ViewCompetitionMemberTaskPagePageState
    extends State<ViewCompetitionMemberTaskPage>
    with AutomaticKeepAliveClientMixin {
  //bloc
  ViewCompetitionMemberTaskBloc get bloc => widget.bloc;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    bloc.add(InitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: bloc,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.black),
            ),
            title: Text(
              "Cuộc thi & Sự kiện tham gia",
              style: TextStyle(color: Colors.black),
            ),
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: AppColors.backgroundPageColor,
          ),
          body: ViewCompetitionMemberTaskMenu(),
        ));
  }
}
