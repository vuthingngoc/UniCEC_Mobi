import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/models/common/current_user.dart';
import 'package:unicec_mobi/models/enums/competition_scope_status.dart';
import 'package:unicec_mobi/models/enums/competition_status.dart';
import '../../bloc/competition_detail/competition_detail_bloc.dart';
import '../../bloc/competition_detail/competition_detail_event.dart';
import '../../bloc/competition_detail/competition_detail_state.dart';
import '../../constants/Theme.dart';
import '../../utils/app_color.dart';
import '../../utils/loading.dart';
import '../../utils/log.dart';
import '../../utils/router.dart';
import '../size_config.dart';
import '../widgets/drawer.dart';

class CompetitionDetailPage extends StatefulWidget {
  final CompetitionDetailBloc bloc;

  CompetitionDetailPage({required this.bloc});

  @override
  _CompetitionDetailPageState createState() => _CompetitionDetailPageState();
}

class _CompetitionDetailPageState extends State<CompetitionDetailPage> {
  CompetitionDetailBloc get _bloc => widget.bloc;

  void initState() {
    super.initState();

    _bloc.listenerStream.listen((event) {
      if (event is ShowPopUpAnnouncement) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(event.message)));
      }
    });
  }

  String switchScope() {
    if (_bloc.state.competitionDetail?.scope != null) {
      CompetitionScopeStatus? scope = _bloc.state.competitionDetail?.scope;
      switch (scope) {
        case CompetitionScopeStatus.InterUniversity:
          return 'Trong Trường';
        case CompetitionScopeStatus.University:
          return 'Liên Trường';
        case CompetitionScopeStatus.Club:
          return 'Câu lạc bộ';
        default:
          return '';
      }
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    print('detailCompetitionPage - isloading: ${_bloc.isLoading}');

    RouteSettings settings = ModalRoute.of(context)!.settings;
    if (settings.arguments != null) {
      _bloc.add(
          LoadCompetitionDetailEvent(competitionId: settings.arguments as int));
      _bloc.isLoading = true;
    }

    var universityName = GetIt.I.get<CurrentUser>().universityName;
    const defaultImage = 'https://picsum.photos/seed/513/600';

    return BlocBuilder<CompetitionDetailBloc, CompetitionDetailState>(
        bloc: _bloc,
        builder: (context, state) {
          Log.info('content: ${state.competitionDetail?.content}');
          return (_bloc.isLoading)
              ? Loading()
              : Scaffold(
                  extendBodyBehindAppBar: true,
                  appBar: AppBar(
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                    title: const Text("Chi tiết",
                        style: TextStyle(color: Colors.white, fontSize: 23)),
                    automaticallyImplyLeading: false,
                    centerTitle: true,
                    backgroundColor: AppColors.mainColor,
                  ),
                  backgroundColor: ArgonColors.bgColorScreen,
                  drawer: ArgonDrawer(currentPage: "Competition Detail"),
                  body: Stack(children: <Widget>[
                    SafeArea(
                      child: ListView(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Stack(children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Card(
                                      semanticContainer: true,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      elevation: .0,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0))),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 0,
                                            bottom: 10.0,
                                            left: 10.0,
                                            right: 10.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  const SizedBox(height: 10.0),
                                                  Row(
                                                    children: [
                                                      _bloc.state.competitionDetail
                                                                  ?.clubsInCompetition
                                                                  .firstWhere(
                                                                      (element) =>
                                                                          element
                                                                              .isOwner ==
                                                                          true) !=
                                                              null
                                                          ? Padding(
                                                              padding:
                                                                  const EdgeInsets.fromLTRB(
                                                                      6.0,
                                                                      2.0,
                                                                      10.0,
                                                                      2.0),
                                                              child: Container(
                                                                  width: 48,
                                                                  height: 48,
                                                                  child: CircleAvatar(
                                                                      backgroundImage:
                                                                          NetworkImage(_bloc.state.competitionDetail?.clubsInCompetition.firstWhere((element) => element.isOwner == true).image != '' ? '${_bloc.state.competitionDetail?.clubsInCompetition.firstWhere((element) => element.isOwner == true).image}' : defaultImage))))
                                                          : const SizedBox.shrink(),
                                                      Text(
                                                        "${_bloc.state.competitionDetail?.clubsInCompetition.where((element) => element.isOwner == true).first.name}",
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Expanded(
                                                          child: SizedBox(
                                                              width:
                                                                  getProportionateScreenWidth(
                                                                      10))),
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .all(15.0),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(3.0),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .green),
                                                            color: Colors.green,
                                                            borderRadius:
                                                                const BorderRadius
                                                                        .all(
                                                                    Radius.circular(
                                                                        10))),
                                                        child: Text(
                                                            (_bloc.state.competitionDetail
                                                                            ?.fee) !=
                                                                        null &&
                                                                    (_bloc
                                                                            .state
                                                                            .competitionDetail
                                                                            ?.fee)! >
                                                                        0
                                                                ? '${_bloc.state.competitionDetail?.fee} VNĐ'
                                                                : "Không thu phí",
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18,
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10.0),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            right: 10),
                                                    child: Align(
                                                      child: Text(
                                                          "${_bloc.state.competitionDetail?.name}",
                                                          style:
                                                              const TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          50,
                                                                          50,
                                                                          93,
                                                                          1),
                                                                  fontSize:
                                                                      28.0)),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5.0),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10,
                                                            left: 10),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                            "@${_bloc.state.competitionDetail?.competitionTypeName}",
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .mainColor,
                                                                fontSize: 18)),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10.0),
                                                  (_bloc.state.competitionDetail
                                                              ?.competitionEntities
                                                              .where((element) =>
                                                                  element
                                                                      .entityTypeId ==
                                                                  1)
                                                              .first
                                                              .imageUrl !=
                                                          null)
                                                      ? Image.network(
                                                          '${_bloc.state.competitionDetail?.competitionEntities.where((element) => element.entityTypeId == 1).first.imageUrl}')
                                                      : const SizedBox.shrink(),
                                                  const SizedBox(height: 5.0),
                                                  (_bloc.state.competitionDetail
                                                                  ?.majorsInCompetition !=
                                                              null &&
                                                          (_bloc
                                                                  .state
                                                                  .competitionDetail
                                                                  ?.majorsInCompetition
                                                                  .length)! >
                                                              0)
                                                      ? Row(
                                                          children: [
                                                            SizedBox(
                                                              height: 100.0,
                                                              child: ListView
                                                                  .builder(
                                                                      scrollDirection:
                                                                          Axis
                                                                              .horizontal,
                                                                      shrinkWrap:
                                                                          true,
                                                                      itemCount: _bloc
                                                                          .state
                                                                          .competitionDetail
                                                                          ?.majorsInCompetition
                                                                          .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              index) {
                                                                        return Container(
                                                                          margin:
                                                                              const EdgeInsets.all(15.0),
                                                                          padding:
                                                                              const EdgeInsets.all(3.0),
                                                                          decoration: BoxDecoration(
                                                                              border: Border.all(color: Colors.orangeAccent),
                                                                              color: Colors.orangeAccent,
                                                                              borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                          child: Text(
                                                                              '${state.competitionDetail?.majorsInCompetition[index].name}',
                                                                              style: const TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: 18,
                                                                              )),
                                                                        );
                                                                      }),
                                                            )
                                                          ],
                                                        )
                                                      : Row(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      15.0),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(3.0),
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .orangeAccent),
                                                                  color: Colors
                                                                      .orangeAccent,
                                                                  borderRadius: const BorderRadius
                                                                          .all(
                                                                      Radius.circular(
                                                                          10))),
                                                              child: const Text(
                                                                  'Toàn bộ các ngành',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        18,
                                                                  )),
                                                            ),
                                                          ],
                                                        ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0,
                                                            right: 10.0),
                                                    child: Row(
                                                      children: [
                                                        const Icon(
                                                            Icons
                                                                .calendar_today_outlined,
                                                            size: 23,
                                                            color:
                                                                Colors.orange),
                                                        const SizedBox(
                                                            width: 10.0),
                                                        Text(
                                                          "${_bloc.state.competitionDetail?.startTime}",
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 18),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 10.0),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0,
                                                            right: 10.0),
                                                    child: Row(
                                                      children: [
                                                        const Icon(
                                                          Icons
                                                              .add_location_rounded,
                                                          size: 23,
                                                          color: Colors.orange,
                                                        ),
                                                        const SizedBox(
                                                            width: 10.0),
                                                        Expanded(
                                                            child: Text(
                                                          "${_bloc.state.competitionDetail?.addressName} - ${_bloc.state.competitionDetail?.address}",
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 18),
                                                        )),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 10.0),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            right: 10),
                                                    child: Row(
                                                      children: [
                                                        const Icon(
                                                          Icons
                                                              .account_balance_sharp,
                                                          size: 23,
                                                          color: Colors.orange,
                                                        ),
                                                        SizedBox(width: 10.0),
                                                        Expanded(
                                                            child: Text(
                                                          switchScope(),
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 18),
                                                        )),
                                                      ],
                                                    ),
                                                  ),
                                                  const Divider(
                                                    height: 40.0,
                                                    thickness: 1.5,
                                                    indent: 32.0,
                                                    endIndent: 32.0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0,
                                                            right: 10),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                            child: Html(
                                                          data: _bloc
                                                              .state
                                                              .competitionDetail
                                                              ?.content,
                                                          tagsList: Html.tags,
                                                          style: {
                                                            "p": Style(
                                                                fontSize:
                                                                    const FontSize(
                                                                        18.0)),
                                                            "em": Style(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic),
                                                            "strong": Style(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            "a": Style(
                                                                textDecoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                color: Colors
                                                                    .blueAccent),
                                                            // "ul": Wrap()
                                                            "li": Style(
                                                                fontSize:
                                                                    const FontSize(
                                                                        15.0))
                                                          },
                                                          // onLinkTap: (url, _, _){
                                                          //   print('Open with url: $url ...');
                                                          // },
                                                          onCssParseError:
                                                              (css, messages) {
                                                            Log.error(
                                                                'css that errored: $css');
                                                            Log.error(
                                                                'error messages: ');
                                                            messages.forEach(
                                                                (element) {
                                                              Log.error(
                                                                  '$element');
                                                            });
                                                          },
                                                        )),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 10.0),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0,
                                                            right: 10.0),
                                                    child: Row(
                                                      children: const [
                                                        Expanded(
                                                          child: Text(
                                                            "Các câu lạc bộ tham gia tổ chức",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  (_bloc
                                                              .state
                                                              .competitionDetail
                                                              ?.clubsInCompetition
                                                              .length)! >
                                                          0
                                                      ? Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10.0),
                                                          child: Row(
                                                            children: [
                                                              SizedBox(
                                                                height: 60.0,
                                                                child: ListView
                                                                    .builder(
                                                                        scrollDirection:
                                                                            Axis
                                                                                .horizontal,
                                                                        shrinkWrap:
                                                                            true,
                                                                        itemCount: _bloc
                                                                            .state
                                                                            .competitionDetail
                                                                            ?.clubsInCompetition
                                                                            .length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                index) {
                                                                          return Container(
                                                                              width: 48,
                                                                              height: 48,
                                                                              child: CircleAvatar(backgroundImage: NetworkImage(_bloc.state.competitionDetail?.clubsInCompetition[index].image != "" ? "${_bloc.state.competitionDetail?.clubsInCompetition[index].image}" : defaultImage)));
                                                                        }),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      : Text(
                                                          'Đồng tổ chức bởi các CLB trường $universityName'),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0,
                                                            right: 10.0),
                                                    child: Row(
                                                      children: const [
                                                        Expanded(
                                                          child: Text(
                                                            "Ban giám khảo",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  ((_bloc
                                                              .state
                                                              .competitionDetail
                                                              ?.competitionEntities
                                                              .length)! >
                                                          0)
                                                      ? Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10.0,
                                                                  right: 10.0),
                                                          child: Row(
                                                            children: [
                                                              SizedBox(
                                                                height: 60.0,
                                                                child: ListView
                                                                    .builder(
                                                                        scrollDirection:
                                                                            Axis
                                                                                .horizontal,
                                                                        shrinkWrap:
                                                                            true,
                                                                        itemCount: _bloc
                                                                            .state
                                                                            .competitionDetail
                                                                            ?.clubsInCompetition
                                                                            .length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                index) {
                                                                          return Container(
                                                                              width: 48,
                                                                              height: 48,
                                                                              child: CircleAvatar(backgroundImage: NetworkImage((_bloc.state.competitionDetail?.clubsInCompetition[index].image)! != '' ? "${_bloc.state.competitionDetail?.clubsInCompetition[index].image}" : defaultImage)));
                                                                        }),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      : Text(
                                                          'Ban tổ chức cuộc thi trường $universityName'),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0,
                                                            right: 10.0,
                                                            top: 10),
                                                    child: Row(
                                                      children: const [
                                                        Expanded(
                                                          child: Text(
                                                            "Các đơn vị tài trợ",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  ((_bloc
                                                              .state
                                                              .competitionDetail
                                                              ?.competitionEntities
                                                              .where((element) =>
                                                                  element
                                                                      .entityTypeId ==
                                                                  2)
                                                              .length)! >
                                                          0)
                                                      ? Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10.0,
                                                                  right: 10.0),
                                                          child: Row(children: [
                                                            SizedBox(
                                                              height: 60.0,
                                                              child: ListView
                                                                  .builder(
                                                                      scrollDirection:
                                                                          Axis
                                                                              .horizontal,
                                                                      shrinkWrap:
                                                                          true,
                                                                      itemCount: _bloc
                                                                          .state
                                                                          .competitionDetail
                                                                          ?.competitionEntities
                                                                          .where((element) =>
                                                                              element.entityTypeId ==
                                                                              2)
                                                                          .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              index) {
                                                                        return Container(
                                                                            width:
                                                                                60.0,
                                                                            height:
                                                                                60.0,
                                                                            padding: const EdgeInsets.fromLTRB(
                                                                                6.0,
                                                                                2.0,
                                                                                10.0,
                                                                                2.0),
                                                                            child:
                                                                                CircleAvatar(backgroundImage: NetworkImage("${_bloc.state.competitionDetail?.competitionEntities.where((element) => element.entityTypeId == 2).elementAt(index).imageUrl}")));
                                                                      }),
                                                            ),
                                                          ]),
                                                        )
                                                      : Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10.0,
                                                                    vertical:
                                                                        15.0),
                                                                child: Text(
                                                                  'Ban tổ chức trường $universityName',
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          18.0),
                                                                ),
                                                              ),
                                                            ]),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 8.0),
                                                    child: Wrap(
                                                      // mainAxisAlignment:
                                                      //     MainAxisAlignment
                                                      //         .spaceAround,
                                                      runSpacing: 20.0,
                                                      children: [
                                                        if (state
                                                                .competitionDetail
                                                                ?.numberOfTeam !=
                                                            0)
                                                          Container(
                                                            width: 180.0,
                                                            height: 36,
                                                            child: RaisedButton(
                                                                textColor:
                                                                    ArgonColors
                                                                        .primary,
                                                                color: ArgonColors
                                                                    .secondary,
                                                                onPressed: () {
                                                                  //chuyển sang trang list team
                                                                  if (state
                                                                          .isParticipant ==
                                                                      true) {
                                                                    Navigator.of(context).pushNamed(
                                                                        Routes
                                                                            .viewListTeamParticipant,
                                                                        arguments: state
                                                                            .competitionDetail
                                                                            ?.id);
                                                                  } else {
                                                                    Navigator.of(context).pushNamed(
                                                                        Routes
                                                                            .viewListTeamStudent,
                                                                        arguments: state
                                                                            .competitionDetail
                                                                            ?.id);
                                                                  }
                                                                },
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4)),
                                                                child: Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        bottom:
                                                                            10,
                                                                        top:
                                                                            10),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: const [
                                                                        Icon(
                                                                            Icons
                                                                                .description,
                                                                            size:
                                                                                13),
                                                                        SizedBox(
                                                                          width:
                                                                              5,
                                                                        ),
                                                                        Text(
                                                                            "Các đội tham gia",
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.w600, fontSize: 15))
                                                                      ],
                                                                    ))),
                                                          ),
                                                        if (state
                                                                .competitionDetail
                                                                ?.numberOfTeam !=
                                                            0)
                                                          Container(
                                                            width: 180.0,
                                                            height: 36,
                                                            child: RaisedButton(
                                                                textColor:
                                                                    ArgonColors
                                                                        .primary,
                                                                color: ArgonColors
                                                                    .secondary,
                                                                onPressed: () {
                                                                  Navigator.pushNamed(
                                                                      context,
                                                                      Routes
                                                                          .viewCompetitionRound,
                                                                      arguments: _bloc
                                                                          .state
                                                                          .competitionDetail
                                                                          ?.id);
                                                                },
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4)),
                                                                child: Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        bottom:
                                                                            10,
                                                                        top:
                                                                            10),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: const [
                                                                        Icon(
                                                                            Icons
                                                                                .description,
                                                                            size:
                                                                                13),
                                                                        SizedBox(
                                                                          width:
                                                                              5,
                                                                        ),
                                                                        Text(
                                                                            "Danh sách vòng thi",
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.w600, fontSize: 15))
                                                                      ],
                                                                    ))),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.all(
                                                            15.0),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.red),
                                                        color: Colors.red,
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    10))),
                                                    child: Text(
                                                        "Hạn cuối đăng ký: ${_bloc.state.competitionDetail?.endTimeRegister}",
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                        )),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10,
                                                            left: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                            "${_bloc.state.competitionDetail?.view} lượt xem",
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        18)),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 16),
                                                    child: Container(
                                                      width: double.infinity,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 15,
                                                              left: 15,
                                                              bottom: 15),
                                                      child:
                                                          (state.isParticipant ==
                                                                  false)
                                                              ? FlatButton(
                                                                  textColor:
                                                                      ArgonColors
                                                                          .white,
                                                                  color: AppColors
                                                                      .mainColor,
                                                                  onPressed:
                                                                      () {
                                                                    _bloc.add(ParticipateTheCompetitionEvent(
                                                                        competitionId: (state
                                                                            .competitionDetail
                                                                            ?.id)!));
                                                                  },
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.0),
                                                                  ),
                                                                  child: const Padding(
                                                                      padding: EdgeInsets.only(
                                                                          left:
                                                                              16.0,
                                                                          right:
                                                                              16.0,
                                                                          top:
                                                                              12,
                                                                          bottom:
                                                                              12),
                                                                      child: Text(
                                                                          "Tham gia ngay",
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontSize: 18.0))),
                                                                )
                                                              : FlatButton(
                                                                  textColor:
                                                                      ArgonColors
                                                                          .white,
                                                                  color: (state
                                                                              .competitionDetail
                                                                              ?.status ==
                                                                          CompetitionStatus
                                                                              .Start)
                                                                      ? AppColors
                                                                          .mainColor
                                                                      : Colors
                                                                          .grey,
                                                                  onPressed:
                                                                      () {
                                                                    if (state
                                                                            .competitionDetail
                                                                            ?.status !=
                                                                        CompetitionStatus
                                                                            .Start) {
                                                                      return;
                                                                    }

                                                                    _bloc.add(AttendanceCompetitionEvent(
                                                                        seedsCode: (state
                                                                            .competitionDetail
                                                                            ?.seedsCode)!));
                                                                  },
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child: const Padding(
                                                                      padding: EdgeInsets.only(
                                                                          left:
                                                                              16.0,
                                                                          right:
                                                                              16.0,
                                                                          top:
                                                                              12,
                                                                          bottom:
                                                                              12),
                                                                      child: Text(
                                                                          "Điểm danh",
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontSize: 18.0))),
                                                                ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              ]),
                            ],
                          ),
                        ),
                      ]),
                    )
                  ]));
        });
  }
}
