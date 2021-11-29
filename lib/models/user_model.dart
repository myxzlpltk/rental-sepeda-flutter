import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  // Properti harus final dan menyertakan tipe data
  final String id;
  final String name;
  final String email;
  final String photoURL;
  final String phoneNumber;
  final String city;

  // Initialisasi
  const AppUser({
    required this.id,
    required this.name,
    required this.email,
    this.photoURL = "",
    this.phoneNumber = "",
    this.city = "",
  });

  @override
  List<Object?> get props => [id];

  AppUser copyWith({
    String? name,
    String? email,
    String? photoURL,
    String? phoneNumber,
    String? city,
  }) =>
      AppUser(
        id: id,
        name: name ?? this.name,
        email: email ?? this.email,
        photoURL: photoURL ?? this.photoURL,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        city: city ?? this.city,
      );

  factory AppUser.fromDocument(DocumentSnapshot doc) {
    return AppUser(
      id: doc.id,
      name: doc.get('name'),
      email: doc.get('email'),
      photoURL: doc.get('photoURL'),
      phoneNumber: doc.get('phoneNumber'),
      city: doc.get('city'),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'photoURL': photoURL,
      'phoneNumber': phoneNumber,
      'city': city,
    };
  }
}
