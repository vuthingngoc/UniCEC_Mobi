import 'package:flutter/material.dart';
import '../../constants/theme.dart';
import '../../models/enums/competition_scope_status.dart';
import '../../models/enums/competition_status.dart';
import '../size_config.dart';

class CardSmall extends StatelessWidget {
  CardSmall(
      {this.title = "Placeholder Title",
      this.cta = "",
      this.date = "",
      this.type = "",
      this.status = CompetitionStatus.Draft,
      this.img = "https://via.placeholder.com/200",
      this.tap = defaultFunc,
      required this.isEvent,
      required this.scope,
      this.width});

  final String cta;
  final String img;
  VoidCallback tap;
  final String title;
  final String date;
  final String type;
  final double? width;
  final CompetitionStatus status;
  final bool isEvent;
  final CompetitionScopeStatus scope;

  static void defaultFunc() {
    print("the function works!");
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = width ?? MediaQuery.of(context).size.width - 48.0;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      width: screenWidth,
      height: screenHeight / 2,
      child: GestureDetector(
        onTap: tap,
        child: Card(
            elevation: 0.4,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    fit: FlexFit.loose,
                    flex: 2,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(6.0),
                                topRight: Radius.circular(6.0)),
                            image: DecorationImage(
                              image: NetworkImage(img, scale: 80),
                              fit: BoxFit.cover,
                            )))),
                Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 5.0, left: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("@$type",
                                  style: const TextStyle(
                                      color: ArgonColors.warning,
                                      fontSize: 16)),
                              Container(
                                margin: const EdgeInsets.only(right: 20),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.red),
                                    color: Colors.red,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5))),
                                child: Text(date,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    )),
                              ),
                            ],
                          ),
                          Text(title,
                              style: const TextStyle(
                                  color: ArgonColors.header, fontSize: 18)),
                          //   Text(cta,
                          // style: TextStyle(
                          //     color: ArgonColors.primary,
                          //     fontSize: 11,
                          //     fontWeight: FontWeight.w600)),
                          // Align(
                          //   alignment: Alignment.bottomLeft,
                          //   // padding: const EdgeInsets.only(top: 8.0),
                          //   child:
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(cta,
                                    style: const TextStyle(
                                        color: ArgonColors.primary,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600)),
                                Container(
                                  //margin: const EdgeInsets.all(10.0),
                                  // padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: (status ==
                                                  CompetitionStatus.Publish)
                                              ? Colors.orangeAccent
                                              : (status ==
                                                      CompetitionStatus
                                                          .Register)
                                                  ? Colors.green
                                                  : (status ==
                                                          CompetitionStatus
                                                              .Upcoming)
                                                      ? Colors.cyan
                                                      : (status ==
                                                              CompetitionStatus
                                                                  .Start)
                                                          ? Colors.redAccent
                                                          : (status ==
                                                                  CompetitionStatus
                                                                      .OnGoing)
                                                              ? Colors.amber
                                                              : (status ==
                                                                      CompetitionStatus
                                                                          .End)
                                                                  ? Colors
                                                                      .purple
                                                                  : (status ==
                                                                          CompetitionStatus
                                                                              .Finish)
                                                                      ? Colors
                                                                          .blue
                                                                      : (status ==
                                                                              CompetitionStatus
                                                                                  .Complete)
                                                                          ? Colors
                                                                              .greenAccent
                                                                          : (status ==
                                                                                  CompetitionStatus
                                                                                      .Pending)
                                                                              ? Colors
                                                                                  .pinkAccent
                                                                              : (status ==
                                                                                      CompetitionStatus
                                                                                          .Cancel)
                                                                                  ? Colors
                                                                                      .red
                                                                                  : Colors
                                                                                      .grey),
                                      color: (status ==
                                              CompetitionStatus.Publish)
                                          ? Colors.orangeAccent
                                          : (status ==
                                                  CompetitionStatus.Register)
                                              ? Colors.green
                                              : (status ==
                                                      CompetitionStatus
                                                          .Upcoming)
                                                  ? Colors.cyan
                                                  : (status ==
                                                          CompetitionStatus
                                                              .Start)
                                                      ? Colors.redAccent
                                                      : (status ==
                                                              CompetitionStatus
                                                                  .OnGoing)
                                                          ? Colors.amber
                                                          : (status ==
                                                                  CompetitionStatus
                                                                      .End)
                                                              ? Colors.purple
                                                              : (status ==
                                                                      CompetitionStatus
                                                                          .Finish)
                                                                  ? Colors.blue
                                                                  : (status ==
                                                                          CompetitionStatus
                                                                              .Complete)
                                                                      ? Colors
                                                                          .greenAccent
                                                                      : (status ==
                                                                              CompetitionStatus.Pending)
                                                                          ? Colors.pinkAccent
                                                                          : (status == CompetitionStatus.Cancel)
                                                                              ? Colors.red
                                                                              : Colors.grey,
                                      borderRadius: BorderRadius.all(Radius.circular(10))),
                                  child: Text(
                                      (status == CompetitionStatus.Publish)
                                          ? 'Công bố'
                                          : (status ==
                                                  CompetitionStatus.Register)
                                              ? 'Mở Đăng Ký'
                                              : (status ==
                                                      CompetitionStatus
                                                          .Upcoming)
                                                  ? 'Sắp Diễn Ra'
                                                  : (status ==
                                                          CompetitionStatus
                                                              .Start)
                                                      ? 'Khai Mạc'
                                                      : (status ==
                                                              CompetitionStatus
                                                                  .OnGoing)
                                                          ? 'Đang Diễn Ra'
                                                          : (status ==
                                                                  CompetitionStatus
                                                                      .End)
                                                              ? 'Kết Thúc'
                                                              : (status ==
                                                                      CompetitionStatus
                                                                          .Finish)
                                                                  ? 'Hoàn Thành'
                                                                  : (status ==
                                                                          CompetitionStatus
                                                                              .Complete)
                                                                      ? 'Đóng Cuộc Thi'
                                                                      : (status ==
                                                                              CompetitionStatus.Pending)
                                                                          ? 'Chờ'
                                                                          : (status == CompetitionStatus.Cancel)
                                                                              ? 'Hủy'
                                                                              : 'Trạng thái khác',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      )),
                                )
                              ]),
                          //),
                        ],
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}
