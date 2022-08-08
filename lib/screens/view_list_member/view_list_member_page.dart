import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/view_list_member/view_list_member_bloc.dart';
import '../../bloc/view_list_member/view_list_member_state.dart';
import '../../utils/app_color.dart';
import 'component/view_detail_table_member.dart';

class ViewListMemberPage extends StatefulWidget {
  //bloc
  final ViewListMemberBloc bloc;
  ViewListMemberPage({required this.bloc});
  @override
  State<StatefulWidget> createState() => _ViewListMemberPageState();
}

class _ViewListMemberPageState extends State<ViewListMemberPage>
    with AutomaticKeepAliveClientMixin {
  //bloc
  ViewListMemberBloc get bloc => widget.bloc;
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  //nhận competition Id
  void didChangeDependencies() {}

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<ViewListMemberBloc, ViewListMemberState>(
        bloc: bloc,
        builder: ((context, state) {
          return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                ),
                title: Text(
                  "Danh sách các thành viên trong CLB",
                  style: TextStyle(color: Colors.black),
                ),
                automaticallyImplyLeading: false,
                centerTitle: true,
                backgroundColor: AppColors.backgroundPageColor,
              ),
              body: SingleChildScrollView(
                  child: (state.listMember != null)
                      ? ViewDetailTableMemberMenu(
                          listModel: state.listMember!,
                        )
                      : Text('Chưa có load Member')));
        }),
      ),
    );
  }
}
