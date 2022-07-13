import 'package:equatable/equatable.dart';

class SplashEvent {}

class SplashState extends Equatable {
  final double opacity;

  SplashState({required this.opacity});

  SplashState copyWith({required double opacity}) {
    return SplashState(opacity: opacity ?? this.opacity);
  }

  @override
  // TODO: implement props
  List<Object> get props => [opacity];
}
