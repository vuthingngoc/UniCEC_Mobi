import 'package:flutter/material.dart';
import 'package:unicec_mobi/models/entities/member/member_detail_model.dart';
import 'package:unicec_mobi/screens/club/widgets/club_pic.dart';
import '../../../constants/Constants.dart';
import '../../../constants/Theme.dart';
import '../../../models/entities/club/club_model.dart';
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
            Padding(
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
                        color: Color.fromRGBO(
                            50, 50, 93, 1),
                        fontSize: 23.0,
                      ),
                    )
                ),
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
                        color: Color.fromRGBO(
                            50, 50, 93, 1),
                        fontSize: 16.0,
                      ),
                    )
                ),
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
                  maxLines: 10, style: TextStyle(fontSize: 16),
                ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: Column(children: [
            if (widget.club?.clubFanpage != null || widget.club?.clubContact != null)
            Row(
              children: [
                Text(
                  'Thông tin liên hệ',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 10),
            if (widget.club?.clubFanpage != null)
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  Icon(Icons.web),
                  SizedBox(width: 10),
                  Text(
                    widget.club?.clubFanpage ?? '', style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            if (widget.club?.clubContact != null)
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  Icon(Icons.phone),
                  SizedBox(width: 10),
                  Text(
                    widget.club?.clubContact ?? '', style: TextStyle(fontSize: 16)
                  ),
                ],
              ),
            )
          ]),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: Column(children: [
            Text(
              'Thông tin của thành viên',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor,
                  fontSize: 20),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.person),
                SizedBox(width: 10),
                Text(
                  widget.member?.name ?? 'Không có dữ liệu tên của thành viên',
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.phone),
                SizedBox(width: 10),
                Text(
                  widget.member?.phone ?? 'Không có phone của thành viên',
                ),
              ],
            ),
            Row(children: [
              Text('Vai trò:'),
              SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.green[300],
                ),
                height: 20,
                child: Text(
                  widget.member?.clubRoleName ?? 'Không có Role Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ]),
          ]),
        )
      ],
    );
  }
}
