import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/view_list_member/view_list_member_bloc.dart';
import '../../bloc/view_list_member/view_list_member_event.dart';
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

  var _controller = TextEditingController();

  @override
  void initState() {
    bloc.add(LoadListMemberEvent());
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
                  style: TextStyle(color: Colors.white),
                ),
                automaticallyImplyLeading: false,
                centerTitle: true,
                backgroundColor: AppColors.mainColor,
              ),
              body: SingleChildScrollView(
                  child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextFormField(
                            controller: _controller,
                            onFieldSubmitted: (value) {
                              // bloc.add(ChangeSearchNameEvent(
                              //     searchName: value));
                            },
                            autofocus: false,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    _controller.clear;
                                    _controller.text = "";
                                    //sửa lại cái
                                    // bloc.add(ChangeSearchNameEvent(
                                    //     searchName: null));
                                  },
                                  icon: const Icon(Icons.clear)),
                              labelText: 'Tìm Thành Viên',
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          //bloc.add(SearchEvent());
                        },
                        child: Icon(Icons.search),
                      ),
                    ],
                  ),
                ),
                (state.listMember != null)
                    ? ViewDetailTableMemberMenu(
                        listModel: state.listMember!,
                      )
                    : Text('Chưa có load Member'),
              ])));
        }),
      ),
    );
  }
}
