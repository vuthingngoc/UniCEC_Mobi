import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/view_list_team_participant/view_list_team_participant_bloc.dart';
import '../../../bloc/view_list_team_participant/view_list_team_participant_event.dart';
import '../../../bloc/view_list_team_participant/view_list_team_participant_state.dart';
import '../../../constants/Theme.dart';
import '../../../models/enums/team_status.dart';
import '../../../utils/app_color.dart';
import '../../widgets/input.dart';
import 'list_team_menu.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
//   @override
  final _formKeyInvitedCode = GlobalKey<FormState>();
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ViewListTeamParticipantBloc bloc =
        BlocProvider.of<ViewListTeamParticipantBloc>(context);
    return BlocBuilder<ViewListTeamParticipantBloc,
            ViewListTeamParticipantState>(
        bloc: bloc,
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextFormField(
                          controller: _controller,
                          onFieldSubmitted: (value) {
                            bloc.add(ChangeSearchNameEvent(searchName: value));
                          },
                          autofocus: false,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  _controller.clear;
                                  _controller.text = "";
                                  //sửa lại cái
                                  bloc.add(
                                      ChangeSearchNameEvent(searchName: null));
                                },
                                icon: const Icon(Icons.clear)),
                            labelText: 'Tìm Tên Đội',
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        bloc.add(LoadingEvent());
                        bloc.add(SearchEvent());
                      },
                      child: Icon(Icons.search),
                    ),
                    PopupMenuButton<int>(
                        icon: Icon(Icons.filter_alt_outlined),
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              onTap: () {
                                bloc.add(LoadingEvent());
                                bloc.add(ChangeTeamStatusEvent(
                                    status: TeamStatus.Available));
                              },
                              value: 1,
                              child: (state.status == TeamStatus.Available)
                                  ? Container(
                                      color: Colors.green,
                                      child: Row(
                                        children: <Widget>[
                                          //Icon(Icons.camera, size: 18),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text('Mở'),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Row(
                                      children: <Widget>[
                                        //Icon(Icons.camera, size: 18),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text('Mở'),
                                        ),
                                      ],
                                    ),
                            ),
                            PopupMenuItem(
                              onTap: () {
                                bloc.add(LoadingEvent());
                                bloc.add(ChangeTeamStatusEvent(
                                    status: TeamStatus.IsLocked));
                              },
                              value: 2,
                              child: (state.status == TeamStatus.IsLocked)
                                  ? Container(
                                      color: Colors.green,
                                      child: Row(
                                        children: <Widget>[
                                          //Icon(Icons.school, size: 18),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text('Đóng'),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Row(
                                      children: <Widget>[
                                        //Icon(Icons.school, size: 18),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text('Đóng'),
                                        ),
                                      ],
                                    ),
                            ),
                            PopupMenuItem(
                              onTap: () {
                                _controller.text = "";
                                bloc.add(LoadingEvent());
                                bloc.add(ResetFilterEvent());
                              },
                              value: 3,
                              child: Row(
                                children: <Widget>[
                                  //Icon(Icons.delete, size: 18),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text('Tất Cả'),
                                  ),
                                ],
                              ),
                            ),
                          ];
                        }),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Expanded(
                      child: Text(
                    "Tên đội",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),
                  Expanded(
                      child: Text(
                    "Số thành viên",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Text(
                    "Trạng thái",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),
                  Expanded(
                      child: Text(
                    "Chi tiết",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),
                ],
              ),
              ViewListTeamMenu(),
              SizedBox(height: 20),
              if (state.listTeam.isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 20, bottom: 20),
                    //   child:
                    Container(
                      width: 200,
                      //padding: const EdgeInsets.only(top: 0.5, bottom: 0.5),
                      decoration: BoxDecoration(
                          border: Border.all(color: ArgonColors.warning),
                          color: ArgonColors.warning,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: FlatButton(
                          textColor: ArgonColors.white,
                          //color: ArgonColors.warning,
                          onPressed: () {
                            //Respond to button press
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    scrollable: true,
                                    title: Container(
                                        child: Text(
                                      'Nhập mã tham gia',
                                      style: TextStyle(fontSize: 20),
                                      textAlign: TextAlign.center,
                                    )),
                                    content: Padding(
                                        padding: const EdgeInsets.only(
                                          top: 8,
                                        ),
                                        child: Form(
                                          key: _formKeyInvitedCode,
                                          child: TextFormField(
                                              decoration: InputDecoration(
                                                prefixIcon:
                                                    Icon(Icons.description),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                              ),
                                              maxLength: 20,
                                              minLines: 1,
                                              maxLines: 2,
                                              validator: (value) {
                                                if (value!.length < 10) {
                                                  return 'Nhập ít nhất 10 ký tự';
                                                }
                                                return null;
                                              },
                                              onChanged: (value) {
                                                if (_formKeyInvitedCode
                                                    .currentState!
                                                    .validate()) {
                                                  bloc.add(
                                                      ChangeInvitedCodeValueEvent(
                                                          newInvitedCodeValue:
                                                              value));
                                                }
                                              }),
                                        )),
                                    actions: [
                                      Container(
                                        width: double.infinity,
                                        margin: new EdgeInsets.only(
                                            right: 15, left: 15, bottom: 15),
                                        child: FlatButton(
                                          textColor: ArgonColors.white,
                                          color: ArgonColors.warning,
                                          onPressed: () {
                                            if (_formKeyInvitedCode
                                                .currentState!
                                                .validate()) {
                                              bloc.add(JoinTeamEvent());
                                              Navigator.of(context).pop();
                                            }
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 16.0,
                                                  right: 16.0,
                                                  top: 12,
                                                  bottom: 12),
                                              child: Text("Tham gia",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 15.0))),
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          },
                          child:
                              //  Padding(
                              //     padding: EdgeInsets.only(
                              //         left: 16.0, right: 16.0, top: 12, bottom: 12),
                              //     child:
                              Text("Nhập mã tham gia",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.0))),
                    ),
                    //),
                    //),
                  ],
                ),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                AnimatedButton(
                    width: 200,
                    text: 'Lưu ý của Cuộc Thi',
                    color: ArgonColors.warning,
                    pressEvent: () {
                      AwesomeDialog(
                              context: context,
                              dialogType: DialogType.WARNING,
                              headerAnimationLoop: true,
                              animType: AnimType.TOPSLIDE,
                              title: 'Lưu ý',
                              desc: 'Quy định về Đội Thi của Cuộc Thi'
                                      '\n 1.Tạo, Tham Gia đội khi Cuộc Thi chưa diễn ra.'
                                      '\n 2.Tham Gia đội khi trạng thái của Đội là Mở.'
                                      '\n 3.Chuyển trạng thái Đóng Đội được khi số lượng thành viên trong Đội đúng theo quy định của Cuộc thi đưa ra.'
                                      '\n 4.Đội ở trạng thái Đóng thì Ban Tổ Chức mới duyệt trở thành Đội tham gia chính thức còn lại hủy bỏ.'
                                      '\n'
                                      '\n Quy định về Số Lượng thành viên Đội\n' +
                                  '${(state.maxNumber == state.minNumber) ? 'Số lượng thành viên trong Đội hợp lệ phải đúng ${state.maxNumber} thành viên' : 'Số lượng thành viên trong Đội hợp lệ tối thiểu từ ${state.minNumber} trở lên và không vượt quá ${state.maxNumber} thành viên'}')
                          .show();
                    }),
              ]),
            ]),
          );
        });
  }
}
