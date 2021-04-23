import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../error/failures.dart';

abstract class Usecase<Result, Params> {
  Future<Either<Failure, Result>> call(Params input);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
