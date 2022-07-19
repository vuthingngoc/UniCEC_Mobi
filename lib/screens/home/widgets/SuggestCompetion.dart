import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../models/common/current_user.dart';
import '../../size_config.dart';
import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
          child: SectionTitle(
            title: "Nổi bật",
            press: () {},
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(10)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
           child: Row(
            children:
            [
              // ListView.builder(itemBuilder: (context, index) {
              //   return SpecialOfferCard(name: name, image: image, description: description, press: () {},)
              // })
              SpecialOfferCard(
                image: "assets/image/Image Banner 2.png",
                name: "Smartphone",
                description: "Data check",
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/image/Image Banner 3.png",
                name: "Fashion",
                description: "Data Cehcl",
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/image/Image Banner 3.png",
                name: "Fashion",
                description: "Data Cehcl",
                press: () {},
              ),
              //SizedBox(width: getProportionateScreenWidth(10)),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.name,
    required this.image,
    required this.description,
    required this.press,
  }) : super(key: key);

  final String name, image;
  final String description;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: getProportionateScreenWidth(20), left: getProportionateScreenWidth(5)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$name\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$description")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}