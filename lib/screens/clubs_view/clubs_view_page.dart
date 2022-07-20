import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicec_mobi/bloc/clubs_view/clubs_view_bloc.dart';

import '../../bloc/clubs_view/clubs_view_event.dart';
import '../../utils/app_color.dart';
import '../../utils/dimens.dart';
import 'widgets/clubs_view_list.dart';

class ClubsViewPage extends StatefulWidget {
  final ClubsViewBloc bloc;

  ClubsViewPage({required this.bloc});

  @override
  _ClubsViewPageState createState() => _ClubsViewPageState();
}

class _ClubsViewPageState extends State<ClubsViewPage> {
  ClubsViewBloc get bloc => widget.bloc;

  @override
  void initState() {
    // bloc.listenerStream.listen((event) {
    //   if(event is )
    //   {
    //   }
    // });
    bloc.add(ClubsViewInitEvent());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            title: Text('Danh sách các Câu Lạc Bộ',
                style:
                    TextStyle(color: Colors.black54, fontSize: Dimens.size23)),
            backgroundColor: AppColors.primaryColor,
            centerTitle: true,
          ),
          body: ListViewClubs()),
    );
  }
}