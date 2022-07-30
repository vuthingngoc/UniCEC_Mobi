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

final Map<String, Map<String, dynamic>> homeCards = {
  "Ice Cream": {
    "title": "Ice cream is made with carrageenan …",
    "image":
        "https://images.unsplash.com/photo-1516559828984-fb3b99548b21?ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80",
    "date": "20/05/2022",
    "type": "Âm nhạc",
  },
  "Makeup": {
    "title": "Is makeup one of your daily esse …",
    "image":
        "https://images.unsplash.com/photo-1519368358672-25b03afee3bf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2004&q=80",
    "date": "20/05/2022",
    "type": "Âm nhạc",
  },
  "Coffee": {
    "title": "Coffee is more than just a drink: It’s …",
    "image":
        "https://images.unsplash.com/photo-1500522144261-ea64433bbe27?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2102&q=80",
    "date": "20/05/2022",
    "type": "Âm nhạc",
  },
  "Fashion": {
    "title": "Fashion is a popular style, especially in …",
    "image":
        "https://images.unsplash.com/photo-1487222477894-8943e31ef7b2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1326&q=80",
    "date": "20/05/2022",
    "type": "Âm nhạc",
  },
  "Argon": {
    "title": "Argon is a great free UI packag …",
    "image":
        "https://images.unsplash.com/photo-1482686115713-0fbcaced6e28?fit=crop&w=1947&q=80",
    "date": "20/05/2022",
    "type": "Âm nhạc",
  }
};

class CompetitionPage extends StatefulWidget {
  final CompetitionBloc bloc;

  CompetitionPage({required this.bloc});

  @override
  _CompetitionPageState createState() => _CompetitionPageState();
}

class _CompetitionPageState extends State<CompetitionPage> {
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
              appBar: NavbarCompetition(
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
                              child: SpecialOffers(
                                outStandingEvents:
                                    (state.outStandingCompetitions)!,
                              ),
                            )
                          : SizedBox.shrink(),
                      SizedBox(height: getProportionateScreenWidth(15)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(5)),
                        child: SectionTitle(
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
                                            .name, // homeCards["Makeup"]!['title'],
                                        img: (state.outStandingCompetitions?[
                                                index])!
                                            .competitionEntities[0]
                                            .imageUrl, //homeCards["Makeup"]!['image'],
                                        type: (state.outStandingCompetitions?[
                                                index])!
                                            .competitionTypeName, //homeCards["Makeup"]!['type'],
                                        date:
                                            '${(state.outStandingCompetitions?[index])!.startTime}', //homeCards["Makeup"]!['date'],
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
