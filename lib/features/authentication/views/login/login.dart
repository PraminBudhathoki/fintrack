import 'package:fintrack/constants/string_manager.dart';
import 'package:fintrack/features/authentication/bloc/login/login_bloc.dart';
import 'package:fintrack/features/authentication/bloc/login/login_state.dart';
import 'package:fintrack/features/authentication/views/login/widgets/login_Header.dart';
import 'package:fintrack/features/authentication/views/login/widgets/login_form.dart';
import 'package:fintrack/features/homepage/views/accounts1.dart';
import 'package:fintrack/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc loginBloc;

  @override
  void initState() {
    loginBloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => loginBloc,
      child: BlocConsumer<LoginBloc, LoginState>(
        listenWhen: (previous, current) => current is LoginActionState,
        buildWhen: (previous, current) => current is! LoginActionState,
        listener: (context, state) {
          if (state is LoginSucessfulNavigateToHomeActionState) {
            print('naviage to home screen');
            NavigationService().navigateToScreen(const One());
          }
        },
        builder: (context, state) {
          if (state is LoginInitialState) {
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
                      LoginForm(
                        loginBloc: loginBloc,
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
                                image: AssetImage(
                                    'assets/logos/facebook-icon.png'),
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
                                image:
                                    AssetImage('assets/logos/google-icon.png'),
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
          } else {
            return Scaffold();
          }
        },
      ),
    );
  }
}
