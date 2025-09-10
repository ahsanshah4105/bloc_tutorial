import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object> get props => [];
}

class EnableOrDisableNotification extends SwitchEvent{}
class ChangeOpacity extends SwitchEvent{
  final double opacity;
  ChangeOpacity({required this.opacity});

  @override
  List<Object> get props => [opacity];
}
