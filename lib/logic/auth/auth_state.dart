part of 'auth_cubit.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

// sign in states
class SignInLoadingState extends AuthenticationState {}

class SignInSccuessState extends AuthenticationState {}

class SignInErrorState extends AuthenticationState {}
