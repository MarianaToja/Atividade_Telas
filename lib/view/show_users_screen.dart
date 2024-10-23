
import 'package:first_app/models/user_model.dart';
import 'package:first_app/widgets/cardDados.dart';
import 'package:flutter/material.dart';

class ShowUsersScreen extends StatelessWidget {
  ShowUsersScreen({
    super.key,
    required this.users
  });

  final List<UserModel> users;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Dados")
        ),
        body: Center(
          child: Column(
            children: [
              Dados(users: users)
            ],
          ),
        ),
      ),
    );
  }
}

