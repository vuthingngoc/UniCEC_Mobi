import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../models/common/current_user.dart';
import '../../../utils/dimens.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimens.size10),
      child: Column(
        children: [
          Text('Welcome,\n${GetIt.I.get<CurrentUser>().fullname}',
              style: TextStyle(
                  fontSize: Dimens.size25,
                  color: Colors.black.withOpacity(Dimens.size0p7),
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
