import 'package:fintrack/constants/string_manager.dart';
import 'package:fintrack/features/authentication/bloc/login/login_bloc.dart';
import 'package:fintrack/features/authentication/bloc/login/login_events.dart';
import 'package:fintrack/features/authentication/bloc/login/login_state.dart';
import 'package:fintrack/features/authentication/views/signup/signup.dart';
import 'package:fintrack/features/homepage/views/accounts1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../services/navigation_service.dart';

class LoginForm extends StatefulWidget {
  final LoginBloc loginBloc;
  const LoginForm({
    super.key,
    required this.loginBloc,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool checkedValue = true;
  bool _obscureText = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Column(
          children: [
            ///Email
            TextFormField(
              controller: usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                prefix: Icon(Iconsax.direct_right),
                labelText: StringManager.userName,
              ),
              onChanged: (val) {
                BlocProvider.of<LoginBloc>(context).add(
                  LoginTextChangedEvent(
                      usernameController.text, passwordController.text),
                );
              },
            ),
            const SizedBox(height: 16),

            ///Password
            TextFormField(
              controller: passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                prefix: const Icon(Iconsax.password_check),
                labelText: StringManager.password,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(_obscureText ? Iconsax.eye_slash : Iconsax.eye),
                ),
              ),
              onChanged: (val) {
                BlocProvider.of<LoginBloc>(context).add(
                  LoginTextChangedEvent(
                      usernameController.text, passwordController.text),
                );
              },
            ),

            ///Error message displayed

            Container(
              alignment: Alignment.centerLeft,
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is LoginErrorState) {
                    return Text(
                      state.errorMessage,
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.left,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),

            ///Remember Me and Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///RememberMe
                Row(
                  children: [
                    Checkbox(
                        value: checkedValue,
                        onChanged: (newValue) {
                          setState(() {
                            checkedValue = newValue!;
                          });
                        },
                        activeColor: Colors.purple),
                    const Text(StringManager.rememberMe,
                        style: TextStyle(color: Colors.purple)),
                  ],
                ),

                ///Forget Password
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    StringManager.forgetPassword,
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ],
            ),

            ///Sign in Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.purple, // Set the background color of the button
                ),
                onPressed: () {
                  print('button clicked login submitted');
                  widget.loginBloc.add(LoginSubmittedEvent(
                      usernameController.text, passwordController.text));
                },
                child: const Text(StringManager.signIn,
                    style: TextStyle(color: Colors.white)),
              ),
            ),

            ///Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.purple, // Set the background color of the button
                ),
                onPressed: () {
                  NavigationService().navigateToScreen(const SignupScreen());
                },
                child: const Text(StringManager.createAccount,
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
