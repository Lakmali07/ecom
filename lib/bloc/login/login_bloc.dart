
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/Login.dart';
import '../../services/api.dart';
import '../../services/store_data.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final DioApi dioApi;
  LoginBloc(this.dioApi) : super(LoginInitial()) {
      on<LoginRequested>(_onLoginRequested);
      on<LogoutRequest>(_onLogoutRequested);
  }
  void _onLoginRequested(LoginRequested event,Emitter<LoginState> emit)async{
    emit(LoginLoading());
    try{
      var response = await dioApi.signIn(event.email,event.password);
      if(response is DioException){
        return emit(LoginFailure(response.error.toString()));
      }
       else if(response.statusCode == 201){
          saveToken(Login.fromJsonMap(response.data));
          return emit(LoginSuccess('Success'));
        }
        else{
        return emit(LoginFailure('Invalid username or password'));
      }
    }catch(e){
      return emit(LoginFailure(e.toString()));
    }
  }

  void _onLogoutRequested(LogoutRequest event, Emitter<LoginState> emit)async{

  }

  Future<void> saveToken(Login login) async{
    final accessToken = login.accessToken;
    await Store.setToken(accessToken);
  }
}
