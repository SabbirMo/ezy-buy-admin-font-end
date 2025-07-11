import 'package:ezy_buy_admin_font_end/features/auth/login/presentation/provider/login_provider.dart';
import 'package:ezy_buy_admin_font_end/features/auth/login/presentation/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final emailController = ref.watch(emailControllerProvider);
    final passwordController = ref.watch(passwordControllerProvider);
    final showPassword = ref.watch(hidenPassword);
    return Scaffold(
      body: Center(
        child: Container(
          width: size.width > 600 ? 400 : size.width * 0.9,
          height: size.height * .8,
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
          ),
          child: Column(
            children: [
              Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Inter",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New to Our Product?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff5A607F),
                      fontFamily: "Inter",
                    ),
                  ),
                  const SizedBox(width: 6),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Create an Account",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Inter",
                        color: Color(0xff1E5EFF),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              CustomTextField(
                text: "Email",
                labelText: "Enter Email Address",
                controller: emailController,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                text: "Password",
                labelText: "Enter Password",
                controller: passwordController,
                obscureText: !showPassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    ref.read(hidenPassword.notifier).update((state) => !state);
                  },
                  icon: Icon(showPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined),
                ),
              ),
              const SizedBox(height: 24),
              InkWell(
                onTap: () async {
                  print("Email: ${emailController.text}");
                  print("Password: ${passwordController.text}");

                  final email = ref.read(emailControllerProvider).text.trim();
                  final password =
                      ref.read(passwordControllerProvider).text.trim();

                  if (email.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please fill in all fields")));
                    return;
                  }

                  try {
                    final token = await ref.read(loginProvider({
                      'email': email,
                      'password': password,
                    }).future);

                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setString('auth_token', token);

                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Login Successfully ")));
                    print(token);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(" Login failed: ${e.toString()}")),
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color(0xff1E2753),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
