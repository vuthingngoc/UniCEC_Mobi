import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicec_mobi/bloc/competition/competition_bloc.dart';
import 'package:unicec_mobi/bloc/competition/competition_state.dart';
import 'package:unicec_mobi/utils/app_color.dart';
import 'package:unicec_mobi/utils/log.dart';

import '../../bloc/competition/competition_event.dart';
import '../../constants/theme.dart';

//widgets
import '../../utils/loading.dart';
import '../../utils/router.dart';
import '../size_config.dart';
import '../widgets/card-small.dart';
import '../widgets/drawer.dart';
import 'widgets/navbar_competition.dart';
import 'widgets/suggest_competition.dart';
import 'widgets/section_title.dart';


class ViewListCompetitionOfClubPage extends StatefulWidget {
  final CompetitionBloc bloc;

  ViewListCompetitionOfClubPage({required this.bloc});

  @override
  _ViewListCompetitionOfClubPageState createState() => _ViewListCompetitionOfClubPageState();
}

class _ViewListCompetitionOfClubPageState extends State<ViewListCompetitionOfClubPage> {
  CompetitionBloc get _bloc => widget.bloc;

  void initState() {
    _bloc.listenerStream.listen((event) {});
    _bloc.add(LoadOutStandingCompetitionEvent());
    _bloc.isLoading = true;
    // _bloc.add(LoadCompetitionEvent());
  }

  @override
  Widget build(BuildContext context) {
    Log.info('Build competition page');
    // SizeConfig().init(context);
    return BlocBuilder<CompetitionBloc, CompetitionState>(
        bloc: _bloc,
        builder: (context, state) {
          return _bloc.isLoading ? Loading() : Scaffold(
              appBar: NavbarCompetitionOfClub(
                title: "Cuộc Thi",
                searchBar: true,
                categoryOne: "Liên Trường",
                categoryTwo: "Trong Trường",
                bloc: _bloc,
                state: state,
              ),
              backgroundColor: ArgonColors.bgColorScreen,
              //key: _scaffoldKey,
              drawer: ArgonDrawer(currentPage: "Competition"),
              body: Container(
                padding: EdgeInsets.only(left: 24.0, right: 24.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      (state.outStandingCompetitions != null)
                          ? Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: SpecialOffersCompetitionOfClub(
                          outStandingEvents:
                          (state.outStandingCompetitions)!,
                        ),
                      )
                          : SizedBox.shrink(),
                      SizedBox(height: getProportionateScreenWidth(15)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(5)),
                        child: SectionTitleCompetitionOfClub(
                          title: "Đang diễn ra",
                          press: () {},
                        ),
                      ),
                      SizedBox(height: 8.0),
                      (state.outStandingCompetitions != null)
                          ? Column(
                        children: [
                          Wrap(
                            children: List.generate(
                                (state.outStandingCompetitions?.length)!,
                                    (index) {
                                  return CardSmall(
                                      cta: "Xem thêm",
                                      title: (state.outStandingCompetitions?[
                                      index])!
                                          .name,
                                      img: (state.outStandingCompetitions?[
                                      index])!
                                          .competitionEntities[0]
                                          .imageUrl,
                                      type: (state.outStandingCompetitions?[
                                      index])!
                                          .competitionTypeName,
                                      date:
                                      '${(state.outStandingCompetitions?[index])!.startTime}',
                                      tap: () {
                                        Navigator.of(context).pushNamed(
                                            Routes.detailCompetition);
                                      });
                                }),
                          )
                        ],
                      )
                          : Text('Không có cuộc thi nào đang diễn ra'),
                      SizedBox(height: 8.0),
                    ],
                  ),
                ),
              ));
        });
  }
}
