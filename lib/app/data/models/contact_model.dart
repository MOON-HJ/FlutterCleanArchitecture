import 'dart:convert';

import 'phone_model.dart';
import '../../../core/error/exceptions.dart';

import '../../domain/entities/contact.dart';
import '../../domain/entities/phone.dart';
import 'package:http/http.dart' as http;

class ContactModel extends Contact {
  ContactModel(
      {String address,
      String email,
      String gender,
      String id,
      String name,
      Phone phone})
      : super(
            address: address,
            email: email,
            gender: gender,
            id: id,
            name: name,
            phone: phone);

  factory ContactModel.fromJson(Map<String, dynamic> data) {
    print(data.toString());
    try {
      return ContactModel(
        address: data['addresss'],
        email: data['email'],
        gender: data['gender'],
        id: data['id'],
        name: data['name'],
        phone: PhoneModel.fromJson(data['phone']),
      );
    } catch (e) {
      throw ServerException();
    }
  }
}
