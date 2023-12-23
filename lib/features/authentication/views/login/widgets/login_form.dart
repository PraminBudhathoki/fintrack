import 'package:fintrack/constants/string_manager.dart';
import 'package:fintrack/features/authentication/views/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../services/navigation_service.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Column(
          children: [
            ///Email
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                prefix: Icon(Iconsax.direct_right),
                labelText: StringManager.email,
              ),
            ),
            const SizedBox(height: 16),

            ///Password
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                prefix: Icon(Iconsax.password_check),
                labelText: StringManager.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: 8),

            ///Remember Me and Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///RememberMe
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(StringManager.rememberMe),
                  ],
                ),

                ///Forget Password
                TextButton(
                  onPressed: () {},
                  child: const Text(StringManager.forgetPassword),
                ),
              ],
            ),

            ///Sign in Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(StringManager.signIn),
              ),
            ),

            ///Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  NavigationService().navigateToScreen(SignupScreen());
                },
                child: Text(StringManager.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
