import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicec_mobi/bloc/competition/competition_bloc.dart';
import 'package:unicec_mobi/bloc/competition/competition_state.dart';
import 'package:unicec_mobi/models/entities/competition_entity/competition_entity_model.dart';
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

class CompetitionPage extends StatefulWidget {
  final CompetitionBloc bloc;

  CompetitionPage({required this.bloc});

  @override
  _CompetitionPageState createState() => _CompetitionPageState();
}

class _CompetitionPageState extends State<CompetitionPage>
    with AutomaticKeepAliveClientMixin {
  CompetitionBloc get _bloc => widget.bloc;
  static final GlobalKey _formKey = GlobalKey();

  void initState() {
    _bloc.listenerStream.listen((event) {});
    _bloc.add(LoadOutStandingCompetitionEvent());
    _bloc.isLoading = true;
    // _bloc.add(LoadCompetitionEvent());
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    Log.info('Build competition page');
    const defaultImage = 'https://picsum.photos/seed/513/600';

    return BlocBuilder<CompetitionBloc, CompetitionState>(
        bloc: _bloc,
        builder: (context, state) {
          return (_bloc.isLoading)
              ? Loading()
              : Scaffold(
                  appBar: NavbarCompetition(
                    title: "Cuộc Thi",
                    searchBar: true,
                    categoryOne: "Liên Trường",
                    categoryTwo: "Trong Trường",
                    key: _formKey,
                    bloc: _bloc,
                  ),
                  resizeToAvoidBottomInset: false,
                  backgroundColor: ArgonColors.bgColorScreen,
                  //key: _scaffoldKey,
                  drawer: ArgonDrawer(currentPage: "Competition"),
                  body: Container(
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
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
                              : const SizedBox.shrink(),
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
                                          (state.outStandingCompetitions
                                              ?.length)!, (index) {
                                        var competitionEntities = state
                                            .outStandingCompetitions
                                            ?.elementAt(index)
                                            .competitionEntities;
                                        String? imageUrl;
                                        if ((competitionEntities?.length)! >
                                            0) {
                                          imageUrl = competitionEntities
                                              ?.firstWhere(
                                                  (element) =>
                                                      element.entityTypeId == 1,
                                                  orElse: () =>
                                                      CompetitionEntityModel(
                                                          id: 0,
                                                          competitionId: 0,
                                                          entityTypeId: 0,
                                                          entityTypeName: '',
                                                          name: '',
                                                          imageUrl:
                                                              defaultImage,
                                                          website: '',
                                                          email: '',
                                                          description: ''))
                                              .imageUrl;
                                        }
                                        return CardSmall(
                                            cta: "Xem thêm",
                                            title:
                                                (state.outStandingCompetitions?[
                                                        index])!
                                                    .name,
                                            img: imageUrl ?? defaultImage,
                                            type:
                                                (state.outStandingCompetitions?[
                                                        index])!
                                                    .competitionTypeName,
                                            date:
                                                '${(state.outStandingCompetitions?[index])!.startTime}',
                                            tap: () {
                                              Navigator.of(context).pushNamed(
                                                  Routes.detailCompetition,
                                                  arguments: state
                                                      .outStandingCompetitions?[
                                                          index]
                                                      .id);
                                            });
                                      }),
                                    ),
                                    const SizedBox(height: 55.0),
                                  ],
                                )
                              : Text('Không có cuộc thi nào đang diễn ra'),
                        ],
                      ),
                    ),
                  ));
        });
  }
}
