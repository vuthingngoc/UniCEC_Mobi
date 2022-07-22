import 'package:flutter/material.dart';
import 'package:unicec_mobi/models/entities/member/member_detail_model.dart';
import '../../../constants/Constants.dart';
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
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  "Thông Tin Câu Lạc Bộ",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                      fontSize: 20),
                ),
              ],
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: (widget.club?.name == null)
                ? Text(
                    'Không có dữ liệu name',
                    style: Theme.of(context).textTheme.headline6,
                  )
                : Text(
                    widget.club!.name,
                    style: Theme.of(context).textTheme.headline5,
                  )),
        // Align(
        //   alignment: Alignment.centerRight,
        //   child: Container(
        //     padding: EdgeInsets.all(getProportionateScreenWidth(15)),
        //     width: getProportionateScreenWidth(64),
        //     decoration: BoxDecoration(
        //       color:
        //           widget.product.isFavourite ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
        //       borderRadius: BorderRadius.only(
        //         topLeft: Radius.circular(20),
        //         bottomLeft: Radius.circular(20),
        //       ),
        //     ),
        //     child: SvgPicture.asset(
        //       "assets/icons/Heart Icon_2.svg",
        //       color:
        //           widget.product.isFavourite ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
        //       height: getProportionateScreenWidth(16),
        //     ),
        //   ),
        // ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: (widget.club?.description == null)
              ? Text(
                  'Không có dữ liệu Description',
                  maxLines: 10,
                )
              : Text(
                  widget.club!.description,
                  maxLines: 10,
                ),
        ),
        // Padding(
        //   padding: EdgeInsets.symmetric(
        //     horizontal: getProportionateScreenWidth(20),
        //     vertical: 10,
        //   ),
        //   child: GestureDetector(
        //     onTap: () {},
        //     child: Row(
        //       children: [
        //         Text(
        //           "See More Detail",
        //           style: TextStyle(
        //               fontWeight: FontWeight.w600, color: kPrimaryColor),
        //         ),
        //         SizedBox(width: 5),
        //         Icon(
        //           Icons.arrow_forward_ios,
        //           size: 12,
        //           color: kPrimaryColor,
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: Column(children: [
            Text(
              'Liên Hệ và Hợp Tác với Chúng Tôi',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor,
                  fontSize: 20),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.web),
                SizedBox(width: 10),
                Text(
                  widget.club?.clubFanpage ?? 'Không có dữ liệu clubFanpage',
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.phone),
                SizedBox(width: 10),
                Text(
                  widget.club?.clubContact ?? 'Không có dữ liệu clubContact',
                ),
              ],
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
