import 'dart:convert';

import 'package:simple_login_flutter/app/data/models/contact_model.dart';
import 'package:http/http.dart' as http;
import 'package:simple_login_flutter/env/env.dart';

abstract class RemoteDataSource {
  Future<List<ContactModel>> getContacts();
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final http.Client client;
  final url = Environment.baseUrl;

  RemoteDataSourceImpl(this.client);

  @override
  Future<List<ContactModel>> getContacts() async {
    final _response = await client.get(url + "contacts");
    return (json.decode(_response.body)['contacts'] as List)
        .map((e) => ContactModel.fromJson(e))
        .toList();
  }
}
