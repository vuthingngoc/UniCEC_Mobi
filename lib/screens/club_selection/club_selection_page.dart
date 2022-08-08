import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/bloc/club_selection/club_selection_bloc.dart';

import '../../bloc/club_selection/club_selection_event.dart';
import '../../bloc/club_selection/club_selection_state.dart';
import '../../constants/Theme.dart';
import '../../models/common/current_user.dart';
import '../../utils/app_color.dart';
import '../../utils/dimens.dart';
import '../../utils/router.dart';
import 'widgets/show_clubs.dart';
import 'widgets/welcome_text.dart';

class ClubSelectionPage extends StatefulWidget {
  final ClubSelectionBloc bloc;
  ClubSelectionPage({required this.bloc});
  @override
  State<ClubSelectionPage> createState() => _ClubSelectionPageState();
}

class _ClubSelectionPageState extends State<ClubSelectionPage> {
  ClubSelectionBloc get _bloc => widget.bloc;
  @override
  void initState() {
    //
    _bloc.listenerStream.listen((event) {
      if (event is NavigatorClubPageEvent) {
        Navigator.of(context).pushReplacementNamed(Routes.main);
        //.pop(context);
      }
      //PushName để có trang back về
      if (event is NavigatorClubsViewPageEvent) {
        Navigator.of(context).pushNamed(Routes.clubsView);
      }
    });
    //
    _bloc.add(ClubSelectionEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: _bloc,
        child: BlocBuilder<ClubSelectionBloc, ClubSelectionState>(
          bloc: _bloc,
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                ),
                title: Text(
                  "Chọn Câu lạc bộ đã tham gia",
                  style: TextStyle(color: Colors.black),
                ),
                // automaticallyImplyLeading: false,
                centerTitle: true,
                backgroundColor: AppColors.backgroundPageColor,
              ),
              body: Container(
                constraints: const BoxConstraints.expand(),
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     colorFilter: ColorFilter.mode(
                //         Colors.black.withOpacity(Dimens.size0p6),
                //         BlendMode.dstATop),
                //     image:
                //         const AssetImage("assets/img/onboard-background.png"),
                //     fit: BoxFit.cover,
                //   ),
                // ),
                child: Padding(
                  padding: EdgeInsets.all(Dimens.size10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        WelcomeText(),
                        ShowClubsBelongToStudent(),
                      ],
                    ),
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton.extended(
                  onPressed: () {
                    //thêm event qua trang list club
                    _bloc.add(ClubsViewPageEvent());
                  },
                  backgroundColor: ArgonColors.warning,
                  label: Text("Tham gia clb khác"),
                  icon: Icon(Icons.add)),
            );
          },
        ));
  }
}
