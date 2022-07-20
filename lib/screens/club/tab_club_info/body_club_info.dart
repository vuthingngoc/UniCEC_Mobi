import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicec_mobi/bloc/club/club_event.dart';
import '../../../bloc/club/club_bloc.dart';
import '../../../models/entities/club/club_model.dart';
import '../../size_config.dart';
import 'club_info_description.dart';
import 'default_button.dart';
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
    ClubBloc bloc = BlocProvider.of<ClubBloc>(context);
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        return ListView(
          children: [
            ClubImages(club: widget.Club),
            TopRoundedContainer(
              color: Colors.white,
              child: Column(
                children: [
                  ClubDescription(
                    club: widget.Club,
                    //pressOnSeeMore: () {},
                  ),
                  //
                  TopRoundedContainer(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: SizeConfig.screenWidth * 0.15,
                        right: SizeConfig.screenWidth * 0.15,
                        bottom: getProportionateScreenWidth(40),
                        top: getProportionateScreenWidth(15),
                      ),
                      child: DefaultButton(
                        text: "Chọn Câu Lạc Bộ Khác",
                        press: () {
                          bloc.add(ChooseAnotherClubEvent());
                        },
                      ),
                    ),
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
      },
    );
  }
}
