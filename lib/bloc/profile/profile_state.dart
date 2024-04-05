part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileSuccess extends ProfileState{
  final Profile profile;

  ProfileSuccess(this.profile);
}

class ProfileFailure extends ProfileState{
  final String error;

  ProfileFailure(this.error);
}

class ProductsLoading extends ProfileState{

}