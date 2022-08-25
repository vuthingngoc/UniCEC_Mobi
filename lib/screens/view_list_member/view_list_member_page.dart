import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/view_list_member/view_list_member_bloc.dart';
import '../../bloc/view_list_member/view_list_member_event.dart';
import '../../bloc/view_list_member/view_list_member_state.dart';
import '../../utils/app_color.dart';
import '../../utils/loading.dart';
import '../../utils/router.dart';
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
    bloc.listenerStream.listen((event) {
      if (event is NavigatorToAccountPageEvent) {
        Navigator.of(context)
            .pushNamed(Routes.myAccount, arguments: event.userId);
      }
    });
    bloc.add(LoadListMemberEvent());
    bloc.isLoading = true;
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
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
                title: const Text(
                  "Danh sách thành viên",
                  style: TextStyle(color: Colors.white),
                ),
                automaticallyImplyLeading: false,
                centerTitle: true,
                backgroundColor: AppColors.mainColor,
              ),
              body: (bloc.isLoading)
                  ? Loading()
                  : SingleChildScrollView(
                      child: Column(children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 30, left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextFormField(
                                  controller: _controller,
                                  onFieldSubmitted: (value) {
                                    bloc.add(ChangeSearchNameEvent(
                                        searchName: value));
                                  },
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          _controller.clear;
                                          _controller.text = "";
                                          //sửa lại cái
                                          bloc.add(ChangeSearchNameEvent(
                                              searchName: null));
                                        },
                                        icon: const Icon(Icons.clear)),
                                    labelText: 'Tìm Thành Viên',
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1.0),
                                    ),
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                bloc.add(SearchEvent());
                              },
                              child: const Icon(Icons.search),
                            ),
                            PopupMenuButton<int>(
                                icon: Icon(Icons.filter_alt_outlined),
                                itemBuilder: (context) {
                                  return [
                                    PopupMenuItem(
                                      onTap: () {
                                        bloc.add(ChangeClubRoleIdEvent(
                                            clubRoleId: 1));
                                      },
                                      value: 1,
                                      child: (state.clubRoleId == 1)
                                          ? Container(
                                              color: Colors.green,
                                              child: Row(
                                                children: <Widget>[
                                                  //Icon(Icons.camera, size: 18),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Text('Chủ Nhiệm'),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : Row(
                                              children: <Widget>[
                                                //Icon(Icons.camera, size: 18),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Text('Chủ Nhiệm'),
                                                ),
                                              ],
                                            ),
                                    ),
                                    PopupMenuItem(
                                      onTap: () {
                                        bloc.add(ChangeClubRoleIdEvent(
                                            clubRoleId: 2));
                                      },
                                      value: 2,
                                      child: (state.clubRoleId == 2)
                                          ? Container(
                                              color: Colors.green,
                                              child: Row(
                                                children: <Widget>[
                                                  //Icon(Icons.school, size: 18),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child:
                                                        Text('Phó Chủ Nhiệm'),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : Row(
                                              children: <Widget>[
                                                //Icon(Icons.school, size: 18),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Text('Phó Chủ Nhiệm'),
                                                ),
                                              ],
                                            ),
                                    ),
                                    PopupMenuItem(
                                      onTap: () {
                                        bloc.add(ChangeClubRoleIdEvent(
                                            clubRoleId: 3));
                                      },
                                      value: 3,
                                      child: (state.clubRoleId == 3)
                                          ? Container(
                                              color: Colors.green,
                                              child: Row(
                                                children: <Widget>[
                                                  //Icon(Icons.school, size: 18),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Text('Trưởng ban'),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : Row(
                                              children: <Widget>[
                                                //Icon(Icons.school, size: 18),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Text('Trưởng ban'),
                                                ),
                                              ],
                                            ),
                                    ),
                                    PopupMenuItem(
                                      onTap: () {
                                        bloc.add(ChangeClubRoleIdEvent(
                                            clubRoleId: 4));
                                      },
                                      value: 4,
                                      child: (state.clubRoleId == 4)
                                          ? Container(
                                              color: Colors.green,
                                              child: Row(
                                                children: <Widget>[
                                                  //Icon(Icons.school, size: 18),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Text('Thành Viên'),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : Row(
                                              children: <Widget>[
                                                //Icon(Icons.school, size: 18),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Text('Thành Viên'),
                                                ),
                                              ],
                                            ),
                                    ),
                                    PopupMenuItem(
                                      onTap: () {
                                        bloc.add(ResetFilterEvent());
                                        _controller.text = "";
                                      },
                                      value: 5,
                                      child: Row(
                                        children: <Widget>[
                                          //Icon(Icons.delete, size: 18),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text('làm mới Filter'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ];
                                }),
                          ],
                        ),
                      ),
                      (state.listMember.isNotEmpty)
                          ? ViewDetailTableMemberMenu(
                              listModel: state.listMember,
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 180.0),
                              child: Column(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              alignment: Alignment.topCenter,
                                              image: AssetImage(
                                                  "assets/img/not-found-icon-24.jpg"),
                                              fit: BoxFit.fitWidth))),
                                  Image.asset(
                                      "assets/img/not-found-icon-24.jpg"),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 25.0),
                                    child: Text(
                                      'Danh sách thành viên trống',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            )
                    ])));
        }),
      ),
    );
  }
}
