
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      on<LoginRequested>(_onLoginRequested);
      on<LogoutRequest>(_onLogoutRequested);
    });
  }
  void _onLoginRequested(LoginRequested event,Emitter<LoginState> emit)async{
    emit(LoginLoading());
    try{
      final email = event.email;
      final password = event.password;

     // bool success = await _api.signIn(_usernameController.text,_passwordController.text);
      // await Future.delayed(const Duration(seconds: 1),(){
      //   return emit(LoginSuccess('$email $password'));
      // });
    }catch(e){
      return emit(LoginFailure(e.toString()));
    }
  }

  void _onLogoutRequested(LogoutRequest event, Emitter<LoginState> emit)async{

  }
}
