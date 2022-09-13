import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/view_detail_match/view_detail_match_bloc.dart';
import '../../../constants/Theme.dart';

class ViewDetailMatchMenu extends StatefulWidget {
  @override
  State<ViewDetailMatchMenu> createState() => _ViewDetailMatchMenuState();
}

class _ViewDetailMatchMenuState extends State<ViewDetailMatchMenu> {
  @override
  Widget build(BuildContext context) {
    ViewDetailMatchBloc bloc = BlocProvider.of<ViewDetailMatchBloc>(context);
    
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Align(
              child: Text(bloc.state.match.title,
                  style: const TextStyle(
                      color: Color.fromRGBO(50, 50, 93, 1), fontSize: 28.0)),
            ),
          ),
          //MatchType
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
            child: Row(
              children: [
                Row(
                  children: const [
                    Text(
                      'Các đội tham gia',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              children: [
                const Icon(
                  Icons.supervised_user_circle_outlined,
                  size: 23,
                  color: Colors.orange,
                ),
                const SizedBox(width: 10.0),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: ArgonColors.success),
                      color: ArgonColors.success,
                      borderRadius: const BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    "Team 1",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                Container(
                  // margin: const EdgeInsets.all(
                  //     15.0),
                  padding:
                  const EdgeInsets.all(
                      3.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: ArgonColors
                              .success),
                      color:
                      ArgonColors.success,
                      borderRadius:
                      const BorderRadius
                          .all(
                          Radius.circular(
                              10))),
                  child: Text(
                    "Team 2",
                    style: TextStyle(
                        fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 30.0,
            thickness: 1.5,
            indent: 32.0,
            endIndent: 32.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Row(
              children: [
                Row(
                  children: const [
                    Text(
                      'Kết quả',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              children: [
                Icon(
                  Icons.label,
                  size: 23,
                  color: Colors.orange,
                ),
                SizedBox(width: 10.0),
                Text(
                  "Team 1",
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: ArgonColors.warning),
                      color: ArgonColors.warning,
                      borderRadius: const BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    "2 - 1",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                Text(
                  "Team 2",
                  style: TextStyle(
                      fontSize: 18),
                ),
              ],
            ),
          ),
          Divider(
            height: 30.0,
            thickness: 1.5,
            indent: 32.0,
            endIndent: 32.0,
          ),
          //Address
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Row(
              children: [
                Row(
                  children: const [
                    Text(
                      'Địa điểm thi đấu',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 23,
                  color: Colors.orange,
                ),
                SizedBox(width: 10.0),
                Expanded(
                    child: Text(
                  "Sân 2, DT741, xã tân tiến, huyện Đồng Phú, tỉnh Bình Dương",
                  style: TextStyle(fontSize: 18),
                )),
              ],
            ),
          ),
          Divider(
            height: 30.0,
            thickness: 1.5,
            indent: 32.0,
            endIndent: 32.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Row(
              children: [
                Row(
                  children: const [
                    Text(
                      'Thể thức thi đấu',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              children: [
                Icon(
                  Icons.adjust_sharp,
                  size: 23,
                  color: Colors.orange,
                ),
                SizedBox(width: 10.0),
                Expanded(
                    child: Text(
                      "Loại trực tiếp",
                      style: TextStyle(fontSize: 18),
                    )),
              ],
            ),
          ),
          Divider(
            height: 30.0,
            thickness: 1.5,
            indent: 32.0,
            endIndent: 32.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Row(
              children: [
                Row(
                  children: const [
                    Text(
                      'Mô tả',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Icon(
                  Icons.description,
                  size: 23,
                  color: Colors.orange,
                ),
                SizedBox(width: 10.0),
                Expanded(
                    child: Text(
                      "Vòng đấu Loại trực tiếp Vòng đấu Loại trực tiếp Vòng đấu Loại trực tiếp Vòng đấu Loại trực tiếp",
                      style: TextStyle(fontSize: 18),
                    )),
              ],
            ),
          ),
          Divider(
            height: 30.0,
            thickness: 1.5,
            indent: 32.0,
            endIndent: 32.0,
          ),
          //Startitme
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Row(
              children: [
                Row(
                  children: const [
                    Text(
                      'Thời gian bắt đầu',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 23,
                  color: Colors.orange,
                ),
                SizedBox(width: 10.0),
                Expanded(
                    child: Text(
                  "ngày",
                  style: TextStyle(fontSize: 18),
                )),
              ],
            ),
          ),
          Divider(
            height: 30.0,
            thickness: 1.5,
            indent: 32.0,
            endIndent: 32.0,
          ),
          //Endtime
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Row(
              children: [
                Row(
                  children: const [
                    Text(
                      'Thời gian kết thúc',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  size: 23,
                  color: Colors.orange,
                ),
                SizedBox(width: 10.0),
                Expanded(
                    child: Text(
                  "ngày",
                  style: TextStyle(fontSize: 18),
                )),
              ],
            ),
          ),
          Divider(
            height: 30.0,
            thickness: 1.5,
            indent: 32.0,
            endIndent: 32.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Row(
              children: [
                Row(
                  children: const [
                    Text(
                      'Trạng thái',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              children: [
                Icon(
                  Icons.access_time_rounded,
                  size: 23,
                  color: Colors.orange,
                ),
                SizedBox(width: 10.0),
                Container(
                  // margin: const EdgeInsets.all(
                  //     15.0),
                  padding:
                  const EdgeInsets.all(
                      3.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.amber),
                      color:
                      Colors.amber,
                      borderRadius:
                      const BorderRadius
                          .all(
                          Radius.circular(
                              10))),
                  child: Text(
                    "Sắp diễn ra",
                    style: TextStyle(
                        fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          // Divider(
          //   height: 30.0,
          //   thickness: 1.5,
          //   indent: 32.0,
          //   endIndent: 32.0,
          // ),
        ],
      ),
    );
  }
}
