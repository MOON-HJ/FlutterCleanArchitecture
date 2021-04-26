import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';
import '../bloc/contact_bloc.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ContactBloc _contacts = sl<ContactBloc>();

  @override
  void initState() {
    super.initState();
    _contacts.add(GetContactsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildContacts(context),
    );
  }

  Widget _buildContacts(BuildContext context) {
    return BlocBuilder(
      bloc: _contacts,
      builder: (context, state) {
        if (state is Loaded) {
          return ListView(
              children: state.items
                  .map((e) => ListTile(
                        title: Text(e.name),
                        subtitle: Text(e.email),
                      ))
                  .toList());
        } else if (state is Loading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Text((state is Error) ? state.message : "알 수 없음");
        }
      },
    );
  }
}
