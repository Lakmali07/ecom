import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecom/services/store_data.dart';
import 'package:meta/meta.dart';

import '../../models/profile.dart';
import '../../services/api.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final DioApi api;
  ProfileBloc(this.api) : super(ProfileInitial()) {
    on<FetchProfile>(_getProfile);
  }

  void _getProfile(FetchProfile event, Emitter<ProfileState> emmit)async{
    emit(ProductsLoading());
    try{
      String accessToken = await Store.getToken() ??'';
      final response = await api.getProfile(accessToken);
      Profile profile = Profile.fromJson(response.data);
      emit(ProfileSuccess(profile));
    }catch(e){
      emit(ProfileFailure(e.toString()));
    }
  }
}
