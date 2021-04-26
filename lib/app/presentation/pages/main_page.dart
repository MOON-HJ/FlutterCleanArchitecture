import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../env/env.dart';
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
      body: Column(
        children: [
          Text("hello World"),
          Text(Environment.baseUrl + ""),
          _buildContacts(context)
        ],
      ),
    );
  }

  Widget _buildContacts(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        if (state is Loaded) {
          Text(state.items
              .map((e) => e.name)
              .reduce((value, element) => value + element));
        } else if (state is Loading) {
          return CupertinoActivityIndicator();
        } else {
          return Text((state is Error) ? state.message : "알 수 없음");
        }
      },
    );
  }
}
