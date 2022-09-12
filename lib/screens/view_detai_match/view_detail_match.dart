import 'package:flutter/material.dart';
import 'package:unicec_mobi/bloc/view_detail_match/view_detail_match_bloc.dart';
import '../../utils/app_color.dart';
import 'component/detail_match_menu.dart';

class ViewDetailMatchPage extends StatefulWidget {
  //bloc
  ViewDetailMatchBloc bloc;

  ViewDetailMatchPage({required this.bloc});
  
  @override
  State<StatefulWidget> createState() => _ViewDetailMatchPageState();
}

class _ViewDetailMatchPageState extends State<ViewDetailMatchPage>
    with AutomaticKeepAliveClientMixin {
  
  ViewDetailMatchBloc get bloc => widget.bloc;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: Text(
          "Chi tiết trận đấu",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
      ),
      body: ViewDetailMatchMenu(),
    );
  }
}
