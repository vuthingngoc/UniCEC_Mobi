import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/competition_round/competition_round_bloc.dart';
import '../../../bloc/competition_round/competition_round_event.dart';
import '../../../bloc/competition_round/competition_round_state.dart';
import '../../../utils/loading.dart';
import '../../../utils/log.dart';
import 'list_round_menu.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CompetitionRoundBloc _bloc = BlocProvider.of<CompetitionRoundBloc>(context);

    return BlocBuilder<CompetitionRoundBloc, CompetitionRoundState>(
        bloc: _bloc,
        builder: (context, state) {
          return
              //_bloc.isLoading
              //     ? Loading()
              //    :
              SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: (state.competitionRounds != null)
                      //?.length)! > 0)
                      ? ViewListRoundMenu(
                          competitionRounds: state.competitionRounds)
                      : const Center(
                          child: Text(
                            'Cuộc thi không có vòng thi nào',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ));
        });
  }
}
