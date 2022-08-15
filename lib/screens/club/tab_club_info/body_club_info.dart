import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicec_mobi/bloc/club/club_event.dart';
import 'package:unicec_mobi/models/entities/member/member_detail_model.dart';
import '../../../bloc/club/club_bloc.dart';
import '../../../constants/Theme.dart';
import '../../../models/entities/club/club_model.dart';
import '../../../utils/loading.dart';
import 'club_info_description.dart';

class BodyClubInfo extends StatefulWidget {
  final ClubModel? Club;
  final MemberDetailModel? Member;

  BodyClubInfo({Key? key, required this.Club, required this.Member})
      : super(key: key);

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
        return (widget.Club == null)
            ? Loading()
            : ListView(
                children: [
                  // ClubImages(club: widget.Club),
                  Column(
                    children: [
                      ClubDescription(
                        club: widget.Club,
                        member: widget.Member,
                      ),
                      //
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                              right: 15, left: 15, bottom: 15),
                          child: FlatButton(
                            textColor: ArgonColors.white,
                            color: ArgonColors.warning,
                            onPressed: () {
                              bloc.add(ChooseAnotherClubEvent());
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: const Padding(
                                padding: EdgeInsets.only(
                                    left: 16.0,
                                    right: 16.0,
                                    top: 12,
                                    bottom: 12),
                                child: Text("Chọn câu lạc bộ khác",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.0))),
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
                ],
              );
      },
    );
  }
}
