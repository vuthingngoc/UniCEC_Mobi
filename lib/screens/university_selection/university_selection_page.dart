import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/university_selection/university_selection_bloc.dart';
import '../../bloc/university_selection/university_selection_event.dart';
import '../../bloc/university_selection/university_selection_state.dart';
import '../../models/entities/temp/temp.dart';
import '../../utils/router.dart';

class UniversitySelectionPage extends StatefulWidget {
  final UniversitySelectionBloc bloc;

  UniversitySelectionPage(this.bloc);

  @override
  State<UniversitySelectionPage> createState() =>
      _UniversitySelectionPageState();
}

class _UniversitySelectionPageState extends State<UniversitySelectionPage> {
  UniversitySelectionBloc get bloc => widget.bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    bloc.listenerStream.listen((event) {
      if (event is NavigatorWelcomePageEvent) {
        Navigator.of(context).pushReplacementNamed(Routes.home);
      } else if (event is ShowingSnackBarEvent) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(event.message)));
      }
    });
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    //nhận data từ trang login
    RouteSettings settings = ModalRoute.of(context)!.settings;
    if (settings.arguments != null) {
      List<UniBelongToEmail> listUniBelongToEmail =
          settings.arguments as List<UniBelongToEmail>;

      if (listUniBelongToEmail != null) {
        //thêm sự kiện để cập nhật state
        bloc.add(RecieveData(listUniBelongToEmail: listUniBelongToEmail));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Mời bạn chọn trường Đại Học")),
        body: BlocProvider.value(
            value: bloc,
            child: BlocBuilder<UniversitySelectionBloc,
                    UniversitySelectionState>(
                bloc: bloc,
                builder: (context, state) {
                  return state.listUniBelongToEmail.isEmpty
                      ? Text('Không nhận được data')
                      : Container(
                          child: ListView.builder(
                              itemCount: state.listUniBelongToEmail.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  height: 50,
                                  child: Text(
                                      "${state.listUniBelongToEmail[index].name}"),
                                );
                              }),
                        );
                }))

        // body: Container(
        //   child: ListView.builder(
        //       itemCount: listUniBelongToEmail.length,
        //       itemBuilder: (BuildContext context, int index) {
        //         return Container(
        //           height: 50,
        //           child: Text("${listUniBelongToEmail[index].name}"),
        //         );
        //       }),
        // ),
        );
  }
}
