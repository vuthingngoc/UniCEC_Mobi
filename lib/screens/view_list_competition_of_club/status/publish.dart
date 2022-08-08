import 'package:flutter/material.dart';
import '../../size_config.dart';
import '../../widgets/card-small.dart';
import '../widgets/section_title.dart';

class PublishPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(15)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(5)),
              child: SectionTitleCompetitionOfClub(
                title: "Đã đăng bài",
                press: () {},
              ),
            ),
            SizedBox(height: 8.0),
            Column(
              children: [
                Wrap(children: [
                  CardSmall(
                      cta: "Xem thêm",
                      title: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                      img: "https://i.ytimg.com/vi/dip_8dmrcaU/maxresdefault.jpg",
                      type: 'aaaaaaaaaaaaaaaaaaa',
                      date: 'aaaaaaa',
                      tap: () {
                        // Navigator.of(context).pushNamed(
                        //     Routes.detailCompetition);
                      })
                ])
              ],
            )
          ],
        ),
      ),
    );
  }
}
