import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {}

class UserInitial extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoading extends UserState {
  @override
  List<Object?> get props => [];
}

class UserSuccess extends UserState {
  @override
  List<Object?> get props => [];
}

class UserFailure extends UserState {
  String error;
  UserFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
