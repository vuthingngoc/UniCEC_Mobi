import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../bloc/club/club_bloc.dart';
import '../../bloc/club/club_event.dart';
import '../../bloc/club/club_state.dart';
//widgets
import 'package:unicec_mobi/screens/widgets/drawer.dart';
import '../../models/common/current_user.dart';
import '../../utils/router.dart';
import '../size_config.dart';
import 'tab_club_info/body_club_info.dart';
import 'tab_club_info/default_button.dart';
import 'widgets/navbar_club.dart';

class ClubPage extends StatefulWidget {
  //bloc
  final ClubBloc bloc;

  ClubPage({required this.bloc});

  @override
  _ClubPageState createState() => _ClubPageState();
}

class _ClubPageState extends State<ClubPage> {
  //bool? _checkboxValue = false;
  //final double height = window.physicalSize.height;

//
  ClubBloc get _bloc => widget.bloc;
  @override
  void initState() {
    super.initState();

    _bloc.add(ClubInitEvent());

    _bloc.listenerStream.listen((event) {
      if (event is NavigatorClubSelectionPageEvent) {
        Navigator.of(context).pushNamed(Routes.clubSelection);
      }
      if (event is NavigatorClubsViewPageEvent) {
        Navigator.of(context).pushNamed(Routes.clubsView);
      }
      if (event is ShowingSnackBarEvent) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(event.message)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider.value(
      value: _bloc,
      child: BlocBuilder<ClubBloc, ClubState>(
        bloc: _bloc,
        builder: (context, state) {
          return (GetIt.I.get<CurrentUser>().clubIdSelected != 0)
              ? DefaultTabController(
                  initialIndex: 0,
                  length: 2,
                  child: Scaffold(
                    appBar:
                        //NavbarClub(transparent: true, title: "Câu Lạc Bộ"),
                        AppBar(
                      title: Text('Câu Lạc Bộ'),
                      automaticallyImplyLeading: false,                  
                      bottom: TabBar(
                        labelColor: Colors.redAccent,
                        tabs: <Widget>[
                          Tab(
                            text: "Thông Tin Câu Lạc Bộ",
                          ),
                          Tab(
                            text: "Cuộc Thi và Sự Kiện Của Câu Lạc Bộ",
                          )
                        ],
                      ),                      
                    ),
                    //extendBodyBehindAppBar: false,
                    //drawer: ArgonDrawer(currentPage: "Club"),
                    body: TabBarView(
                      children: <Widget>[
                        //tab1
                        BodyClubInfo(
                            Club: state.ClubSelected,
                            Member: state.MemberSelected),
                        //tab2
                        Center(
                          child: Text("Cuộc Thi và Sự Kiện"),
                        ),
                      ],
                    ),
                  ),
                )
              : DefaultTabController(
                  initialIndex: 0,
                  length: 2,
                  child: Scaffold(
                      appBar: AppBar(
                        title: Text('Câu Lạc Bộ'),
                        bottom: TabBar(
                          labelColor: Colors.redAccent,
                          tabs: <Widget>[
                            Tab(
                              text: "Thông Tin Câu Lạc Bộ",
                            ),
                            Tab(
                              text: "Cuộc Thi và Sự Kiện Của Câu Lạc Bộ",
                            )
                          ],
                        ),
                      ),
                      //extendBodyBehindAppBar: false,
                      //drawer: ArgonDrawer(currentPage: "Club"),
                      body: (GetIt.I.get<CurrentUser>().clubsBelongToStudent !=
                              null)
                          ? Center(
                              child: Column(
                                children: [
                                  Text('Bạn chưa chọn Câu Lạc Bộ'),
                                  DefaultButton(
                                    text: "Chọn Câu Lạc Bộ ",
                                    press: () {
                                      _bloc.add(ClubSelectionEvent());
                                    },
                                  ),
                                ],
                              ),
                            )
                          : Center(
                              child: Column(
                                children: [
                                  Text('Bạn chưa có Câu Lạc Bộ'),
                                  DefaultButton(
                                    text: "Tham Gia Câu Lạc Bộ ",
                                    press: () {
                                      _bloc.add(ClubsViewEvent());
                                    },
                                  ),
                                ],
                              ),
                            )),
                );
        },
      ),
    );

    //Scaffold(
    //     appBar: NavbarClub(transparent: true, title: "Câu Lạc Bộ"),
    //     extendBodyBehindAppBar: true,
    //     drawer: ArgonDrawer(currentPage: "Club"),
    //     body: Stack(
    //       children: [
    //         Container(
    //           decoration: BoxDecoration(
    //               image: DecorationImage(
    //                   image: AssetImage("assets/img/register-bg.png"),
    //                   fit: BoxFit.cover)),
    //         ),
    //         SafeArea(
    //           child: ListView(children: [
    //             Padding(
    //               padding: const EdgeInsets.only(
    //                   top: 16, left: 24.0, right: 24.0, bottom: 32),
    //               child: Card(
    //                   elevation: 5,
    //                   clipBehavior: Clip.antiAlias,
    //                   shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(4.0),
    //                   ),
    //                   child: Column(
    //                     children: [
    //                       Container(
    //                           height: MediaQuery.of(context).size.height * 0.15,
    //                           decoration: BoxDecoration(
    //                               color: ArgonColors.white,
    //                               border: Border(
    //                                   bottom: BorderSide(
    //                                       width: 0.5,
    //                                       color: ArgonColors.muted))),
    //                           child: Column(
    //                             mainAxisAlignment:
    //                                 MainAxisAlignment.spaceAround,
    //                             children: [
    //                               Center(
    //                                   child: Padding(
    //                                 padding: const EdgeInsets.only(top: 8.0),
    //                                 child: Text("Sign up with",
    //                                     style: TextStyle(
    //                                         color: ArgonColors.text,
    //                                         fontSize: 16.0)),
    //                               )),
    //                               Padding(
    //                                 padding: const EdgeInsets.only(bottom: 8.0),
    //                                 child: Row(
    //                                   mainAxisAlignment:
    //                                       MainAxisAlignment.spaceAround,
    //                                   children: [
    //                                     Container(
    //                                       // width: 0,
    //                                       height: 36,
    //                                       child: RaisedButton(
    //                                           textColor: ArgonColors.primary,
    //                                           color: ArgonColors.secondary,
    //                                           onPressed: () {},
    //                                           shape: RoundedRectangleBorder(
    //                                               borderRadius:
    //                                                   BorderRadius.circular(4)),
    //                                           child: Padding(
    //                                               padding: EdgeInsets.only(
    //                                                   bottom: 10,
    //                                                   top: 10,
    //                                                   left: 14,
    //                                                   right: 14),
    //                                               child: Row(
    //                                                 mainAxisAlignment:
    //                                                     MainAxisAlignment
    //                                                         .spaceAround,
    //                                                 children: [
    //                                                   Icon(
    //                                                       FontAwesomeIcons
    //                                                           .github,
    //                                                       size: 13),
    //                                                   SizedBox(
    //                                                     width: 5,
    //                                                   ),
    //                                                   Text("GITHUB",
    //                                                       style: TextStyle(
    //                                                           fontWeight:
    //                                                               FontWeight
    //                                                                   .w600,
    //                                                           fontSize: 13))
    //                                                 ],
    //                                               ))),
    //                                     ),
    //                                     Container(
    //                                       // width: 0,
    //                                       height: 36,
    //                                       child: RaisedButton(
    //                                           textColor: ArgonColors.primary,
    //                                           color: ArgonColors.secondary,
    //                                           onPressed: () {},
    //                                           shape: RoundedRectangleBorder(
    //                                               borderRadius:
    //                                                   BorderRadius.circular(4)),
    //                                           child: Padding(
    //                                               padding: EdgeInsets.only(
    //                                                   bottom: 10,
    //                                                   top: 10,
    //                                                   left: 8,
    //                                                   right: 8),
    //                                               child: Row(
    //                                                 mainAxisAlignment:
    //                                                     MainAxisAlignment
    //                                                         .spaceAround,
    //                                                 children: [
    //                                                   Icon(
    //                                                       FontAwesomeIcons
    //                                                           .facebook,
    //                                                       size: 13),
    //                                                   SizedBox(
    //                                                     width: 5,
    //                                                   ),
    //                                                   Text("FACEBOOK",
    //                                                       style: TextStyle(
    //                                                           fontWeight:
    //                                                               FontWeight
    //                                                                   .w600,
    //                                                           fontSize: 13))
    //                                                 ],
    //                                               ))),
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ),
    //                               // Divider()
    //                             ],
    //                           )),
    //                       Container(
    //                           height: MediaQuery.of(context).size.height * 0.63,
    //                           color: Color.fromRGBO(244, 245, 247, 1),
    //                           child: Padding(
    //                             padding: const EdgeInsets.all(8.0),
    //                             child: Center(
    //                               child: Column(
    //                                 crossAxisAlignment:
    //                                     CrossAxisAlignment.start,
    //                                 mainAxisAlignment:
    //                                     MainAxisAlignment.spaceAround,
    //                                 children: [
    //                                   Padding(
    //                                     padding: const EdgeInsets.only(
    //                                         top: 24.0, bottom: 24.0),
    //                                     child: Center(
    //                                       child: Text(
    //                                           "Or sign up with the classic way",
    //                                           style: TextStyle(
    //                                               color: ArgonColors.text,
    //                                               fontWeight: FontWeight.w200,
    //                                               fontSize: 16)),
    //                                     ),
    //                                   ),
    //                                   Column(
    //                                     crossAxisAlignment:
    //                                         CrossAxisAlignment.start,
    //                                     children: [
    //                                       Padding(
    //                                         padding: const EdgeInsets.all(8.0),
    //                                         child: Input(
    //                                           placeholder: "Name",
    //                                           prefixIcon: Icon(Icons.school),
    //                                         ),
    //                                       ),
    //                                       Padding(
    //                                         padding: const EdgeInsets.all(8.0),
    //                                         child: Input(
    //                                           placeholder: "Email",
    //                                           prefixIcon: Icon(Icons.email),
    //                                         ),
    //                                       ),
    //                                       Padding(
    //                                         padding: const EdgeInsets.all(8.0),
    //                                         child: Input(
    //                                             placeholder: "Password",
    //                                             prefixIcon: Icon(Icons.lock)),
    //                                       ),
    //                                       Padding(
    //                                         padding: const EdgeInsets.only(
    //                                             left: 24.0),
    //                                         child: RichText(
    //                                             text: TextSpan(
    //                                                 text: "password strength: ",
    //                                                 style: TextStyle(
    //                                                     color:
    //                                                         ArgonColors.muted),
    //                                                 children: [
    //                                               TextSpan(
    //                                                   text: "strong",
    //                                                   style: TextStyle(
    //                                                       fontWeight:
    //                                                           FontWeight.w600,
    //                                                       color: ArgonColors
    //                                                           .success))
    //                                             ])),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                   Padding(
    //                                     padding: const EdgeInsets.only(
    //                                         left: 8.0, top: 0, bottom: 16),
    //                                     child: Row(
    //                                       mainAxisAlignment:
    //                                           MainAxisAlignment.start,
    //                                       children: [
    //                                         Checkbox(
    //                                             activeColor:
    //                                                 ArgonColors.primary,
    //                                             onChanged: (bool? newValue) =>
    //                                                 setState(() =>
    //                                                     _checkboxValue =
    //                                                         newValue),
    //                                             value: _checkboxValue),
    //                                         Text("I agree with the",
    //                                             style: TextStyle(
    //                                                 color: ArgonColors.muted,
    //                                                 fontWeight:
    //                                                     FontWeight.w200)),
    //                                         GestureDetector(
    //                                             onTap: () {
    //                                               Navigator.pushNamed(
    //                                                   context, '/pro');
    //                                             },
    //                                             child: Container(
    //                                               margin:
    //                                                   EdgeInsets.only(left: 5),
    //                                               child: Text("Privacy Policy",
    //                                                   style: TextStyle(
    //                                                       color: ArgonColors
    //                                                           .primary)),
    //                                             )),
    //                                       ],
    //                                     ),
    //                                   ),
    //                                   Padding(
    //                                     padding: const EdgeInsets.only(top: 16),
    //                                     child: Center(
    //                                       child: FlatButton(
    //                                         textColor: ArgonColors.white,
    //                                         color: ArgonColors.primary,
    //                                         onPressed: () {
    //                                           // Respond to button press
    //                                           Navigator.pushNamed(
    //                                               context, '/home');
    //                                         },
    //                                         shape: RoundedRectangleBorder(
    //                                           borderRadius:
    //                                               BorderRadius.circular(4.0),
    //                                         ),
    //                                         child: Padding(
    //                                             padding: EdgeInsets.only(
    //                                                 left: 16.0,
    //                                                 right: 16.0,
    //                                                 top: 12,
    //                                                 bottom: 12),
    //                                             child: Text("REGISTER",
    //                                                 style: TextStyle(
    //                                                     fontWeight:
    //                                                         FontWeight.w600,
    //                                                     fontSize: 16.0))),
    //                                       ),
    //                                     ),
    //                                   )
    //                                 ],
    //                               ),
    //                             ),
    //                           ))
    //                     ],
    //                   )),
    //             ),
    //           ]),
    //         )
    //       ],
    //     ));
  }
}
