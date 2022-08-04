import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/view_list_team/view_list_team_bloc.dart';
import '../../../bloc/view_list_team/view_list_team_event.dart';
import '../../../bloc/view_list_team/view_list_team_state.dart';
import '../../../constants/Theme.dart';
import '../../widgets/input.dart';
import 'list_team_menu.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

//   @override
//   State<Body> createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
  final _formKeyInvitedCode = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ViewListTeamBloc bloc = BlocProvider.of<ViewListTeamBloc>(context);
    return BlocBuilder<ViewListTeamBloc, ViewListTeamState>(
        bloc: bloc,
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20, bottom: 20),
                    child: FlatButton(
                      textColor: ArgonColors.white,
                      color: ArgonColors.warning,
                      onPressed: () {
                        //Respond to button press
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
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
                                            prefixIcon: Icon(Icons.description),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
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
                                        if (_formKeyInvitedCode.currentState!
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
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15.0))),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 12, bottom: 12),
                          child: Text("Nhập mã tham gia",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.0))),
                    ),
                  ),
                ],
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
            ]),
          );
        });
  }
}
