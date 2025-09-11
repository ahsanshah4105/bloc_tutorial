import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/bloc/switch/switch_event.dart';
import 'package:bloc_tutorial/bloc/switch/switch_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState>{
  final SharedPreferences  preferences;

  SwitchBloc({required this.preferences}) : super(SwitchState(
    value: preferences.getBool('notification') ?? false,
    opacity: preferences.getDouble('opacity') ?? 1.0,
  ) ) {
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<ChangeOpacity>(_slideToChangeOpacity);
  }

  void _enableOrDisableNotification(EnableOrDisableNotification event, Emitter<SwitchState> emit){
    final newValue = !state.value;
    preferences.setBool('notification', newValue);
    emit(state.copyWith(value: newValue));
  }
  void _slideToChangeOpacity(ChangeOpacity event, Emitter<SwitchState> emit){
    preferences.setDouble('opacity', event.opacity);
    emit(state.copyWith(opacity: event.opacity));
  }
}