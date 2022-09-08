import 'package:flutter/material.dart';

class ViewDetailMatchMenu extends StatefulWidget {
  @override
  State<ViewDetailMatchMenu> createState() => _ViewDetailMatchMenuState();
}

class _ViewDetailMatchMenuState extends State<ViewDetailMatchMenu> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
          const EdgeInsets.only(
              left: 10, right: 10, top: 10),
          child: Align(
            child: Text(
                "Vòng đấu loại trực tiếp",
                style: const TextStyle(
                    color:
                    Color.fromRGBO(
                        50,
                        50,
                        93,
                        1),
                    fontSize: 28.0)),
          ),
        ),
        SizedBox(height: 10,),
        //MatchType
        Padding(
          padding:
          const EdgeInsets.only(
              left: 20.0,
              right: 20),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Thể thức thi đấu",
                  style: TextStyle(
                      fontSize: 18,
                      color:
                      Colors.grey),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:
          const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10),
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
                    "Loại trực tiếp",
                    style: TextStyle(
                        fontSize: 18),
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
        //Address
        Padding(
          padding:
          const EdgeInsets.only(
              left: 20.0,
              right: 20),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Địa chỉ",
                  style: TextStyle(
                      fontSize: 18,
                      color:
                      Colors.grey),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:
          const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10),
          child: Row(
            children: [
              Icon(
                Icons.account_balance_sharp,
                size: 23,
                color: Colors.orange,
              ),
              SizedBox(width: 10.0),
              Expanded(
                  child: Text(
                    "Loại trực tiếp",
                    style: TextStyle(
                        fontSize: 18),
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
          padding:
          const EdgeInsets.only(
              left: 20.0,
              right: 20),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Thời gian bắt đầu",
                  style: TextStyle(
                      fontSize: 18,
                      color:
                      Colors.grey),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:
          const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10),
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
                    style: TextStyle(
                        fontSize: 18),
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
          padding:
          const EdgeInsets.only(
              left: 20.0,
              right: 20),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Thời gian kết thúc",
                  style: TextStyle(
                      fontSize: 18,
                      color:
                      Colors.grey),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:
          const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10),
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
                    style: TextStyle(
                        fontSize: 18),
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
      ],
    );
  }

}
