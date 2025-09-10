import 'package:equatable/equatable.dart';

class SwitchState extends Equatable{
  final bool value;
  final double opacity;
  const SwitchState({this.value = true, this.opacity = 1.0});

  SwitchState copyWith({bool? value, double? opacity}) {
    return SwitchState(value: value ?? this.value, opacity: opacity ?? this.opacity);
  }

  @override
  List<Object?> get props => [value, opacity];
}