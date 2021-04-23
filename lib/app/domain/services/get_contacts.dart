import 'package:dartz/dartz.dart';
import 'package:simple_login_flutter/app/domain/entities/contact.dart';
import 'package:simple_login_flutter/app/domain/repositories.dart/contacts_repository.dart';
import 'package:simple_login_flutter/core/error/failures.dart';
import 'package:simple_login_flutter/core/services/service.dart';

class GetContacts implements Usecase<List<Contact>, NoParams> {
  final ContactsRepository repository;

  GetContacts(this.repository);

  @override
  Future<Either<Failure, List<Contact>>> call(NoParams input) async {
    return await repository.getContacts();
  }
}
