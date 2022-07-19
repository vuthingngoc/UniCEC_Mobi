import 'package:flutter/material.dart';
import '../../../models/entities/club/club_model.dart';
import 'club_info_description.dart';
import 'images_club_info.dart';
import 'top_rounded_container.dart';

class BodyClubInfo extends StatefulWidget {
  final ClubModel? Club;

  BodyClubInfo({Key? key, required this.Club}) : super(key: key);

  @override
  State<BodyClubInfo> createState() => _BodyClubInfoState();
}

class _BodyClubInfoState extends State<BodyClubInfo> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ClubImages(club: widget.Club),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ClubDescription(
                club: widget.Club,
                pressOnSeeMore: () {},
              ),
              //Club Contact
              // TopRoundedContainer(
              //   color: Color(0xFFF6F7F9),
              //   child: Column(
              //     children: [
              //       ColorDots(product: widget.product),
              //       TopRoundedContainer(
              //         color: Colors.white,
              //         child: Padding(
              //           padding: EdgeInsets.only(
              //             left: SizeConfig.screenWidth * 0.15,
              //             right: SizeConfig.screenWidth * 0.15,
              //             bottom: getProportionateScreenWidth(40),
              //             top: getProportionateScreenWidth(15),
              //           ),
              //           // child: DefaultButton(
              //           //   text: "Add To Cart",
              //           //   press: () {},
              //           // ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
