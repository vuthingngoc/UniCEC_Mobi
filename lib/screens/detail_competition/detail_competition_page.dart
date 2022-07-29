import 'package:flutter/material.dart';

import '../../constants/Theme.dart';
import '../../utils/app_color.dart';
import '../size_config.dart';
import '../widgets/drawer.dart';

class DetailCompetitionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.black),
          ),
          title: Text("Chi tiết",
              style: TextStyle(color: Colors.black, fontSize: 23)),
          centerTitle: true,
          backgroundColor: AppColors.backgroundPageColor,
        ),
        backgroundColor: ArgonColors.bgColorScreen,
        drawer: ArgonDrawer(currentPage: "Profile"),
        body: Stack(children: <Widget>[
          // Container(
          //     decoration: BoxDecoration(
          //         image: DecorationImage(
          //             alignment: Alignment.topCenter,
          //             image: AssetImage("assets/img/profile-screen-bg.png"),
          //             fit: BoxFit.fitWidth))),
          SafeArea(
            child: ListView(children: [
              Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 0.0),
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
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: .0,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 0.0, bottom: 20.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        //Image(image: Image.network("https://img.freepik.com/premium-photo/astronaut-outer-open-space-planet-earth-stars-provide-background-erforming-space-planet-earth-sunrise-sunset-our-home-iss-elements-this-image-furnished-by-nasa_150455-16829.jpg?w=2000"))
                                        SizedBox(height: 10.0),
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      6.0, 2.0, 10.0, 2.0),
                                              child: Container(
                                                  width: 48,
                                                  height: 48,
                                                  child: CircleAvatar(
                                                      backgroundImage: NetworkImage(
                                                          "https://i.guim.co.uk/img/media/8f3a8ada36ac29ebe3ea48c5a15b1011367a4b88/0_1347_2848_1707/master/2848.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=85c6ae7f192ba52424045118356548ab"))),
                                            ),
                                            Text(
                                              "Club UniCEC",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Expanded(
                                                child: SizedBox(
                                                    width:
                                                        getProportionateScreenWidth(
                                                            10))),
                                            Container(
                                              margin:
                                                  const EdgeInsets.all(15.0),
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.green),
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              child: Text("Không thu phí",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.0),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Align(
                                            child: Text(
                                                "Cuộc Thi Tôi Là Diễn Thuyết Gia 2022: Nơi Thỏa Mãn Niềm Đam Mê Diễn Thuyết",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        50, 50, 93, 1),
                                                    fontSize: 28.0)),
                                          ),
                                        ),
                                        SizedBox(height: 5.0),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10, left: 10),
                                          child: Row(
                                            children: [
                                              Text("#" + "Âm nhạc",
                                                  style: TextStyle(
                                                      color:
                                                          ArgonColors.warning,
                                                      fontSize: 18)),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text("#" + "Nhạc cụ",
                                                  style: TextStyle(
                                                      color:
                                                          ArgonColors.warning,
                                                      fontSize: 18)),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10.0),
                                        Image.network(
                                            "https://img.freepik.com/premium-photo/astronaut-outer-open-space-planet-earth-stars-provide-background-erforming-space-planet-earth-sunrise-sunset-our-home-iss-elements-this-image-furnished-by-nasa_150455-16829.jpg?w=2000"),
                                        SizedBox(height: 5.0),
                                        // Align(
                                        //   child: Text("San Francisco, USA",
                                        //       style: TextStyle(
                                        //           color: Color.fromRGBO(
                                        //               50, 50, 93, 1),
                                        //           fontSize: 18.0,
                                        //           fontWeight: FontWeight.w200)),
                                        // ),
                                        // Divider(
                                        //   height: 40.0,
                                        //   thickness: 1.5,
                                        //   indent: 32.0,
                                        //   endIndent: 32.0,
                                        // ),
                                        Row(
                                          children: [
                                            Container(
                                              margin:
                                                  const EdgeInsets.all(15.0),
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          Colors.orangeAccent),
                                                  color: Colors.orangeAccent,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              child: Text("Quản trị kinh doanh",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                  )),
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.all(15.0),
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          Colors.orangeAccent),
                                                  color: Colors.orangeAccent,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              child: Text("Ngôn ngữ",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 20),
                                          child: Row(
                                            children: [
                                              Icon(
                                                  Icons.calendar_today_outlined,
                                                  size: 23,
                                                  color: Colors.orange),
                                              SizedBox(width: 10.0),
                                              Text(
                                                "07-08-2022 16:37:48",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10.0),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 20),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.add_location_rounded,
                                                size: 23,
                                                color: Colors.orange,
                                              ),
                                              SizedBox(width: 10.0),
                                              Expanded(
                                                  child: Text(
                                                "Trường Đại học Ngoại thương - Cơ sở II TP. HCM, 2 Nguyễn Bỉnh Khiêm, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh",
                                                style: TextStyle(fontSize: 18),
                                              )),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10.0),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 20),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.account_balance_sharp,
                                                size: 23,
                                                color: Colors.orange,
                                              ),
                                              SizedBox(width: 10.0),
                                              Expanded(
                                                  child: Text(
                                                "Liên trường",
                                                style: TextStyle(fontSize: 18),
                                              )),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 40.0,
                                          thickness: 1.5,
                                          indent: 32.0,
                                          endIndent: 32.0,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20.0, right: 20),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  "Ra đời với sứ mệnh tạo một sân chơi bổ ích cho các bạn có niềm đam mê tiếng Trung và "
                                                  "đặc biệt là lĩnh vực diễn thuyết, giúp các thí sinh tự tin tỏa sáng và nói lên quan điểm của mình. "
                                                  "Cuộc thi Tôi là diễn thuyết gia 2022 được tổ chức bởi CLB Tiếng Trung HCH trường Đại học Hà Nội đã "
                                                  "thu hút đông đảo các bạn học sinh, sinh viên quan tâm ở các trường Đại học, "
                                                  "Cao đẳng đăng ký tham dự. Ngày 17/06/2022 vừa qua, vòng chung kết cuộc thi với chủ đề “50+50?” "
                                                  "đã diễn ra vô cùng thành công, các thí sinh đã thể hiện xuất sắc phần thi của mình.",
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10.0),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20.0, right: 20),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  "Các câu lạc bộ tham gia tổ chức",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20, top: 10),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        6.0, 2.0, 10.0, 2.0),
                                                child: Container(
                                                    width: 48,
                                                    height: 48,
                                                    child: CircleAvatar(
                                                        backgroundImage:
                                                            NetworkImage(
                                                                "https://smartindustry.vn/wp-content/uploads/2021/09/fpt-software.png"))),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        6.0, 2.0, 10.0, 2.0),
                                                child: Container(
                                                    width: 60,
                                                    height: 60,
                                                    child: CircleAvatar(
                                                        backgroundImage:
                                                            NetworkImage(
                                                                "https://bloggiamgia.vn/wp-content/uploads/2020/06/logo-sendo.png"))),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        6.0, 2.0, 10.0, 2.0),
                                                child: Container(
                                                    width: 60,
                                                    height: 60,
                                                    child: CircleAvatar(
                                                        backgroundImage:
                                                            NetworkImage(
                                                                "https://i.guim.co.uk/img/media/8f3a8ada36ac29ebe3ea48c5a15b1011367a4b88/0_1347_2848_1707/master/2848.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=85c6ae7f192ba52424045118356548ab"))),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20.0, right: 20, top: 10),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  "Ban giám khảo",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20, top: 10),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        6.0, 2.0, 10.0, 2.0),
                                                child: Container(
                                                    width: 60,
                                                    height: 60,
                                                    child: CircleAvatar(
                                                        backgroundImage:
                                                            NetworkImage(
                                                                "https://smartindustry.vn/wp-content/uploads/2021/09/fpt-software.png"))),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        6.0, 2.0, 10.0, 2.0),
                                                child: Container(
                                                    width: 60,
                                                    height: 60,
                                                    child: CircleAvatar(
                                                        backgroundImage:
                                                            NetworkImage(
                                                                "https://i.guim.co.uk/img/media/8f3a8ada36ac29ebe3ea48c5a15b1011367a4b88/0_1347_2848_1707/master/2848.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=85c6ae7f192ba52424045118356548ab"))),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20.0, right: 20, top: 10),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  "Các đơn vị tài trợ",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20, top: 10),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        6.0, 2.0, 10.0, 2.0),
                                                child: Container(
                                                    width: 60,
                                                    height: 60,
                                                    child: CircleAvatar(
                                                        backgroundImage:
                                                            NetworkImage(
                                                                "https://shojiki.vn/template/uploads/2021/04/samsung-logo.jpg"))),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                // width: 0,
                                                height: 36,
                                                child: RaisedButton(
                                                    textColor: ArgonColors
                                                        .primary,
                                                    color: ArgonColors
                                                        .secondary,
                                                    onPressed: () {
                                                      Navigator.pushNamed(
                                                          context, '/viewListTeam');
                                                    },
                                                    shape:
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            4)),
                                                    child: Padding(
                                                        padding:
                                                        EdgeInsets.only(
                                                            bottom: 10,
                                                            top: 10,
                                                            left: 14,
                                                            right: 14),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                          children: [
                                                            Icon(
                                                                Icons.description,
                                                                size: 13),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text("Các đội tham gia",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                    fontSize:
                                                                    15))
                                                          ],
                                                        ))),
                                              ),
                                              Container(
                                                // width: 0,
                                                height: 36,
                                                child: RaisedButton(
                                                    textColor: ArgonColors
                                                        .primary,
                                                    color: ArgonColors
                                                        .secondary,
                                                    onPressed: () {
                                                      Navigator.pushNamed(
                                                          context, '/viewListActivity');
                                                    },
                                                    shape:
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            4)),
                                                    child: Padding(
                                                        padding:
                                                        EdgeInsets.only(
                                                            bottom: 10,
                                                            top: 10,
                                                            left: 8,
                                                            right: 8),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                          children: [
                                                            Icon(
                                                                Icons.description,
                                                                size: 13),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text("Danh sách vòng thi",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                    fontSize:
                                                                    15))
                                                          ],
                                                        ))),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.all(15.0),
                                          padding: const EdgeInsets.all(3.0),
                                          decoration: BoxDecoration(
                                              border:
                                                  Border.all(color: Colors.red),
                                              color: Colors.red,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: Text(
                                              "Hạn cuối đăng ký: 04-08-2022 16:37:48",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10, left: 10),
                                          child: Row(
                                            children: [
                                              Text("",
                                                  style: TextStyle(
                                                      color:
                                                          ArgonColors.warning,
                                                      fontSize: 18)),
                                              Expanded(
                                                  child: SizedBox(
                                                width: 20,
                                              )),
                                              Text("26 lượt xem",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15)),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 16),
                                          child: Container(
                                            width: double.infinity,
                                            margin:
                                            new EdgeInsets.only(right: 15, left: 15, bottom: 15),
                                            child: FlatButton(
                                              textColor: ArgonColors.white,
                                              color: Colors.orange,
                                              onPressed: () {
                                                // Respond to button press
                                                Navigator.pushNamed(
                                                    context, '/home');
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
                                                  child: Text("Tham gia ngay",
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
                                ],
                              ),
                            )),
                      ),
                    ]),
                  ],
                ),
              ),
            ]),
          )
        ]));
  }
}