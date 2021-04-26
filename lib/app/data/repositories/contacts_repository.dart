import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/error/failures.dart';
import '../../../core/network/network.dart';
import '../../domain/entities/contact.dart';
import '../../domain/repositories.dart/contacts_repository.dart';
import '../datasources/remote_data_source.dart';

class ContactsRepositoryImpl implements ContactsRepository {
  final RemoteDataSource remoteDataSource;
  final Network network;

  ContactsRepositoryImpl(
      {@required this.remoteDataSource, @required this.network});

  @override
  Future<Either<Failure, List<Contact>>> getContacts() async {
    if (await network.hasConnection) {
      try {
        final remoteContacts = await remoteDataSource.getContacts();
        return Right(remoteContacts);
      } catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
