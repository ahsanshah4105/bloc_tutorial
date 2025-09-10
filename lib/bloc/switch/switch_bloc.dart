import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/bloc/switch/switch_event.dart';
import 'package:bloc_tutorial/bloc/switch/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState>{
  SwitchBloc() : super(const SwitchState() ) {
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<ChangeOpacity>(_slideToChangeOpacity);
  }

  void _enableOrDisableNotification(EnableOrDisableNotification event, Emitter<SwitchState> emit){
    emit(state.copyWith(value: !state.value));
  }
  void _slideToChangeOpacity(ChangeOpacity event, Emitter<SwitchState> emit){
    emit(state.copyWith(opacity: event.opacity));
  }
}