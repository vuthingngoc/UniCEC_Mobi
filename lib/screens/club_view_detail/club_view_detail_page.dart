import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicec_mobi/bloc/club_view_detail/club_view_detail_bloc.dart';
import 'package:unicec_mobi/models/entities/club/club_model.dart';
import 'package:unicec_mobi/models/enums/member_status.dart';
import 'package:unicec_mobi/screens/club_view_detail/widgets/images_club_view_detail.dart';
import 'package:unicec_mobi/screens/club_view_detail/widgets/top_rounded_container.dart';
import '../../bloc/club_view_detail/club_view_detail_event.dart';
import '../../bloc/club_view_detail/club_view_detail_state.dart';
import '../../utils/app_color.dart';
import '../club/tab_club_info/default_button.dart';
import '../size_config.dart';
import 'widgets/description_club_view_detail.dart';

class ClubViewDetailPage extends StatefulWidget {
  final ClubViewDetailBloc bloc;

  ClubViewDetailPage({required this.bloc});

  @override
  State<ClubViewDetailPage> createState() => _ClubViewDetailPageState();
}

class _ClubViewDetailPageState extends State<ClubViewDetailPage> {
  ClubViewDetailBloc get bloc => widget.bloc;

  void didChangeDependencies() {
    super.didChangeDependencies();
    //nhận data từ trang login
    RouteSettings settings = ModalRoute.of(context)!.settings;
    if (settings.arguments != null) {
      ClubModel clubSelected = settings.arguments as ClubModel;

      if (clubSelected != null) {
        //thêm sự kiện để cập nhật state
        bloc.add(RecieveDataEvent(clubView: clubSelected));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<ClubViewDetailBloc, ClubViewDetailState>(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              title: const Text("Câu lạc bộ",
                  style: TextStyle(color: Colors.white)),
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.mainColor,
              centerTitle: true,
            ),
            body: ListView(
              children: [
                //ClubImages(club: state.clubViewDetail),
                TopRoundedContainer(
                  color: Colors.white,
                  child: Column(
                    children: [
                      ClubViewDetailDescription(club: state.clubViewDetail),
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
                        ),
                      ),
                      //Pending
                      (state.statusMember == MemberStatus.Pending)
                          ? TopRoundedContainer(
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: SizeConfig.screenWidth * 0.15,
                                  right: SizeConfig.screenWidth * 0.15,
                                  bottom: getProportionateScreenWidth(40),
                                  top: getProportionateScreenWidth(15),
                                ),
                                child: DefaultButton(
                                  text: "Đang đợi duyệt",
                                  press: () {},
                                ),
                              ),
                            )
                          :
                          //Active
                          (state.statusMember == MemberStatus.Active)
                              ? TopRoundedContainer(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: SizeConfig.screenWidth * 0.15,
                                      right: SizeConfig.screenWidth * 0.15,
                                      bottom: getProportionateScreenWidth(40),
                                      top: getProportionateScreenWidth(15),
                                    ),
                                    child: DefaultButton(
                                      text: "Đã là thành viên",
                                      press: () {},
                                    ),
                                  ),
                                )
                              :
                              //In Active
                              (state.statusMember == MemberStatus.InActive)
                                  ? TopRoundedContainer(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: SizeConfig.screenWidth * 0.15,
                                          right: SizeConfig.screenWidth * 0.15,
                                          bottom:
                                              getProportionateScreenWidth(40),
                                          top: getProportionateScreenWidth(15),
                                        ),
                                        child: DefaultButton(
                                          text:
                                              "Thành viên không còn hoạt động",
                                          press: () {},
                                        ),
                                      ),
                                    )
                                  :
                                  //Chưa tham gia clb
                                  (state.statusMember == MemberStatus.Student)
                                      ? TopRoundedContainer(
                                          color: Colors.white,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              left:
                                                  SizeConfig.screenWidth * 0.15,
                                              right:
                                                  SizeConfig.screenWidth * 0.15,
                                              bottom:
                                                  getProportionateScreenWidth(
                                                      40),
                                              top: getProportionateScreenWidth(
                                                  15),
                                            ),
                                            child: DefaultButton(
                                              text: "Tham gia Câu Lạc Bộ",
                                              press: () {
                                                bloc.add(ApplyInClubEvent(
                                                    clubId: state
                                                        .clubViewDetail!.id));
                                              },
                                            ),
                                          ),
                                        )
                                      : TopRoundedContainer(
                                          color: Colors.white,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              left:
                                                  SizeConfig.screenWidth * 0.15,
                                              right:
                                                  SizeConfig.screenWidth * 0.15,
                                              bottom:
                                                  getProportionateScreenWidth(
                                                      40),
                                              top: getProportionateScreenWidth(
                                                  15),
                                            ),
                                            child: DefaultButton(
                                              text: "Lỗi",
                                              press: () {},
                                            ),
                                          ),
                                        )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
