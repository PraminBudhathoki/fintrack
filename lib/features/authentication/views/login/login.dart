import 'package:fintrack/constants/string_manager.dart';
import 'package:fintrack/features/authentication/views/login/widgets/login_Header.dart';
import 'package:fintrack/features/authentication/views/login/widgets/login_form.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 26.0, left: 24.0, right: 24.0, bottom: 20.0),
          child: Column(
            children: [
              ///login Header
              const LoginHeader(),

              ///login Form
              const LoginForm(),

              ///Divider
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Divider(
                    color: Colors.black,
                    indent: 0,
                    endIndent: 5,
                  )),
                  Text(StringManager.orSignUpWith),
                  Flexible(
                      child: Divider(
                    color: Colors.black,
                    indent: 5,
                    endIndent: 0,
                  )),
                ],
              ),

              ///Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ///Facebook
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                        height: 60,
                        image: AssetImage('assets/logos/facebook-icon.png'),
                      ),
                    ),
                  ),

                  ///Google
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                        height: 60,
                        image: AssetImage('assets/logos/google-icon.png'),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
