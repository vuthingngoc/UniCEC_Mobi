import 'package:flutter/material.dart';
import 'package:unicec_mobi/bloc/profile/profile_bloc.dart';

import '../../constants/Theme.dart';
import '../../utils/app_color.dart';
import '../../utils/dimens.dart';
import '../widgets/drawer.dart';
class EditMyAccountPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EditMyAccountPageState();
}

class _EditMyAccountPageState extends State<EditMyAccountPage>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.black),
          ),
          title: Text("Chỉnh sửa thông tin",
              style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: AppColors.backgroundPageColor,
        ),
        backgroundColor: AppColors.backgroundPageColor,
        body: Stack(children: <Widget>[
          SafeArea(
            child: ListView(children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 90.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(children: <Widget>[
                      Container(
                        // decoration: BoxDecoration(
                        //   boxShadow: [
                        //     BoxShadow(
                        //       color: Colors.grey.withOpacity(0.1),
                        //       spreadRadius: 1,
                        //       blurRadius: 7,
                        //       offset: Offset(
                        //           0, 3), // changes position of shadow
                        //     ),
                        //   ],
                        // ),
                        child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 85.0, bottom: 20.0),
                              child: Column(
                                children: [
                                  Align(
                                    child: Text(
                                        "tên nè",
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
                                        "Code nè",
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
                                          "mô tả bản thân",
                                          textAlign:
                                          TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 17.0,
                                              fontWeight:
                                              FontWeight.w400)),
                                    ),
                                  ),
                                  SizedBox(height: Dimens.size20),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Dimens.size20),
                                    child: Container(
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
                                                  'Trường đh',
                                              style: TextStyle(
                                                  fontSize: 18  ),
                                            )
                                          ]),
                                        ),
                                        // Divider(
                                        //   height: 0.6,
                                        //   color: Colors.black,
                                        // ),
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
                                                  'Ngành học',
                                              style: TextStyle(
                                                  fontSize: 18),
                                            )
                                          ]),
                                        ),
                                        // Divider(
                                        //   height: 0.6,
                                        //   color: Colors.black,
                                        // ),
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
                                              'SeedsPoint: 100',
                                              style: TextStyle(
                                                  fontSize: 17),
                                            )
                                          ]),
                                        ),
                                        // Divider(
                                        //   height: 0.6,
                                        //   color: Colors.black,
                                        // ),
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
                                              'email',
                                              style: TextStyle(
                                                  fontSize: 17),
                                            )
                                          ]),
                                        ),
                                        // Divider(
                                        //   height: 0.6,
                                        //   color: Colors.black,
                                        // ),
                                        Padding(
                                          padding: EdgeInsets.all(
                                              Dimens.size10),
                                          child: Row(children: [
                                            Icon(Icons.phone),
                                            SizedBox(
                                              width: Dimens.size20,
                                            ),
                                            Text(
                                              'Phone number',
                                              style: TextStyle(
                                                  fontSize: 17),
                                            )
                                          ]),
                                        ),
                                        // Divider(
                                        //   height: 0.6,
                                        //   color: Colors.black,
                                        // ),
                                        Padding(
                                          padding: EdgeInsets.all(
                                              Dimens.size10),
                                          child: Row(children: [
                                            Icon(Icons.cake),
                                            SizedBox(
                                              width: Dimens.size20,
                                            ),
                                            Text(
                                              "30-03-1111",
                                              style: TextStyle(
                                                  fontSize: 17),
                                            )
                                          ]),
                                        ),
                                        // Divider(
                                        //   height: 0.6,
                                        //   color: Colors.black,
                                        // ),
                                        Padding(
                                          padding: EdgeInsets.all(
                                              Dimens.size10),
                                          child: Row(children: [
                                            Icon(Icons.transgender),
                                            SizedBox(
                                              width: Dimens.size20,
                                            ),
                                            Text(
                                              'Nam',
                                              style: TextStyle(
                                                  fontSize: 17),
                                            )
                                          ]),
                                        ),
                                        // Divider(
                                        //   height: 0.6,
                                        //   color: Colors.black,
                                        // ),
                                      ]),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                      FractionalTranslation(
                          translation: Offset(0.0, -0.5),
                          child: Align(
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(//AssetImage(
                                  ""),
                              radius: 65.0,
                              // maxRadius: 200.0,
                            ),
                            alignment: FractionalOffset(0.5, 0.0),
                          ))
                    ]),
                    Padding(
                      padding:
                      const EdgeInsets.only(top: 16),
                      child: Container(
                        width: double.infinity,
                        margin:
                        new EdgeInsets.only(right: 15, left: 15, bottom: 15),
                        child: FlatButton(
                          textColor: ArgonColors.white,
                          color: ArgonColors.warning,
                          onPressed: () {
                            // Respond to button press
                            // Navigator.pushNamed(
                            //     context, '/home');
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(4.0),
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 16.0,
                                  right: 16.0,
                                  top: 12,
                                  bottom: 12),
                              child: Text("Chỉnh sửa thông tin",
                                  style: TextStyle(
                                      fontWeight:
                                      FontWeight.w600,
                                      fontSize: 18.0))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          )
        ])
    );
  }
}
