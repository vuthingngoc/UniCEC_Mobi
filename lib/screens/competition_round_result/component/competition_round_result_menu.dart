import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/bloc/view_competition_member_task/view_competition_member_task_event.dart';
import '../../../bloc/view_competition_member_task/view_competition_member_task_bloc.dart';

class ViewCompetitionRoundResultMenu extends StatefulWidget {
  const ViewCompetitionRoundResultMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewCompetitionRoundResultMenu> createState() =>
      _ViewCompetitionRoundResultMenuState();
}

class _ViewCompetitionRoundResultMenuState
    extends State<ViewCompetitionRoundResultMenu> {
  //load
  void load(BuildContext context) {
    BlocProvider.of<ViewCompetitionMemberTaskBloc>(context)
        .add(LoadAddMoreEvent());
  }

  //refresh

  @override
  Widget build(BuildContext context) {
    //bloc
    // Padding(
    //   padding: const EdgeInsets.only(top: 180.0),
    //   child: Column(
    //     children: [
    //       Container(
    //           decoration: BoxDecoration(
    //               image: DecorationImage(
    //                   alignment: Alignment.topCenter,
    //                   image: AssetImage(
    //                       "assets/img/not-found-icon-24.jpg"),
    //                   fit: BoxFit.fitWidth))),
    //       Image.asset("assets/img/not-found-icon-24.jpg"),
    //       Padding(
    //         padding: const EdgeInsets.only(top: 25.0),
    //         child: Text(
    //           'Hiện tại chưa có kết quả vòng thi này',
    //           style: TextStyle(fontSize: 20),
    //         ),
    //       ),
    //     ],
    //   ),
    // )
    return Container(
      child: Column(
        children: [
          Padding(
          padding: EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 10),
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.black87,
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: Color.fromARGB(255, 235, 237, 241),
            ),
            onPressed: () async {},
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.red,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text("1",
                            style: TextStyle(fontSize: 20, color: Colors.red)),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Text("Vu Minh Hieu teammmmmmmmmmmmmmmmmmmmmmmmmmmmmmm",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("300", style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
          Padding(
            padding: EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 10),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.black87,
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                backgroundColor: Color.fromARGB(255, 235, 237, 241),
              ),
              onPressed: () async {},
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("2",
                              style: TextStyle(fontSize: 20, color: Colors.orange)),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Text("Vu Minh Hieu teammmmmmmmmmmmmmmmmmmmmmmmmmmmmmm",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("300", style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 10),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.black87,
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                backgroundColor: Color.fromARGB(255, 235, 237, 241),
              ),
              onPressed: () async {},
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.green,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("3",
                              style: TextStyle(fontSize: 20, color: Colors.green)),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Text("Vu Minh Hieu teammmmmmmmmmmmmmmmmmmmmmmmmmmmmmm",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("300", style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          //     : Padding(
          //   padding: const EdgeInsets.only(top: 180.0),
          //   child: Column(
          //     children: [
          //       Container(
          //           decoration: BoxDecoration(
          //               image: DecorationImage(
          //                   alignment:
          //                   Alignment.topCenter,
          //                   image: AssetImage(
          //                       "assets/img/not-found-icon-24.jpg"),
          //                   fit: BoxFit.fitWidth))),
          //       Image.asset(
          //           "assets/img/not-found-icon-24.jpg"),
          //       Padding(
          //         padding:
          //         const EdgeInsets.only(top: 25.0),
          //         child: Text(
          //           'Hiện tại bạn không có hoạt động nào!',
          //           style: TextStyle(fontSize: 20),
          //         ),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }

// Future<bool> _loadMore(BuildContext context) async {
//   print("onLoadMore");
//   await Future.delayed(Duration(seconds: 0, milliseconds: 5000));
//   BlocProvider.of<ViewCompetitionMemberTaskBloc>(context)
//       .add(IncrementalEvent());
//   //lúc này stateModel cũng có r nhưng mà chưa có hàm render lại cái view
//   //phải đưa cái hàm này vào trong để add event và có state
//   load(context);
//   return true;
// }
//
// Future<bool> _refresh(BuildContext context) async {
//   print("onRefresh");
//   BlocProvider.of<ViewCompetitionMemberTaskBloc>(context).add(RefreshEvent());
//   await Future.delayed(Duration(seconds: 0, milliseconds: 5000));
//   refresh(context);
//   return true;
// }
}
