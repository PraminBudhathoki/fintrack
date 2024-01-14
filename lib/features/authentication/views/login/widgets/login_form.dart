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
                    Checkbox(
                        value: true,
                        onChanged: (value) {},
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
                onPressed: () {},
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
