import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String photoURL;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.photoURL,
  });

  @override
  List<Object?> get props => [id];
}
