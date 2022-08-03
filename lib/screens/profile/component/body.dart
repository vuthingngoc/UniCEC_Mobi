import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/models/common/current_user.dart';
import 'package:unicec_mobi/utils/firebase.dart';
import 'package:unicec_mobi/utils/router.dart';

import '../../../bloc/profile/profile_bloc.dart';
import '../../../bloc/profile/profile_state.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  String avatar = GetIt.I.get<CurrentUser>().avatar!;
  ProfileBloc bloc;
  ProfileState state;
  Body({Key? key, required this.bloc, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(avatar: avatar),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Thông tin chi tiết",
            icon: "assets/icons/icon-user.svg",
            press: () => {Navigator.pushNamed(context, Routes.myAccount)},
          ),
          ProfileMenu(
            text: "Các cuộc thi & sự kiện đang tham gia",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Cài đặt",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Trung tâm trợ giúp",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Đăng xuất",
            icon: "assets/icons/Log out.svg",
            press: () {
              FirebaseUtils.logout();
              Navigator.pushReplacementNamed(context, Routes.login);
            },
          ),
        ],
      ),
    );
  }
}