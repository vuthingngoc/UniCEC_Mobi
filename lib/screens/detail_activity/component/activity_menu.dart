import 'package:flutter/material.dart';

class ViewDetailActivityMenu extends StatelessWidget {
  const ViewDetailActivityMenu({
    Key? key,
  }) : super(key: key);

  List<DropdownMenuItem<String>> get dropdownStatus {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.deepPurple,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Open",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          value: "Open"),
      DropdownMenuItem(
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.orangeAccent,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "OnGoing",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          value: "OnGoing"),
      DropdownMenuItem(
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.deepOrange,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Pending",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          value: "Pending"),
      DropdownMenuItem(
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.lightGreen,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Finished",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          value: "Finished"),
      DropdownMenuItem(
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.grey,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Completed",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          value: "Completed"),
      DropdownMenuItem(
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.brown,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Cancelling",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          value: "Cancelling"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownPriority {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: Row(
            children: [
              Icon(
                Icons.warning,
                color: Colors.red,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Cao",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          value: "High"),
      DropdownMenuItem(
          child: Row(
            children: [
              Icon(
                Icons.warning,
                color: Colors.orangeAccent,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Trung bình",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          value: "Medium"),
      DropdownMenuItem(
          child: Row(
            children: [
              Icon(
                Icons.warning,
                color: Colors.green,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Thấp",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          value: "Low"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    String selectedValueStatus = "Open";
    String selectedValuePriority = "High";
    return Stack(children: <Widget>[
      SafeArea(
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.only(left: 0.0, right: 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: .0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 0.0, bottom: 20.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    SizedBox(height: 10.0),
                                    Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.all(15.0),
                                          padding: const EdgeInsets.all(3.0),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.lightGreen),
                                              color: Colors.lightGreen,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.today,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text("CA-20",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                  )),
                                            ],
                                          ),
                                        ),
                        Expanded(child: SizedBox(width: 10,)),
                                        Container(
                                          margin: const EdgeInsets.all(15.0),
                                          padding: const EdgeInsets.all(3.0),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.redAccent),
                                              color: Colors.redAccent,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.control_point_sharp,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text("40" + " điểm",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.0),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Align(
                                        child: Text(
                                            "Đây là task của bạn, hãy check tha mgia",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    50, 50, 93, 1),
                                                fontSize: 28.0)),
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10, left: 10, top: 10),
                                      child: Row(
                                        children: [
                                          Text("By " + "Michael Creator",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 18)),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10.0),
                                            child: Text("01-08-2022 3:55",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 18)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, left: 10, top: 15),
                                        child: Row(
                                          children: [
                                            DropdownButton(
                                              value: selectedValueStatus,
                                              items: dropdownStatus,
                                              onChanged: (Object? value) {},
                                            ),
                                          ],
                                        )),
                                    SizedBox(height: 10.0),
                                    Image.network(
                                        "https://img.freepik.com/premium-photo/astronaut-outer-open-space-planet-earth-stars-provide-background-erforming-space-planet-earth-sunrise-sunset-our-home-iss-elements-this-image-furnished-by-nasa_150455-16829.jpg?w=2000"),
                                    SizedBox(height: 5.0),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 20, top: 10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Nội dung",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 20, top: 10),
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
                                            "+ Nội dung miêu tả nằm ở trong này",
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
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 20),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Thông tin chi tiết",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 20),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Người thực hiện",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                top: 15.0,
                                                bottom: 15,
                                                right: 15,
                                                left: 25),
                                            padding: const EdgeInsets.all(5.0),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black12),
                                                color: Colors.black12,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                      "assets/img/chat-avatar.jpeg"),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text("Lam Huy vu",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 30.0,
                                      thickness: 1.5,
                                      indent: 32.0,
                                      endIndent: 32.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 20),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Ngày bắt đầu",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20, top: 10),
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
                                                "02-08-2022 2:38",
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
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 20),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Độ ưu tiên",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20, top: 10),
                                      child: Row(
                                        children: [
                                          DropdownButton(
                                            value: selectedValuePriority,
                                            items: dropdownPriority,
                                            onChanged: (Object? value) {},
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
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 20),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Ngày kết thúc",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20, top: 10),
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
                                                "02-08-2022 8:38",
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
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 20),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Tổng thời gian",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20, top: 10),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            size: 23,
                                            color: Colors.orange,
                                          ),
                                          SizedBox(width: 10.0),
                                          Expanded(
                                              child: Text(
                                                "5" + " giờ",
                                                style: TextStyle(fontSize: 18),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ]),
              ],
            ),
          ),
        ]),
      )
    ]);
  }
}
