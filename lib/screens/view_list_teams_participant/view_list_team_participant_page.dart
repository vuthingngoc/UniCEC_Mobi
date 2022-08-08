import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/models/entities/team/sending_data_model.dart';
import '../../bloc/view_list_team_participant/view_list_team_participant_bloc.dart';
import '../../bloc/view_list_team_participant/view_list_team_participant_event.dart';
import '../../bloc/view_list_team_participant/view_list_team_participant_state.dart';
import '../../utils/app_color.dart';
import '../../utils/router.dart';
import 'component/add_team_button.dart';
import 'component/body.dart';

class ViewListTeamParticipantPage extends StatefulWidget {
  final ViewListTeamParticipantBloc bloc;
  ViewListTeamParticipantPage({required this.bloc});
  @override
  State<StatefulWidget> createState() => _ViewListTeamParticipantPageState();
}

class _ViewListTeamParticipantPageState
    extends State<ViewListTeamParticipantPage>
    with AutomaticKeepAliveClientMixin {
  //bloc
  ViewListTeamParticipantBloc get bloc => widget.bloc;
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
    bloc.listenerStream.listen((event) {
      if (event is ShowingSnackBarEvent) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(event.message)));
      }
      if (event is NavigatorTeamDetailPageEvent) {
        SendingDataModel data = SendingDataModel(
            competitionId: event.competitionId,
            teamId: event.teamId,
            teamName: event.teamName,
            teamDescription: event.teamDescription,
            status: event.status);
        Navigator.of(context)
            .pushNamed(Routes.viewDetailTeamParticipant, arguments: data);
      }
      if (event is RebuildListViewTeamEvent) {
        bloc.add(ViewListTeamInitEvent());
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Tạo Team Thành Công !")));
      }
    });
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
        child: BlocBuilder<ViewListTeamParticipantBloc,
                ViewListTeamParticipantState>(
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
                body: Body(),
                floatingActionButton: AddTeamButton(),
              );
            }));
  }
}
