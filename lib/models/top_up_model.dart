import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';

class TopUp extends Equatable {
  final String id;
  final String uid;
  final int amount;
  final DateTime createdAt;
  final String status;

  const TopUp({
    required this.id,
    required this.uid,
    required this.amount,
    required this.createdAt,
    this.status = TopUpStatus.pending,
  });

  @override
  List<Object?> get props => [id];

  TopUp copyWith({
    String? uid,
    int? amount,
    DateTime? createdAt,
    String? status,
  }) =>
      TopUp(
        id: id,
        uid: uid ?? this.uid,
        amount: amount ?? this.amount,
        createdAt: createdAt ?? this.createdAt,
        status: status ?? this.status,
      );

  factory TopUp.fromDocument(DocumentSnapshot doc) {
    return TopUp(
      id: doc.id,
      uid: doc.get('uid'),
      amount: doc.get('amount'),
      createdAt: doc.get('createdAt').toDate(),
      status: doc.get('status'),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'amount': amount,
      'createdAt': createdAt,
      'status': status,
    };
  }
}

class TopUpStatus {
  static const String success = "success";
  static const String failed = "failed";
  static const String pending = "pending";
}
