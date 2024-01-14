import 'package:fintrack/constants/string_manager.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        //logo, Title and Sub-title

        Padding(
          padding: EdgeInsets.only(
            top: 56.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                height: 100,
                image: AssetImage("assets/logos/F.png"),
              ),
              Text(StringManager.welcome,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  )),
              SizedBox(
                height: 16,
              ),
              Text(StringManager.welcomeSubtitle)
            ],
          ),
        )
      ],
    );
  }
}
