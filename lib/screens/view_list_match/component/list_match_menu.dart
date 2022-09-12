import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unicec_mobi/constants/Theme.dart';

import '../../../utils/app_color.dart';

class ListMatchMenu extends StatefulWidget {
  const ListMatchMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<ListMatchMenu> createState() => _ListMatchMenuState();
}

class _ListMatchMenuState extends State<ListMatchMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: EdgeInsets.only(right: 20, top: 20,left: 10),
              alignment: Alignment.bottomRight  ,
              child: FlatButton(
                textColor: ArgonColors.white,
                color: AppColors.mainColor,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: const Padding(
                    padding:
                    EdgeInsets.all(10),
                    child: Text("Chi tiết vòng thi",
                        style:
                        TextStyle(fontSize: 18.0))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20, top: 20),
              alignment: Alignment.bottomRight  ,
              child: FlatButton(
                textColor: ArgonColors.white,
                color: AppColors.mainColor,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: const Padding(
                    padding:
                    EdgeInsets.all(10),
                    child: Text("Danh sách các đội thi",
                        style:
                        TextStyle(fontSize: 18.0))),
              ),
            ),
          ],
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.black87,
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: Color.fromARGB(255, 235, 237, 241),
            ),
            onPressed: () async {},
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 20.0, left: 10),
                  child: Text("1", style: TextStyle(fontSize: 18)),
                ),
                Expanded(
                  child: Text("Team 1 - Team 2 - Team 3",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      )),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Sắp diễn ra",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: ArgonColors.warning)),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                ),
              ],
            ),
          ),
        ),
      ],
    );
    // return BlocBuilder<ViewCompetitionMemberTaskBloc,
    //     ViewCompetitionMemberTaskState>(
    //     bloc: bloc,
    //     builder: (context, state) {
    //       return (GetIt.I.get<CurrentUser>().clubIdSelected == 0)
    //           ? Padding(
    //         padding: const EdgeInsets.only(top: 180.0),
    //         child: Column(
    //           children: [
    //             Container(
    //                 decoration: const BoxDecoration(
    //                     image: DecorationImage(
    //                         alignment: Alignment.topCenter,
    //                         image: AssetImage(
    //                             "assets/img/not-found-icon-24.jpg"),
    //                         fit: BoxFit.fitWidth))),
    //             Image.asset("assets/img/not-found-icon-24.jpg"),
    //             const Padding(
    //               padding: EdgeInsets.only(top: 25.0),
    //               child: Text(
    //                 'Mời bạn chọn CLB để hiển thị danh sách công việc',
    //                 style: TextStyle(fontSize: 20),
    //                 textAlign: TextAlign.center,
    //               ),
    //             ),
    //           ],
    //         ),
    //       )
    //           : Container(
    //         child: Column(
    //           children: [
    //             (state.isLoading &&
    //                 (state.listCompetition.isEmpty ||
    //                     state.listCompetition.isNotEmpty))
    //                 ? Loading()
    //                 : (state.listCompetition.isNotEmpty)
    //                 ? RefreshIndicator(
    //               onRefresh: () {
    //                 return _refresh(context);
    //               },
    //               child: ListView.builder(
    //                 shrinkWrap: true,
    //                 itemCount: state.listCompetition.length,
    //                 itemBuilder: (context, index) {
    //
    //                 },
    //               ),
    //             )
    //                 : Expanded(
    //               // Padding
    //               // padding: EdgeInsets.only(top: (MediaQuery.of(context).size.height - 500) / 2),
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Container(
    //                       decoration: const BoxDecoration(
    //                           image: DecorationImage(
    //                               alignment:
    //                               Alignment.topCenter,
    //                               image: AssetImage(
    //                                   "assets/img/not-found-icon-24.jpg"),
    //                               fit: BoxFit.fitWidth))),
    //                   Image.asset(
    //                       "assets/img/not-found-icon-24.jpg"),
    //                   const Padding(
    //                     padding: EdgeInsets.only(top: 25.0),
    //                     child: Text(
    //                       'Hiện tại bạn không có hoạt động nào!',
    //                       style: TextStyle(fontSize: 20),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //       );
    //     });
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

// Future<bool> _refresh(BuildContext context) async {
//   print("onRefresh");
//   BlocProvider.of<ViewCompetitionMemberTaskBloc>(context).add(RefreshEvent());
//   await Future.delayed(Duration(seconds: 0, milliseconds: 5000));
//   refresh(context);
//   return true;
// }
}
