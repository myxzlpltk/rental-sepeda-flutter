import 'package:equatable/equatable.dart';

class User extends Equatable {
  // Properti harus final dan menyertakan tipe data
  final int id;
  final String name;
  final String email;
  final String photoURL;

  // Initialisasi
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.photoURL,
  });

  // Factory adalah membuat obyek model dari data json (Map<String, dynamic>)
  factory User.fromJson(Map<String, dynamic> data) => User(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      photoURL: data['photo_url']);

  @override
  List<Object?> get props => [id];
}
