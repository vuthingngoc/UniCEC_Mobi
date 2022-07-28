import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/bloc/my_account/my_account_bloc.dart';
import 'package:unicec_mobi/bloc/profile/profile_bloc.dart';
import 'package:unicec_mobi/bloc/profile/profile_state.dart';
import '../../bloc/my_account/my_account_event.dart';
import '../../bloc/my_account/my_account_state.dart';
import '../../bloc/profile/profile_event.dart';
import '../../constants/theme.dart';

//widgets
import '../../models/common/current_user.dart';
import '../../utils/dimens.dart';
import 'widgets/navbar_profile.dart';
import '../widgets/drawer.dart';

class MyAccountPage extends StatefulWidget {
  final MyAccountBloc bloc;

  MyAccountPage({required this.bloc});

  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  MyAccountBloc get _bloc => widget.bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc.listenerStream.listen((event) {});
    _bloc.add(LoadInfoAccountEvent());
  }

  @override
  Widget build(BuildContext context) {
    CurrentUser currentUser = GetIt.I.get<CurrentUser>();

    return BlocBuilder<MyAccountBloc, MyAccountState>(
        bloc: _bloc,
        builder: (context, state) {
          // print('user: ${currentUser.avatar}');
          return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: NavbarProfile(
                title: "Thông Tin Sinh Viên",
                transparent: true,
                backButton: true,
              ),
              backgroundColor: ArgonColors.bgColorScreen,
              drawer: ArgonDrawer(currentPage: "My account"),
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
                                                child: Text(
                                                    "${currentUser.fullname}",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            50, 50, 93, 1),
                                                        fontSize: 28.0,
                                                        fontWeight:
                                                            FontWeight.w800)),
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
                                                            FontWeight.w300)),
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
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              188,
                                                              189,
                                                              190),
                                                          fontSize: 17.0,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                ),
                                              ),
                                              SizedBox(height: Dimens.size20),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: Dimens.size20),
                                                child: Card(
                                                  elevation: 4,
                                                  child: Column(children: [
                                                    Padding(
                                                      padding: EdgeInsets.all(
                                                          Dimens.size10),
                                                      child: Row(children: [
                                                        Icon(Icons.school),
                                                        //account_circle_outlined
                                                        SizedBox(
                                                          width: Dimens.size20,
                                                        ),
                                                        Text(
                                                          state.user.universityName ??
                                                              '',
                                                          style: TextStyle(
                                                              fontSize: Dimens
                                                                  .size16),
                                                        )
                                                      ]),
                                                    ),
                                                    Divider(
                                                      height: 0.6,
                                                      color: Colors.black,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.all(
                                                          Dimens.size10),
                                                      child: Row(children: [
                                                        Icon(Icons
                                                            .business_center),
                                                        SizedBox(
                                                          width: Dimens.size20,
                                                        ),
                                                        Text(
                                                          state.user.departmentName ??
                                                              '',
                                                          style: TextStyle(
                                                              fontSize: 16),
                                                        )
                                                      ]),
                                                    ),
                                                    Divider(
                                                      height: 0.6,
                                                      color: Colors.black,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.all(
                                                          Dimens.size10),
                                                      child: Row(children: [
                                                        Icon(Icons
                                                            .control_point),
                                                        SizedBox(
                                                          width: Dimens.size20,
                                                        ),
                                                        Text(
                                                          'SeedsPoint: ${state.seedsWallet.amount}',
                                                          style: TextStyle(
                                                              fontSize: 16),
                                                        )
                                                      ]),
                                                    ),
                                                    Divider(
                                                      height: 0.6,
                                                      color: Colors.black,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.all(
                                                          Dimens.size10),
                                                      child: Row(children: [
                                                        Icon(Icons
                                                            .alternate_email),
                                                        SizedBox(
                                                          width: Dimens.size20,
                                                        ),
                                                        Text(
                                                          state.user.email,
                                                          style: TextStyle(
                                                              fontSize: Dimens
                                                                  .size16),
                                                        )
                                                      ]),
                                                    ),
                                                    Divider(
                                                      height: 0.6,
                                                      color: Colors.black,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.all(
                                                          Dimens.size10),
                                                      child: Row(children: [
                                                        Icon(Icons.phone),
                                                        SizedBox(
                                                          width: Dimens.size20,
                                                        ),
                                                        Text(
                                                          state
                                                              .user.phoneNumber,
                                                          style: TextStyle(
                                                              fontSize: 16),
                                                        )
                                                      ]),
                                                    ),
                                                    Divider(
                                                      height: 0.6,
                                                      color: Colors.black,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.all(
                                                          Dimens.size10),
                                                      child: Row(children: [
                                                        Icon(Icons.cake),
                                                        SizedBox(
                                                          width: Dimens.size20,
                                                        ),
                                                        Text(
                                                          state.user.dob,
                                                          style: TextStyle(
                                                              fontSize: 16),
                                                        )
                                                      ]),
                                                    ),
                                                    Divider(
                                                      height: 0.6,
                                                      color: Colors.black,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.all(
                                                          Dimens.size10),
                                                      child: Row(children: [
                                                        Icon(Icons.transgender),
                                                        SizedBox(
                                                          width: Dimens.size20,
                                                        ),
                                                        Text(
                                                          state.user.gender,
                                                          style: TextStyle(
                                                              fontSize: 16),
                                                        )
                                                      ]),
                                                    ),
                                                    Divider(
                                                      height: 0.6,
                                                      color: Colors.black,
                                                    ),
                                                  ]),
                                                ),
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
                                        "${currentUser.avatar}"),
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
