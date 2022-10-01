import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicec_mobi/utils/app_color.dart';
import '../../../bloc/competition_round/competition_round_bloc.dart';
import '../../../bloc/competition_round/competition_round_event.dart';
import '../../../bloc/competition_round/competition_round_state.dart';
import '../../../utils/loading.dart';
import '../../../utils/log.dart';

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
    // CompetitionRoundBloc bloc = BlocProvider.of<CompetitionRoundBloc>(context);
    // RouteSettings settings = ModalRoute.of(context)!.settings;
    // if (settings.arguments != null) {
    //   int competitionId = settings.arguments as int;
    //   Log.info('settings.arguments: $competitionId');
    //   if (competitionId > 0) {
    //     bloc.add(LoadResultRoundsInCompetition(competitionId: competitionId));
    //     bloc.isLoading = true;
    //   }
    // }
  }

  //refresh

  @override
  Widget build(BuildContext context) {
    CompetitionRoundBloc bloc = BlocProvider.of<CompetitionRoundBloc>(context);
    RouteSettings settings = ModalRoute.of(context)!.settings;
    int competitionId = 0;
    if (settings.arguments != null) {
      var args = settings.arguments as Map;
      competitionId = args['competitionId'] ?? 0;
      int competitionRoundId = args['competitionRoundId'] ?? 0;
      Log.info('settings.arguments: $competitionId');
      if (competitionId > 0) { // competition
        bloc.add(LoadResultTeamsInCompetition(competitionId: competitionId));
        
      }else{// round
        bloc.add(LoadResultARoundInCompetition(roundId: competitionRoundId));
      }

      bloc.isLoading = true;
      
    }

    // bloc.add(LoadResultRoundsInCompetition(competitionId: 34));
    // bloc.isLoading = true;

    print(
        '==================================== teams in round result: ${bloc.state.teamsInRoundResult}');
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
    return BlocBuilder<CompetitionRoundBloc, CompetitionRoundState>(
        bloc: bloc,
        builder: (context, state) {
          return (bloc.isLoading)
              ? Loading()
              : (state.teamsInRoundResult?.length != null || state.teamsInCompetitionResult?.length != null)
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.teamsInRoundResult?.length ?? state.teamsInCompetitionResult?.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20, left: 20, top: 20, bottom: 10),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  primary: Colors.black87,
                                  padding: const EdgeInsets.all(20),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  backgroundColor:
                                      const Color.fromARGB(255, 235, 237, 241),
                                ),
                                onPressed: () async {},
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          if (index == 0) ...[
                                            const Icon(
                                              Icons.star,
                                              color: Colors.red,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: Text("${index + 1}",
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.red)),
                                            ),
                                          ] else if (index == 1) ...[
                                            const Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: Text("${index + 1}",
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.orange)),
                                            ),
                                          ] else ...[
                                            const Icon(
                                              Icons.star,
                                              color: Colors.green,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: Text("${index + 1}",
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.green)),
                                            ),
                                          ],
                                          Expanded(
                                            child: Text(
                                                "${state.teamsInRoundResult?[index].teamName ?? state.teamsInCompetitionResult?[index].teamName}",
                                                // "Vu Minh Hieu teammmmmmmmmmmmmmmmmmmmmmmmmmmmmmm",
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.normal),
                                                        textAlign: TextAlign.center),
                                          ),
                                          Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                  "${state.teamsInRoundResult?[index].scores ?? state.teamsInCompetitionResult?[index].totalPoint} điểm",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: AppColors.mainColor,
                                                      fontWeight:
                                                          FontWeight.normal))),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //       right: 20, left: 20, top: 20, bottom: 10),
                            //   child: TextButton(
                            //     style: TextButton.styleFrom(
                            //       primary: Colors.black87,
                            //       padding: EdgeInsets.all(20),
                            //       shape: RoundedRectangleBorder(
                            //           borderRadius: BorderRadius.circular(15)),
                            //       backgroundColor:
                            //           Color.fromARGB(255, 235, 237, 241),
                            //     ),
                            //     onPressed: () async {},
                            //     child: Column(
                            //       children: [
                            //         Container(
                            //           padding: const EdgeInsets.all(10),
                            //           child: Row(
                            //             children: [
                            //               Icon(
                            //                 Icons.star,
                            //                 color: Colors.orange,
                            //               ),
                            //               Container(
                            //                 padding: EdgeInsets.only(left: 10),
                            //                 child: Text("2",
                            //                     style: TextStyle(
                            //                         fontSize: 20,
                            //                         color: Colors.orange)),
                            //               ),
                            //               Expanded(
                            //                 child: Container(
                            //                   padding: EdgeInsets.only(left: 20),
                            //                   child: Text(
                            //                       "Vu Minh Hieu teammmmmmmmmmmmmmmmmmmmmmmmmmmmmmm",
                            //                       style: TextStyle(
                            //                           fontSize: 18,
                            //                           fontWeight:
                            //                               FontWeight.normal)),
                            //                 ),
                            //               ),
                            //               Container(
                            //                   padding: EdgeInsets.only(left: 10),
                            //                   child: Text("300",
                            //                       style: TextStyle(
                            //                           fontSize: 18,
                            //                           fontWeight:
                            //                               FontWeight.normal))),
                            //             ],
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // Padding(
                            //   padding: EdgeInsets.only(
                            //       right: 20, left: 20, top: 20, bottom: 10),
                            //   child: TextButton(
                            //     style: TextButton.styleFrom(
                            //       primary: Colors.black87,
                            //       padding: EdgeInsets.all(20),
                            //       shape: RoundedRectangleBorder(
                            //           borderRadius: BorderRadius.circular(15)),
                            //       backgroundColor:
                            //           Color.fromARGB(255, 235, 237, 241),
                            //     ),
                            //     onPressed: () async {},
                            //     child: Column(
                            //       children: [
                            //         Container(
                            //           padding: const EdgeInsets.all(10),
                            //           child: Row(
                            //             children: [
                            //               Icon(
                            //                 Icons.star,
                            //                 color: Colors.green,
                            //               ),
                            //               Container(
                            //                 padding: EdgeInsets.only(left: 10),
                            //                 child: Text("3",
                            //                     style: TextStyle(
                            //                         fontSize: 20,
                            //                         color: Colors.green)),
                            //               ),
                            //               Expanded(
                            //                 child: Container(
                            //                   padding: EdgeInsets.only(left: 20),
                            //                   child: Text(
                            //                       "Vu Minh Hieu teammmmmmmmmmmmmmmmmmmmmmmmmmmmmmm",
                            //                       style: TextStyle(
                            //                           fontSize: 18,
                            //                           fontWeight:
                            //                               FontWeight.normal)),
                            //                 ),
                            //               ),
                            //               Container(
                            //                   padding: EdgeInsets.only(left: 10),
                            //                   child: Text("300",
                            //                       style: TextStyle(
                            //                           fontSize: 18,
                            //                           fontWeight:
                            //                               FontWeight.normal))),
                            //             ],
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
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
                        );
                      })
                  : Padding(
                      padding: const EdgeInsets.only(top: 180.0),
                      child: Column(
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      alignment: Alignment.topCenter,
                                      image: AssetImage(
                                          "assets/img/not-found-icon-24.jpg"),
                                      fit: BoxFit.fitWidth))),
                          Image.asset("assets/img/not-found-icon-24.jpg"),
                          Padding(
                            padding: EdgeInsets.only(top: 25.0),
                            child: Text(
                              (competitionId > 0) 
                              ? "Hiện tại chưa có kết quả cuộc thi này"
                              : 'Hiện tại chưa có kết quả vòng thi này',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    );
        });

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
}
