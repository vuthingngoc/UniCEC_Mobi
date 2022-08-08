import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/view_list_team_student/view_list_team_student_bloc.dart';
import '../../bloc/view_list_team_student/view_list_team_student_event.dart';
import '../../bloc/view_list_team_student/view_list_team_student_state.dart';
import '/models/entities/team/sending_data_model.dart';
import '../../utils/app_color.dart';
import '../../utils/router.dart';
import 'component/body_student.dart';

class ViewListTeamStudentPage extends StatefulWidget {
  final ViewListTeamStudentBloc bloc;
  ViewListTeamStudentPage({required this.bloc});
  @override
  State<StatefulWidget> createState() => _ViewListTeamStudentPageState();
}

class _ViewListTeamStudentPageState extends State<ViewListTeamStudentPage>
    with AutomaticKeepAliveClientMixin {
  //bloc
  ViewListTeamStudentBloc get bloc => widget.bloc;
  //
  final _formKeyTeamName = GlobalKey<FormState>();
  final _formKeyTeamDescription = GlobalKey<FormState>();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    //mặc định competition id 2
    //bloc.add(RecieveDataEvent(competitionId: 2));
    //
  }

  //nhận competition Id
  void didChangeDependencies() {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    if (settings.arguments != null) {
      int competitionId = settings.arguments as int;
      if (competitionId != 0) {
        bloc.add(RecieveDataEvent(competitionId: competitionId));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: bloc,
        child: BlocBuilder<ViewListTeamStudentBloc, ViewListTeamStudentState>(
            bloc: bloc,
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                  ),
                  title: Text(
                    "Danh sách các đội tham gia",
                    style: TextStyle(color: Colors.black),
                  ),
                  automaticallyImplyLeading: false,
                  centerTitle: true,
                  backgroundColor: AppColors.backgroundPageColor,
                ),
                body: BodyStudent(),
                //floatingActionButton: AddTeamButtonWithoutLogin(),
              );
            }));
  }
}
