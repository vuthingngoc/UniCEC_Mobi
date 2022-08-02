import '../../models/enums/competition_activity_status.dart';

class ViewDetailActivityEvent {}

class RecieveDataEvent extends ViewDetailActivityEvent {
  final competitionActivityId;
  RecieveDataEvent({required this.competitionActivityId});
}

class ChangeStatusEvent extends ViewDetailActivityEvent {
  final CompetitionActivityStatus newStatus;

  ChangeStatusEvent({required this.newStatus});
}

class UpdateStatusEvent extends ViewDetailActivityEvent {}

class ChangeImageIndex extends ViewDetailActivityEvent {
  final int imageIndex;
  ChangeImageIndex({required this.imageIndex});
}

class ShowingSnackBarEvent extends ViewDetailActivityEvent {
  final String message;

  ShowingSnackBarEvent({required this.message});
}
