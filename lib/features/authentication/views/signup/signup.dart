import 'package:fintrack/constants/string_manager.dart';
import 'package:fintrack/features/authentication/views/signup/widgets/Signup_form.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 80.0, left: 24.0, right: 24.0, bottom: 20.0),
          child: Column(
            children: [
              ///Title
              const Text(
                StringManager.createNewAccount,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),

              ///Form
              const SignupForm(),
              const SizedBox(
                height: 20,
              ),

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
