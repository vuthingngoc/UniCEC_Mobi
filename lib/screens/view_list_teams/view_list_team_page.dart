import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/view_list_team/view_list_team_bloc.dart';
import '../../bloc/view_list_team/view_list_team_event.dart';
import '../../bloc/view_list_team/view_list_team_state.dart';
import '../../constants/Theme.dart';

import '../../utils/app_color.dart';
import '../../utils/router.dart';
import '../widgets/input.dart';
import 'component/body.dart';

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
        Navigator.of(context)
            .pushNamed(Routes.viewDetailTeam, arguments: event.teamId);
      }
      if (event is ViewListTeamInitEvent) {
        bloc.add(ViewListTeamInitEvent());
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
    //return
    //BlocProvider.value(
    //     value: bloc,
    //     child: BlocBuilder<ViewListTeamBloc, ViewListTeamState>(
    //         bloc: bloc,
    //         builder: (context, state) {
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: FloatingActionButton(
            heroTag: "Tạo đội thi",
            backgroundColor: ArgonColors.warning,
            onPressed: () async {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      scrollable: true,
                      title: Container(
                          child: Text(
                        'Tạo đội',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      )),
                      content: Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                        ),
                        child: Column(children: [
                          Text('Tên đội'),
                          Form(
                            key: _formKeyTeamName,
                            child: TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.description),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                maxLength: 50,
                                minLines: 1,
                                maxLines: 3,
                                validator: (value) {
                                  if (value!.length < 10) {
                                    return 'Nhập ít nhất 10 ký tự';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  if (_formKeyTeamName.currentState!
                                      .validate()) {
                                    bloc.add(ChangeTeamNameValueEvent(
                                        newNameValue: value));
                                  }
                                }),
                          ),
                          Text('Chi tiết'),
                          Form(
                            key: _formKeyTeamDescription,
                            child: TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.description),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                maxLength: 100,
                                minLines: 1,
                                maxLines: 5,
                                validator: (value) {
                                  if (value!.length < 10) {
                                    return 'Nhập ít nhất 10 ký tự';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  if (_formKeyTeamDescription.currentState!
                                      .validate()) {
                                    bloc.add(ChangeTeamDescriptionValueEvent(
                                        newDescriptionValue: value));
                                  }
                                }),
                          )
                        ]),
                      ),
                      actions: [
                        Container(
                          width: double.infinity,
                          margin: new EdgeInsets.only(
                              right: 15, left: 15, bottom: 15),
                          child: FlatButton(
                            textColor: ArgonColors.white,
                            color: ArgonColors.warning,
                            onPressed: () {
                              if (_formKeyTeamDescription.currentState!
                                  .validate()) {
                                if (_formKeyTeamName.currentState!.validate()) {
                                  bloc.add(CreateTeamEvent());
                                  //
                                  Navigator.of(context).pop();
                                }
                              }
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: 16.0,
                                    right: 16.0,
                                    top: 12,
                                    bottom: 12),
                                child: Text("Tạo",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15.0))),
                          ),
                        ),
                      ],
                    );
                  });
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.black),
          ),
          title: Text(
            "Danh sách các đội tham gia",
            style: TextStyle(color: Colors.black),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: AppColors.backgroundPageColor,
        ),
        body: BlocProvider.value(
          value: bloc,
          child: BlocBuilder<ViewListTeamBloc, ViewListTeamState>(
              bloc: bloc,
              builder: (context, state) {
                return Body();
              }),
        ));
  }
}
