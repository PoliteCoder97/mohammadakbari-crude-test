import 'package:mohammad_akbari_crud_test/customer/domain/entities/Customer.dart';

class CustomerModel extends Customer {
  CustomerModel({
    int? id,
    required String? firstname,
    required String? lastname,
    required String? dateOfBirth,
    required String? phoneNumber,
    required String? email,
    required String? bankAccountNumber,
  }) : super(
          id: id,
          firstname: firstname,
          lastname: lastname,
          dateOfBirth: dateOfBirth,
          phoneNumber: phoneNumber,
          email: email,
          bankAccountNumber: bankAccountNumber,
        );

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'] ?? 0,
      firstname: json['firstname'] ?? '',
      lastname: json['lastname'] ?? '',
      dateOfBirth: json['dateOfBirth'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      email: json['email'] ?? '',
      bankAccountNumber: json['bankAccountNumber'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'firstname': this.firstname,
      'lastname': this.lastname,
      'dateOfBirth': this.dateOfBirth,
      'phoneNumber': this.phoneNumber,
      'email': this.email,
      'bankAccountNumber': this.bankAccountNumber,
    };
  }

  static Future<List<CustomerModel>> toList(List data) async {
    List<CustomerModel> customers = [];
    data.forEach((element) => customers.add(CustomerModel.fromJson(element)));
    return customers;
  }
}
