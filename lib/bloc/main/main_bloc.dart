import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../models/common/current_user.dart';
import '../../utils/base_bloc.dart';
import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends BaseBloc<MainEvent, MainState> {
  MainBloc()
      : super(const MainState(
            currentPageIndex: 2, isHiddenFAB: false, clubSelected: 0)) {
    on((event, emit) async {
      if (event is SwitchingPageEvent) {
        emit(state.copyWith(currentPageIndex: event.pageIndex));
      } else if (event is HidingFloatingActionButtonEvent) {
        emit(state.copyWith(isHiddenFAB: true));
      } else if (event is ShowingFloatingActionButtonEvent) {
        emit(state.copyWith(isHiddenFAB: false));
      } else if (event is UpdateClubSelected) {
        int? clubSelected = GetIt.I.get<CurrentUser>().clubIdSelected;
        emit(state.copyWith(clubSelected: clubSelected));
      }
    });
    // on<SwitchingPageEvent>((event, emit) => emit(SecondState()));
  }
}
