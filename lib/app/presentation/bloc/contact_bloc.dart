import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/error/failures.dart';
import '../../../core/services/service.dart';
import '../../domain/entities/contact.dart';
import '../../domain/services/get_contacts.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final GetContacts getContacts;

  ContactBloc({@required GetContacts getContacts})
      : assert(getContacts != null),
        getContacts = getContacts;

  @override
  ContactState get initialState => Loading();

  @override
  Stream<ContactState> mapEventToState(ContactEvent event) async* {
    if (event is GetContactsEvent) {
      final failureOrContacts = await getContacts(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrContacts);
    }
  }

  Stream<ContactState> _eitherLoadedOrErrorState(
      Either<Failure, List<Contact>> failureOrContacts) async* {
    yield failureOrContacts.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (contacts) => Loaded(items: contacts),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return failure.message;
    } else {
      return "알 수 없는 오류 발생";
    }
  }
}

// event
@immutable
abstract class ContactEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetContactsEvent extends ContactEvent {
  GetContactsEvent();
  @override
  List<Object> get props => [];
}

// state
@immutable
abstract class ContactState extends Equatable {
  @override
  List<Object> get props => [];
}

class Loading extends ContactState {}

class Loaded extends ContactState {
  final List<Contact> items;

  Loaded({@required this.items});

  @override
  List<Object> get props => [items];
}

class Error extends ContactState {
  final String message;
  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
