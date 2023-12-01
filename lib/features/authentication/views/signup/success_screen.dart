import 'package:fintrack/constants/string_manager.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            top: 80.0, left: 24.0, right: 24.0, bottom: 20.0),
        child: Center(
          child: Column(
            children: [
              ///logo, Account Creation and Continue

              Padding(
                padding: const EdgeInsets.only(
                  top: 56.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Image(
                      height: 100,
                      image: AssetImage("assets/logos/F.png"),
                    ),
                    const Text(
                      StringManager.successCreation,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 46,
                    ),
                    const Text(StringManager.successWelcome),
                    const SizedBox(
                      height: 26,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(StringManager.continueText),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
