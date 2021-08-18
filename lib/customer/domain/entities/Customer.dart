import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  int? id;
  final String? firstname;
  final String? lastname;
  final String? dateOfBirth;
  final String? phoneNumber;
  final String? email;
  final String? bankAccountNumber;

  Customer({
    this.id,
    required this.firstname,
    required this.lastname,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.email,
    required this.bankAccountNumber,
  });

  @override
  List<Object?> get props => [
        this.id,
        this.firstname,
        this.lastname,
        this.dateOfBirth,
        this.phoneNumber,
        this.email,
        this.bankAccountNumber,
      ];
}
