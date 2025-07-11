// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../provider/login_provider.dart';
// import '../widget/custom_text_field.dart';

// class LoginScreen extends ConsumerWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final size = MediaQuery.of(context).size;
//     final emailController = ref.watch(emailControllerProvider);
//     final passwordController = ref.watch(passwordControllerProvider);
//     final showPassword = ref.watch(hidenPassword);
//     return Scaffold(
//       body: Center(
//         child: Container(
//           width: size.width > 600 ? 400 : size.width * 0.9,
//           height: size.height * .8,
//           padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(13),
//           ),
//           child: Column(
//             children: [
//               Text(
//                 "Sign In",
//                 style: TextStyle(
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: "Inter",
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "New to Our Product?",
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Color(0xff5A607F),
//                       fontFamily: "Inter",
//                     ),
//                   ),
//                   const SizedBox(width: 6),
//                   InkWell(
//                     onTap: () {},
//                     child: Text(
//                       "Create an Account",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontFamily: "Inter",
//                         color: Color(0xff1E5EFF),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 24.0),
//               CustomTextField(
//                 text: "Email",
//                 labelText: "Enter Email Address",
//                 controller: emailController,
//               ),
//               const SizedBox(height: 16),
//               CustomTextField(
//                 text: "Password",
//                 labelText: "Enter Password",
//                 controller: passwordController,
//                 obscureText: !showPassword,
//                 suffixIcon: IconButton(
//                   onPressed: () {
//                     ref.read(hidenPassword.notifier).update((state) => !state);
//                   },
//                   icon: Icon(showPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
//                 ),
//               ),
//               const SizedBox(height: 24),
//               InkWell(
//                 onTap: () {
//                   print("Email: ${emailController.text}");
//                   print("Password: ${passwordController.text}");
//                 },
//                 child: Container(
//                   width: double.infinity,
//                   padding: EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: Color(0xff1E2753),
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                   child: Center(
//                     child: Text(
//                       "Submit",
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

// }
