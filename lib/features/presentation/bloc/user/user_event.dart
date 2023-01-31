import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {}

class UpdateUserButtonPressed extends UserEvent {
  final String name, username, userId;
  UpdateUserButtonPressed({
    required this.name,
    required this.username,
    required this.userId,
  });

  @override
  List<Object?> get props => [name, username, userId];
}

