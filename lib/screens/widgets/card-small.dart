import 'package:flutter/material.dart';
import '../../constants/theme.dart';
import '../size_config.dart';

class CardSmall extends StatelessWidget {
  CardSmall(
      {this.title = "Placeholder Title",
      this.cta = "",
      this.date = "",
      this.type = "",
      this.img = "https://via.placeholder.com/200",
      this.tap = defaultFunc});

  final String cta;
  final String img;
  VoidCallback tap;
  final String title;
  final String date;
  final String type;

  static void defaultFunc() {
    print("the function works!");
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
      height: 270,
      child: GestureDetector(
        onTap: tap,
        child: Card(
            elevation: 0.4,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    flex: 2,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6.0),
                                topRight: Radius.circular(6.0)),
                            image: DecorationImage(
                              image: NetworkImage(img),
                              fit: BoxFit.cover,
                            )))),
                Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8.0, left: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("@" + type,
                                  style: TextStyle(
                                      color: ArgonColors.warning,
                                      fontSize: 13)),
                              SizedBox(width: getProportionateScreenWidth(30)),
                              // Text(date,
                              //     style: TextStyle(
                              //         color: ArgonColors.secondary,
                              //         fontSize: 13,
                              //         backgroundColor: Colors.red)),
                              Container(
                                // margin:
                                // const EdgeInsets.all(15.0),
                                // padding:
                                // const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.red),
                                    color: Colors.red,
                                    borderRadius:
                                    BorderRadius.all(
                                        Radius.circular(5))),
                                child: Text(date,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    )),
                              ),

                            ],
                          ),
                          Text(title,
                              style: TextStyle(
                                  color: ArgonColors.header, fontSize: 13)),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(cta,
                                style: TextStyle(
                                    color: ArgonColors.primary,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600)),
                          )
                        ],
                      ),
                    ))
              ],
            )),
      ),
    ));
  }
}
