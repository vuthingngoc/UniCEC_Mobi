import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicec_mobi/screens/university_selection/widgets/dropdown_department.dart';

import '../../bloc/university_selection/university_selection_bloc.dart';
import '../../bloc/university_selection/university_selection_event.dart';
import '../../bloc/university_selection/university_selection_state.dart';
import '../../models/entities/temp/temp.dart';
import '../../models/entities/user/complete_profile.dart';
import '../../utils/dimens.dart';
import '../../utils/router.dart';
import 'widgets/dob.dart';
import 'widgets/dropdown_university.dart';
import 'widgets/input_description.dart';
import 'widgets/input_phone.dart';
import 'widgets/input_student_code.dart';
import 'widgets/select_gender.dart';

class UniversitySelectionPage extends StatefulWidget {
  final UniversitySelectionBloc bloc;

  UniversitySelectionPage(this.bloc);

  @override
  State<UniversitySelectionPage> createState() =>
      _UniversitySelectionPageState();
}

class _UniversitySelectionPageState extends State<UniversitySelectionPage> {
  UniversitySelectionBloc get bloc => widget.bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    bloc.listenerStream.listen((event) {
      if (event is NavigatorWelcomePageEvent) {
        Navigator.of(context).pushReplacementNamed(Routes.home);
      } else if (event is ShowingSnackBarEvent) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(event.message)));
      }
    });
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    //nhận data từ trang login
    RouteSettings settings = ModalRoute.of(context)!.settings;
    if (settings.arguments != null) {
      List<UniBelongToEmail> listUniBelongToEmail =
          settings.arguments as List<UniBelongToEmail>;

      if (listUniBelongToEmail != null) {
        //thêm sự kiện để cập nhật state
        bloc.add(RecieveData(listUniBelongToEmail: listUniBelongToEmail));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Mời bạn chọn trường Đại Học")),
        body: BlocProvider.value(
            value: bloc,
            child:
                BlocBuilder<UniversitySelectionBloc, UniversitySelectionState>(
                    bloc: bloc,
                    builder: (context, state) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            DropdownUniversity(),
                            DropdownDepartment(),
                            TextfieldInputPhone(),
                            TextfieldInputStudentCode(),
                            DateOfBirth(),
                            SelectGender(
                                showOtherGender: false, alignVertical: true),
                            TextfieldInputDescription(),
                            InkWell(
                              onTap: () {
                                bloc.add(CompeletelyProfile(
                                    completeProfileModel: CompleteProfile(
                                  universityId: state.universityId,
                                  departmentId: state.departmentId,
                                  dob: state.dob,
                                  gender: state.gender,
                                  phone: state.phone,
                                  studentCode: state.studentCode,
                                  description: state.description,
                                )));
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                    color: Color.fromRGBO(240, 103, 103, 1),
                                  ),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 50.0,
                                      vertical: Dimens.size30),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(width: 5),
                                        Text(
                                          "Xác Nhận",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        )
                                      ],
                                    ),
                                  )),
                            )
                          ],
                        ),
                      );
                    }))

        // body: Container(
        //   child: ListView.builder(
        //       itemCount: listUniBelongToEmail.length,
        //       itemBuilder: (BuildContext context, int index) {
        //         return Container(
        //           height: 50,
        //           child: Text("${listUniBelongToEmail[index].name}"),
        //         );
        //       }),
        // ),
        );
  }
}
