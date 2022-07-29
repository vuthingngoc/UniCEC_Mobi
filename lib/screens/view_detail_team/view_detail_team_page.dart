import 'package:flutter/material.dart';
import 'package:unicec_mobi/models/entities/participant/participant_model.dart';
import 'package:unicec_mobi/models/enums/team_status.dart';

import '../../constants/Theme.dart';
import '../../models/entities/team/team_detail_model.dart';
import '../../utils/app_color.dart';
import 'component/view_detail_table.dart';

class ViewDetailTeamPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ViewDetailTeamPageState();
}

class _ViewDetailTeamPageState extends State<ViewDetailTeamPage>
    with AutomaticKeepAliveClientMixin {
  // late bool switchValueOne;
  // late bool switchValueTwo;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    // switchValueOne = true;
    // switchValueTwo = false;
  }

  @override
  Widget build(BuildContext context) {
    // List<ParticipantModel> Participant = [
    //   ParticipantModel(
    //       id: 1,
    //       competitionId: 1,
    //       studentId: "SE140164",
    //       avatar:
    //           "https://scontent.fsgn2-4.fna.fbcdn.net/v/t39.30808-6/287957074_162713692987402_2717491022687766526_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=44d72TWHWDoAX8p9CMC&_nc_ht=scontent.fsgn2-4.fna&oh=00_AT_3BfUd0u2aVZMiB8ZxH-IS7o2KC_iOAF7WtqcaBEx0tA&oe=62E20F60",
    //       registerTime: 25.3)
    // ];
    // List<TeamDetailModel> fakeData = [
    //   TeamDetailModel(
    //       id: 1,
    //       competitionId: 1,
    //       name: "Vũ Tiến Anh",
    //       description: "description",
    //       invitedCode: "1",
    //       status: TeamStatus.Available,
    //       participants: ParticipantModel.fromJson())
    // ];
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: FloatingActionButton(
            heroTag: "Thêm thành viên",
            backgroundColor: AppColors.primaryColor,
            onPressed: () async {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      scrollable: true,
                      title: Container(child: Text('Chỉnh sửa', style: TextStyle( fontSize: 20), textAlign: TextAlign.center,)),
                      content: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Tên',
                                  icon: Icon(Icons.account_box),
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Miêu tả',
                                  icon: Icon(Icons.account_box),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Center(
                            child: FlatButton(
                              textColor: ArgonColors.white,
                              color: ArgonColors.warning,
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(4.0),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 16.0,
                                      right: 16.0,
                                      top: 12,
                                      bottom: 12),
                                  child: Text("Xác nhận",
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.w600,
                                          fontSize: 15.0))),
                            ),
                          ),
                        ),
                        // RaisedButton(
                        //     child: Text("Tạo"),
                        //     onPressed: () {
                        //       // your code
                        //     })
                      ],
                    );
                  });
            },
            tooltip: 'Increment',
            child: const Icon(Icons.edit),
          ),
        ),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.black),
          ),
          title: Text(
            "Team 1",
            style: TextStyle(color: Colors.black),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: AppColors.backgroundPageColor,
        ),
        body: ViewDetailTableMenu(),);
  }
}