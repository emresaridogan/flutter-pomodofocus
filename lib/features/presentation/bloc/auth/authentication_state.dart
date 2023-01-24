// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {}

class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthFailed extends AuthenticationState {
  String error;
  AuthFailed({
    required this.error,
  });
  @override
  List<Object?> get props => [];
}

class AuthenticationLoading extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthenticationState {
  String uid;
  Authenticated({
    required this.uid,
  });
  @override
  List<Object?> get props => [];
}

class UnAuthenticated extends AuthenticationState {
  String error;
  UnAuthenticated({required this.error});

  @override
  List<Object?> get props => [error];
}
