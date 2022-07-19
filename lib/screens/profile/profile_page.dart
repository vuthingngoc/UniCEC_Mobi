import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/bloc/profile/profile_bloc.dart';
import 'package:unicec_mobi/bloc/profile/profile_state.dart';
import '../../bloc/profile/profile_event.dart';
import '../../constants/theme.dart';

//widgets
import '../../models/common/current_user.dart';
import 'widgets/navbar_profile.dart';
import '../widgets/drawer.dart';

class ProfilePage extends StatefulWidget {
  final ProfileBloc bloc;

  ProfilePage({required this.bloc});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  ProfileBloc get _bloc => widget.bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc.listenerStream.listen((event) {});
    _bloc.add(LoadProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
        bloc: _bloc,
        builder: (context, state) {
          print('user: ${state.user.avatar}');
          return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: NavbarProfile(
                title: "Thông Tin Sinh Viên",
                transparent: true,
              ),
              backgroundColor: ArgonColors.bgColorScreen,
              drawer: ArgonDrawer(currentPage: "Profile"),
              body: Stack(children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment.topCenter,
                            image:
                                AssetImage("assets/img/profile-screen-bg.png"),
                            fit: BoxFit.fitWidth))),
                SafeArea(
                  child: ListView(children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 74.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Stack(children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Card(
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  elevation: .0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 85.0, bottom: 20.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Align(
                                                child: Text("${state.user.fullname}",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            50, 50, 93, 1),
                                                        fontSize: 28.0)),
                                              ),
                                              SizedBox(height: 10.0),
                                              Align(
                                                child: Text(
                                                    "${state.user.studentCode}",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            50, 50, 93, 1),
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.w200)),
                                              ),
                                              Divider(
                                                height: 40.0,
                                                thickness: 1.5,
                                                indent: 32.0,
                                                endIndent: 32.0,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 32.0, right: 32.0),
                                                child: Align(
                                                  child: Text(
                                                      "${state.user.description}",
                                                      // "An artist of considerable range, Jessica name taken by Melbourne...",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              82, 95, 127, 1),
                                                          fontSize: 17.0,
                                                          fontWeight:
                                                              FontWeight.w200)),
                                                ),
                                              ),
                                              SizedBox(height: 15.0),
                                              Align(
                                                  child: Text("Show more",
                                                      style: TextStyle(
                                                          color: ArgonColors
                                                              .primary,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 16.0))),
                                              SizedBox(height: 25.0),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 25.0, left: 25.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Album",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16.0,
                                                          color:
                                                              ArgonColors.text),
                                                    ),
                                                    Text(
                                                      "View All",
                                                      style: TextStyle(
                                                          color: ArgonColors
                                                              .primary,
                                                          fontSize: 13.0,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 250,
                                                child: GridView.count(
                                                    primary: false,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 24.0,
                                                            vertical: 15.0),
                                                    crossAxisSpacing: 10,
                                                    mainAxisSpacing: 10,
                                                    crossAxisCount: 3,
                                                    children: <Widget>[
                                                      Container(
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            6.0)),
                                                            image: DecorationImage(
                                                                image: NetworkImage(
                                                                    "https://images.unsplash.com/photo-1501601983405-7c7cabaa1581?fit=crop&w=240&q=80"),
                                                                fit: BoxFit
                                                                    .cover),
                                                          )),
                                                      Container(
                                                          decoration:
                                                              BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    6.0)),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                "https://images.unsplash.com/photo-1543747579-795b9c2c3ada?fit=crop&w=240&q=80hoto-1501601983405-7c7cabaa1581?fit=crop&w=240&q=80"),
                                                            fit: BoxFit.cover),
                                                      )),
                                                      Container(
                                                          decoration:
                                                              BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    6.0)),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                "https://images.unsplash.com/photo-1551798507-629020c81463?fit=crop&w=240&q=80"),
                                                            fit: BoxFit.cover),
                                                      )),
                                                      Container(
                                                          decoration:
                                                              BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    6.0)),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                "https://images.unsplash.com/photo-1470225620780-dba8ba36b745?fit=crop&w=240&q=80"),
                                                            fit: BoxFit.cover),
                                                      )),
                                                      Container(
                                                          decoration:
                                                              BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    6.0)),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                "https://images.unsplash.com/photo-1503642551022-c011aafb3c88?fit=crop&w=240&q=80"),
                                                            fit: BoxFit.cover),
                                                      )),
                                                      Container(
                                                          decoration:
                                                              BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    6.0)),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                "https://images.unsplash.com/photo-1482686115713-0fbcaced6e28?fit=crop&w=240&q=80"),
                                                            fit: BoxFit.cover),
                                                      )),
                                                    ]),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                            FractionalTranslation(
                                translation: Offset(0.0, -0.5),
                                child: Align(
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(//AssetImage(
                                        "${state.user.avatar}"),//"assets/img/profile-screen-avatar.jpg"),
                                    radius: 65.0,
                                    // maxRadius: 200.0,
                                  ),
                                  alignment: FractionalOffset(0.5, 0.0),
                                ))
                          ]),
                        ],
                      ),
                    ),
                  ]),
                )
              ]));
        });
  }
}
