import 'package:flutter/material.dart';
import 'package:unicec_mobi/bloc/profile/profile_bloc.dart';
import 'package:unicec_mobi/screens/widgets/input.dart';

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
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
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
                        child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 85.0, bottom: 20.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, top: 8),
                                        child: Text("Họ và tên", style: TextStyle(fontSize: 16),),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Input(
                                      placeholder: "",
                                      prefixIcon: Icon(Icons.drive_file_rename_outline),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, top: 8),
                                        child: Text("MSSV", style: TextStyle(fontSize: 16),),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Input(
                                      placeholder: "",
                                      prefixIcon: Icon(Icons.label),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, top: 8),
                                        child: Text("Miêu tả bản thân", style: TextStyle(fontSize: 16),),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Input(
                                      placeholder: "",
                                      prefixIcon: Icon(Icons.description),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, top: 8),
                                        child: Text("Trường", style: TextStyle(fontSize: 16),),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Input(
                                      placeholder: "",
                                      prefixIcon: Icon(Icons.school),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, top: 8),
                                        child: Text("Ngành học", style: TextStyle(fontSize: 16),),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Input(
                                      placeholder: "",
                                      prefixIcon: Icon(Icons.business_center),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, top: 8),
                                        child: Text("Email", style: TextStyle(fontSize: 16),),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Input(
                                      placeholder: "",
                                      prefixIcon: Icon(Icons.email),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, top: 8),
                                        child: Text("Số điện thoại", style: TextStyle(fontSize: 16),),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Input(
                                      placeholder: "",
                                      prefixIcon: Icon(Icons.phone),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, top: 8),
                                        child: Text("Ngày sinh", style: TextStyle(fontSize: 16),),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Input(
                                      placeholder: "",
                                      prefixIcon: Icon(Icons.cake),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, top: 8),
                                        child: Text("Giới tính", style: TextStyle(fontSize: 16),),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Input(
                                      placeholder: "",
                                      prefixIcon: Icon(Icons.transgender),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: FractionalTranslation(
                            translation: Offset(0.0, -0.5),
                            child: Align(
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(//AssetImage(
                                    ""),
                                radius: 65.0,
                                // maxRadius: 200.0,
                              ),
                              alignment: FractionalOffset(0.5, 0.0),
                            )),
                      )
                    ]),
                    Padding(
                      padding:
                      const EdgeInsets.only(bottom: 10),
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
                              child: Text("Lưu chỉnh sửa",
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
