import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/view_detail_activity/view_detail_activity_bloc.dart';
import '../../bloc/view_detail_activity/view_detail_activity_event.dart';
import '../../constants/Theme.dart';
import '../../utils/app_color.dart';
import '../widgets/drawer.dart';
import 'component/activity_menu.dart';

class ViewDetailActivityPage extends StatefulWidget {
  //bloc
  final ViewDetailActivityBloc bloc;

  ViewDetailActivityPage({required this.bloc});

  @override
  State<StatefulWidget> createState() => _ViewDetailActivityPageState();
}

class _ViewDetailActivityPageState extends State<ViewDetailActivityPage>
    with AutomaticKeepAliveClientMixin {
  //get bloc
  ViewDetailActivityBloc get bloc => widget.bloc;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    bloc.listenerStream.listen((event) {
      if (event is ShowingSnackBarEvent) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(event.message)));
      }
    });
  }

  //nhận competition Id
  void didChangeDependencies() {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    if (settings.arguments != null) {
      int competitionActivityId = settings.arguments as int;
      if (competitionActivityId != 0) {
        bloc.add(
            RecieveDataEvent(competitionActivityId: competitionActivityId));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.black),
            ),
            title: Text("Chi tiết",
                style: TextStyle(color: Colors.black, fontSize: 23)),
            centerTitle: true,
            backgroundColor: AppColors.backgroundPageColor,
          ),
          backgroundColor: ArgonColors.bgColorScreen,
          drawer: ArgonDrawer(currentPage: "Profile"),
          body: ViewDetailActivityMenu()),
    );
  }
}
