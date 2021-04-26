import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../entities/contact.dart';

abstract class ContactsRepository {
  Future<Either<Failure, List<Contact>>> getContacts();
}
