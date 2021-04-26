import 'package:equatable/equatable.dart';

import 'phone.dart';

class Contact extends Equatable {
  final String id;
  final String name;
  final String email;
  final String address;
  final String gender;
  final Phone phone;

  Contact(
      {this.id, this.name, this.email, this.address, this.gender, this.phone});

  @override
  List<Object> get props => [id, name, email, address, gender, phone];
}
