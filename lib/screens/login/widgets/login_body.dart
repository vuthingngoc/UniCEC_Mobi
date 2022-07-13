import '../../../animation/fade_animation.dart';
import '../../../bloc/login/login_bloc.dart';
import '../../../bloc/login/login_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../bloc/login/login_state.dart';
import '../../../utils/dimens.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginBloc _bloc = BlocProvider.of<LoginBloc>(context);
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimens.size60),
              topRight: Radius.circular(Dimens.size60))),
      padding: EdgeInsets.all(Dimens.size30),
      child: BlocBuilder<LoginBloc, LoginState>(
        bloc: _bloc,
        builder: (context, state) {
          return Column(
            children: <Widget>[
              // SizedBox(
              //   height: Dimens.size40,
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: FadeAnimation(
                    delay: Dimens.size1p7,
                    child: const Text(
                      "Đăng nhập với",
                      style: TextStyle(color: Colors.grey),
                    )),
              ),
              // SizedBox(
              //   height: Dimens.size10,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FadeAnimation(
                      delay: Dimens.size1p8,
                      child: InkWell(
                        onTap: () {
                          _bloc.add(SignInGoogleEvent());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.orange[600],
                            child: const Icon(FontAwesomeIcons.google,
                                color: Colors.white),
                          ),
                        ),
                      )),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
