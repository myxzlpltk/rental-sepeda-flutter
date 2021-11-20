import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  // Properti harus final dan menyertakan tipe data
  final String id;
  final String name;
  final String email;
  final int balance;
  final String? photoURL;

  // Initialisasi
  const AppUser({
    required this.id,
    required this.name,
    required this.email,
    this.balance = 0,
    this.photoURL,
  });

  @override
  List<Object?> get props => [id];
}
