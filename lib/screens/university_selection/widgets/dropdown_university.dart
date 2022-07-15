import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicec_mobi/bloc/university_selection/university_selection_bloc.dart';
import 'package:unicec_mobi/models/entities/temp/temp.dart';

import '../../../bloc/university_selection/university_selection_event.dart';
import '../../../bloc/university_selection/university_selection_state.dart';

class DropdownUniversity extends StatefulWidget {
  @override
  State<DropdownUniversity> createState() => _DropdownUniversityState();
}

class _DropdownUniversityState extends State<DropdownUniversity> {
  @override
  Widget build(BuildContext context) {
    UniversitySelectionBloc bloc =
        BlocProvider.of<UniversitySelectionBloc>(context);
    return Container(
      width: 130,
      height: 30,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15)),
      child: BlocBuilder<UniversitySelectionBloc, UniversitySelectionState>(
          bloc: bloc,
          builder: (context, state) {
            int dropdownValue = state.dropdownNewValueUni;
            return DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(
                    color: Colors.deepPurple, fontWeight: FontWeight.bold),
                onChanged: (int? newValue) {
                  bloc.add(ChangeDropdownValueUni(newValue: newValue!));
                },
                items: state.listUniBelongToEmail
                    .map<DropdownMenuItem<int>>((UniBelongToEmail value) {
                  return DropdownMenuItem<int>(
                    value: value.id,
                    child: Text(value.name),
                  );
                }).toList(),
              ),
            );
          }),
    );
  }
}
