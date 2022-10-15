import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  width: 120, child: Image.asset("assets/ic_logo_round.png")),
              const SizedBox(height: 30),
              const Text("Welcome To Expense Tracker"),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: SignInButton(
                  elevation: 5,
                  Buttons.Facebook,
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: SignInButton(
                  elevation: 5,
                  Buttons.Google,
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 30),
              const Text("Don't want to create account now?"),
              ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(35),
                    backgroundColor: Colors.deepPurpleAccent,
                  ),
                  icon: const Icon(
                    Icons.login,
                    size: 24.0,
                  ),
                  label: const Text("Continue Without Login")),
            ],
          ),
        ),
      ),
    );
  }
}
