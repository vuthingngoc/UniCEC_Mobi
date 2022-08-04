import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/view_list_team/view_list_team_bloc.dart';
import '../../constants/Theme.dart';

import '../../utils/app_color.dart';
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
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: FloatingActionButton(
            heroTag: "Tạo đội thi",
            backgroundColor: ArgonColors.warning,
            onPressed: () async {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
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
                        child: Form(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                child: Input(
                                  placeholder: "Tên",
                                  prefixIcon: Icon(Icons.label),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Input(
                                  placeholder: "Chi tiết",
                                  prefixIcon: Icon(Icons.description),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      actions: [
                        Container(
                          width: double.infinity,
                          margin: new EdgeInsets.only(
                              right: 15, left: 15, bottom: 15),
                          child: FlatButton(
                            textColor: ArgonColors.white,
                            color: ArgonColors.warning,
                            onPressed: () {},
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
                        // RaisedButton(
                        //     child: Text("Tạo"),
                        //     onPressed: () {
                        //       // your code
                        //     })
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
      ),
    );
  }
}
