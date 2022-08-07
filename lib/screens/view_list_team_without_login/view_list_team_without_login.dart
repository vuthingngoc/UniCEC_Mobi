import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicec_mobi/models/entities/team/sending_data_model.dart';
import '../../bloc/view_list_team/view_list_team_bloc.dart';
import '../../bloc/view_list_team/view_list_team_event.dart';
import '../../bloc/view_list_team/view_list_team_state.dart';
import '../../constants/Theme.dart';

import '../../utils/app_color.dart';
import '../../utils/router.dart';
import '../widgets/input.dart';
import 'component/add_team_button_without_team.dart';
import 'component/body_without_team.dart';

class ViewListTeamPage extends StatefulWidget {
  final ViewListTeamBloc bloc;
  ViewListTeamPage({required this.bloc});
  @override
  State<StatefulWidget> createState() => _ViewListTeamPageState();
}

class _ViewListTeamPageState extends State<ViewListTeamPage>
    with AutomaticKeepAliveClientMixin {
  //bloc
  ViewListTeamBloc get bloc => widget.bloc;
  //
  final _formKeyTeamName = GlobalKey<FormState>();
  final _formKeyTeamDescription = GlobalKey<FormState>();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    //mặc định competition id 2
    bloc.add(RecieveDataEvent(competitionId: 2));
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
        Navigator.of(context).pushNamed(Routes.viewDetailTeam, arguments: data);
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
    // RouteSettings settings = ModalRoute.of(context)!.settings;
    // if (settings.arguments != null) {
    //   int competitionId = settings.arguments as int;
    //   if (competitionId != 0) {
    //     bloc.add(RecieveDataEvent(competitionId: competitionId));
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: bloc,
        child: BlocBuilder<ViewListTeamBloc, ViewListTeamState>(
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
                body: Container(),
                floatingActionButton: AddTeamButtonWithoutLogin(),
              );
            }));
  }
}
