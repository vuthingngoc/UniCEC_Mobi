import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:unicec_mobi/utils/app_color.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('loading widget');
    return Container(      
      color: Colors.amber[100],
      child: Center(
          child: SpinKitCircle(
        color: AppColors.mainColor,
        size: 50.0,
      )),
    );
  }
}
