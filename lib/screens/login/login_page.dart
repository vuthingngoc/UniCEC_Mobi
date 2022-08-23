import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicec_mobi/utils/loading.dart';
import 'package:unicec_mobi/utils/log.dart';

import '../../bloc/login/login_bloc.dart';
import '../../bloc/login/login_event.dart';
import '../../utils/dimens.dart';
import '../../utils/router.dart';
import 'widgets/login_body.dart';
import 'widgets/login_header.dart';

class LoginPage extends StatefulWidget {
  final LoginBloc bloc;

  LoginPage({required this.bloc});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc get _bloc => widget.bloc;
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    _fcm.getToken().then((value) => {
          // Log.info('The token device is: $value')
          print('The token device is: $value')
        });

    _bloc.listenerStream.listen((event) {
      if (event is NavigatorWelcomePageEvent) {
        Navigator.of(context).pushReplacementNamed(
          Routes.main, /*arguments: event.residentIdList*/
        );
      } //
      else if (event is ShowingSnackBarEvent) {
        showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (context) {
            return AlertDialog(
              title: Text('Cảnh báo'),
              content: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text(event.message),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Đóng'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } //
      else if (event is NavigatorUniversitySelectionPageEvent) {
        Navigator.of(context).pushReplacementNamed(Routes.universitySelection,
            arguments: event.listUniBelongToEmail);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                print('snapshot.connectionState is waiting');
                return const Center(child: CircularProgressIndicator());
              }
              //print('login bloc isLoading: ${_bloc.isLoading}');
              return
                  // (_bloc.isLoading)
                  //     ? Loading()
                  //     :
                  SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              colors: [
                            Colors.orange[600]!,
                            Colors.orange[400]!,
                            Colors.orange[200]!
                          ])),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: Dimens.size60,
                          ),
                          LoginHeader(),
                          SizedBox(height: Dimens.size20),
                          Flexible(
                            fit: FlexFit.tight,
                            child: LoginBody(bloc: _bloc),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
