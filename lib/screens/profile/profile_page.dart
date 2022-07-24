import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicec_mobi/bloc/profile/profile_bloc.dart';
import 'package:unicec_mobi/bloc/profile/profile_event.dart';
import 'package:unicec_mobi/bloc/profile/profile_state.dart';
// import 'package:shop_app/components/coustom_bottom_nav_bar.dart';

//import '../../enums.dart';
import 'component/body.dart';

class ProfilePage extends StatefulWidget {
  static String routeName = "/profile";
  ProfileBloc bloc;

  ProfilePage({required this.bloc});

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  ProfileBloc get _bloc => widget.bloc;

  @override
  void initState() {
    super.initState();
    _bloc.listenerStream.listen((event) {});
    _bloc.add(LoadProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
        bloc: _bloc,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Trang cá nhân"),
              automaticallyImplyLeading: false,
              centerTitle: true,
            ),
            body: Body(bloc: _bloc, state: state,),
            //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
          );
        });
  }
}
