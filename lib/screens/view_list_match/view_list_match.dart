import 'package:flutter/material.dart';
import 'package:unicec_mobi/bloc/view_list_match/view_list_match_bloc.dart';
import '../../utils/app_color.dart';
import 'component/list_match_menu.dart';

class ViewListMatchPage extends StatefulWidget {
  ViewListMatchBloc bloc;

  ViewListMatchPage({required this.bloc});

  @override
  State<StatefulWidget> createState() =>
      _ViewListMatchPageState();
}

class _ViewListMatchPageState
    extends State<ViewListMatchPage>
    with AutomaticKeepAliveClientMixin { 

  ViewListMatchBloc get _bloc => widget.bloc;      

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: const Text(
          "Danh sách các trận đấu",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
      ),
      body: ListMatchMenu(),
    );
  }
}
