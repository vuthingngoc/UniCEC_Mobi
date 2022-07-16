import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gender_picker/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:unicec_mobi/bloc/university_selection/university_selection_event.dart';

import '../../../bloc/university_selection/university_selection_bloc.dart';
import '../../../bloc/university_selection/university_selection_state.dart';

class SelectGender extends StatefulWidget {
  final bool showOtherGender;
  final bool alignVertical;

  SelectGender({required this.showOtherGender, required this.alignVertical});

  @override
  State<SelectGender> createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  @override
  Widget build(BuildContext context) {
    UniversitySelectionBloc bloc =
        BlocProvider.of<UniversitySelectionBloc>(context);
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Giới Tính:",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
            margin: EdgeInsets.symmetric(vertical: 40),
            alignment: Alignment.center,
            child: BlocBuilder<UniversitySelectionBloc,
                    UniversitySelectionState>(
                bloc: bloc,
                builder: (context, state) {
                  return Center(
                    child: GenderPickerWithImage(
                      showOtherGender: widget.showOtherGender,
                      verticalAlignedText: widget.alignVertical,
                      // to show what's selected on app opens, but by default it's Male
                      selectedGender: Gender.Male,
                      selectedGenderTextStyle: TextStyle(
                          color: Color(0xFF8b32a8),
                          fontWeight: FontWeight.bold),
                      unSelectedGenderTextStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                      onChanged: (Gender? gender) {
                        //0. Male
                        if (gender == 0) {
                          bloc.add(ChangeGenderValue(newGenderValue: "Male"));
                        }
                        //1. Female
                        if (gender == 1) {
                          bloc.add(ChangeGenderValue(newGenderValue: "Female"));
                        }
                      },
                      //Alignment between icons
                      equallyAligned: true,

                      animationDuration: Duration(milliseconds: 300),
                      isCircular: true,
                      // default : true,
                      opacityOfGradient: 0.4,
                      padding: const EdgeInsets.all(3),
                      size: 50, //default : 40
                    ),
                  );
                }))
      ],
    );
  }
}
