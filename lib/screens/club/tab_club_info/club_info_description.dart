import 'package:flutter/material.dart';
import 'package:unicec_mobi/models/entities/member/member_detail_model.dart';
import 'package:unicec_mobi/utils/router.dart';
import '../../../constants/Theme.dart';
import '../../../models/entities/club/club_model.dart';
import '../../../utils/router.dart';
import '../../size_config.dart';

class ClubDescription extends StatefulWidget {
  const ClubDescription({
    Key? key,
    required this.club,
    required this.member,
  }) : super(key: key);

  final ClubModel? club;
  final MemberDetailModel? member;

  @override
  State<ClubDescription> createState() => _ClubDescriptionState();
}

class _ClubDescriptionState extends State<ClubDescription> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(left: 25.0),
            //   child: ClubPic(avatar: avatar),
            // ),
            const Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 20),
              child: FractionalTranslation(
                  translation: Offset(0.0, -0.5),
                  child: Align(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(//AssetImage(
                          "https://lh3.googleusercontent.com/DQj-gonAVTlhj5W7_DhBVmX-0P42rfvx8TSp1WfQeZ6iFIon6InIS8M4Nbqy7Ql5ahgEXSiRDiWD88v-bcPYIEAg3Q=w640-h400-e365-rj-sc0x00ffffff"),
                      radius: 40.0,
                      // maxRadius: 200.0,
                    ),
                    alignment: FractionalOffset(0.5, 0.0),
                  )),
            ),
            Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: (widget.club?.name == null)
                        ? Text(
                            'Không tìm thấy tên',
                            style: Theme.of(context).textTheme.headline6,
                          )
                        : Text(
                            widget.club!.name,
                            style: TextStyle(
                              color: Color.fromRGBO(50, 50, 93, 1),
                              fontSize: 23.0,
                            ),
                          )),
                Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    child: (widget.club?.founding == null)
                        ? Text(
                            '',
                            style: Theme.of(context).textTheme.headline6,
                          )
                        : Text(
                            widget.club!.founding.toString(),
                            style: TextStyle(
                              color: Color.fromRGBO(50, 50, 93, 1),
                              fontSize: 16.0,
                            ),
                          )),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: (widget.club?.description == null)
              ? Text(
                  '',
                  maxLines: 10,
                )
              : Text(
                  widget.club!.description,
                  maxLines: 10,
                  style: TextStyle(fontSize: 16),
                ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: Column(children: [
            Row(
              children: [
                Text(
                  'Thông tin cá nhân',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 10),
            if (widget.member?.name != null)
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  children: [
                    Icon(Icons.account_circle),
                    SizedBox(width: 10),
                    Text(widget.member?.name ?? '',
                        style: TextStyle(fontSize: 16)),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.orangeAccent),
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text(widget.member?.clubRoleName ?? 'Thành viên',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          )),
                    ),
                  ],
                ),
              ),
            // SizedBox(height: 10),
            // if (widget.member?.phone != null)
            //   Padding(
            //     padding: const EdgeInsets.only(left: 30.0),
            //     child: Row(
            //       children: [
            //         Icon(Icons.phone),
            //         SizedBox(width: 10),
            //         Text(widget.member?.phone ?? '',
            //             style: TextStyle(fontSize: 16)),
            //       ],
            //     ),
            //   ),
            // // SizedBox(height: 10),
          ]),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Row(
              children: const [
                Text(
                  'Xem danh sách thành viên của CLB',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: 220.0,
              height: 36,
              margin: new EdgeInsets.only(bottom: 15),
              child: RaisedButton(
                  textColor: ArgonColors.primary,
                  color: ArgonColors.secondary,
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.viewListMember);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, top: 10, left: 8, right: 8),
                      child: Row(
                        // mainAxisAlignment:
                        // MainAxisAlignment
                        //     .spaceAround,
                        children: const [
                          Icon(
                              Icons.description,
                              size: 13),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Danh sách thành viên",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16))
                        ],
                      ))),
            ),
          ]),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: Column(children: [
            Wrap(
              children: const [
                Text(
                  'Các cuộc thi và sự kiện câu lạc bộ hiện có',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: 305.0,
              height: 36,
              child: RaisedButton(
                  textColor: ArgonColors.primary,
                  color: ArgonColors.secondary,
                  onPressed: () {
                    Navigator.pushNamed(context, '/viewListCompetitionOfClub');
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  child: Padding(
                      padding:
                      const EdgeInsets.only(
                          bottom: 10,
                          top: 10,
                          left: 8,
                          right: 8),
                      child: Row(
                        // mainAxisAlignment:
                        // MainAxisAlignment
                        //     .spaceAround,
                        children: const [
                          Icon(Icons.description, size: 13),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Danh sách Cuộc Thi & Sự Kiện",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16))
                        ],
                      ))),
            ),
            const SizedBox(height: 10),
          ]),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            // vertical: 10,
          ),
          child: Column(children: [
            if (widget.club?.clubFanpage != null ||
                widget.club?.clubContact != null)
              Row(
                children: const [
                  Text(
                    'Thông tin liên hệ',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                ],
              ),
            const SizedBox(height: 10),
            if (widget.club?.clubFanpage != null)
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Wrap(
                  children: [
                    const Icon(Icons.web),
                    const SizedBox(width: 10),
                    Text(
                      widget.club?.clubFanpage ?? '',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 10),
            if (widget.club?.clubContact != null)
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Wrap(
                  alignment: WrapAlignment.start,            
                  children: [
                    const Icon(Icons.phone),
                    const SizedBox(width: 10),
                    Text(widget.club?.clubContact ?? '',
                        style: const TextStyle(fontSize: 16)),
                  ],
                ),
              )
          ]),
        ),
      ],
    );
  }
}
