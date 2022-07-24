import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import 'component/body.dart';

class ViewListTeamPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ViewListTeamPageState();
}

class _ViewListTeamPageState extends State<ViewListTeamPage>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<ProfileBloc, ProfileState>(
    //     bloc: _bloc,
    //     builder: (context, state) {
    //       return Scaffold(
    //         appBar: AppBar(
    //           title: Text("Danh sách các đội tham gia"),
    //           automaticallyImplyLeading: false,
    //           centerTitle: true,
    //         ),
    //         body: Body(bloc: _bloc, state: state,),
    //         //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    //       );
    //     });
          return Scaffold(
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 55),
              child: FloatingActionButton(
                heroTag: "Tạo đội thi",
                backgroundColor: AppColors.primaryColor,
                onPressed: () async {},
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ),
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, color: Colors.black),
              ),
              title: Text("Danh sách các đội tham gia", style: TextStyle(color: Colors.black),),
              automaticallyImplyLeading: false,
              centerTitle: true,
              backgroundColor: AppColors.backgroundPageColor,
            ),
            body: Body(),
            //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
          );
  }
}
