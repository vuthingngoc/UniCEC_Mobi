import 'package:equatable/equatable.dart';

class MainState extends Equatable{
  final int currentPageIndex;
  final bool isHiddenFAB;

  const MainState({required this.currentPageIndex, required this.isHiddenFAB});

  MainState copyWith({int? currentPageIndex, bool? isHiddenFAB}) {
    return MainState(
        currentPageIndex: currentPageIndex ?? this.currentPageIndex,
        isHiddenFAB: isHiddenFAB ?? this.isHiddenFAB
    );
  }

  @override
  List<Object> get props => [currentPageIndex, isHiddenFAB];
}

class SecondState extends MainState{
  SecondState({required super.currentPageIndex, required super.isHiddenFAB});
}
