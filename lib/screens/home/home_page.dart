import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unicec_mobi/screens/home/widgets/navbar_home.dart';

import '../../constants/theme.dart';

//widgets
import '../size_config.dart';
import '../widgets/card-horizontal.dart';
import '../widgets/card-small.dart';
import '../widgets/card-square.dart';
import '../widgets/drawer.dart';
import 'widgets/SuggestCompetion.dart';
import 'widgets/section_title.dart';

final Map<String, Map<String, dynamic>> homeCards = {
  "Ice Cream": {
    "title": "Ice cream is made with carrageenan …",
    "image":
        "https://images.unsplash.com/photo-1516559828984-fb3b99548b21?ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80",
    "date": "20/05/2022",
    "type": "Âm nhạc",
  },
  "Makeup": {
    "title": "Is makeup one of your daily esse …",
    "image":
        "https://images.unsplash.com/photo-1519368358672-25b03afee3bf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2004&q=80",
    "date": "20/05/2022",
    "type": "Âm nhạc",
  },
  "Coffee": {
    "title": "Coffee is more than just a drink: It’s …",
    "image":
        "https://images.unsplash.com/photo-1500522144261-ea64433bbe27?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2102&q=80",
    "date": "20/05/2022",
    "type": "Âm nhạc",
  },
  "Fashion": {
    "title": "Fashion is a popular style, especially in …",
    "image":
        "https://images.unsplash.com/photo-1487222477894-8943e31ef7b2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1326&q=80",
    "date": "20/05/2022",
    "type": "Âm nhạc",
  },
  "Argon": {
    "title": "Argon is a great free UI packag …",
    "image":
        "https://images.unsplash.com/photo-1482686115713-0fbcaced6e28?fit=crop&w=1947&q=80",
    "date": "20/05/2022",
    "type": "Âm nhạc",
  }
};

class Home extends StatelessWidget {
  //final GlobalKey _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: NavbarHome(
          title: "Cuộc Thi và Sự Kiện",
          searchBar: true,
          categoryOne: "Liên Trường",
          categoryTwo: "Trong Trường",
        ),
        backgroundColor: ArgonColors.bgColorScreen,
        //key: _scaffoldKey,
        drawer: ArgonDrawer(currentPage: "Home"),
        body: Container(
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding: const EdgeInsets.only(top: 16.0),
                  child: SpecialOffers(),
                ),
                SizedBox(height: getProportionateScreenWidth(15)),
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
                  child: SectionTitle(
                    title: "Đang diễn ra",
                    press: () {},
                  ),
                ),
                //SizedBox(height: getProportionateScreenWidth(10)),
                // Padding(
                //   padding: EdgeInsets.symmetric(
                //     horizontal: getProportionateScreenWidth(15.0),
                //     vertical: getProportionateScreenWidth(10),
                //   ),
                //   child: Text.rich(
                //     TextSpan(
                //       style: TextStyle(color: Colors.black),
                //       children: [
                //         TextSpan(
                //           text: "AAAAAAAAAAA",
                //           style: TextStyle(
                //             fontSize: getProportionateScreenWidth(12),
                //
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: CardHorizontal(
                      cta: "Xem thêm",
                      title: homeCards["Ice Cream"]!['title'],
                      img: homeCards["Ice Cream"]!['image'],
                      type: homeCards["Ice Cream"]!['type'],
                      date: homeCards["Ice Cream"]!['date'],
                      tap: () {
                        Navigator.pushNamed(context, '/pro');
                      }),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardSmall(
                        cta: "Xem thêm",
                        title: homeCards["Makeup"]!['title'],
                        img: homeCards["Makeup"]!['image'],
                        type: homeCards["Makeup"]!['type'],
                        date: homeCards["Makeup"]!['date'],
                        tap: () {
                          Navigator.pushNamed(context, '/pro');
                        }),
                    CardSmall(
                        cta: "Xem thêm",
                        title: homeCards["Coffee"]!['title'],
                        img: homeCards["Coffee"]!['image'],
                        type: homeCards["Coffee"]!['type'],
                        date: homeCards["Coffee"]!['date'],
                        tap: () {
                          Navigator.pushNamed(context, '/pro');
                        })
                  ],
                ),
                SizedBox(height: 8.0),
                CardHorizontal(
                    cta: "Xem thêm",
                    title: homeCards["Fashion"]!['title'],
                    img: homeCards["Fashion"]!['image'],
                    type: homeCards["Fashion"]!['type'],
                    date: homeCards["Fashion"]!['date'],
                    tap: () {
                      Navigator.pushNamed(context, '/pro');
                    }),
                SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: CardSquare(
                      cta: "Xem thêm",
                      title: homeCards["Argon"]!['title'],
                      img: homeCards["Argon"]!['image'],
                      tap: () {
                        Navigator.pushNamed(context, '/pro');
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
