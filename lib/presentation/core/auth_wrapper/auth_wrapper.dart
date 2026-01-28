import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livingspirit/presentation/screens/category_selection_screen/category_selection_screen.dart';
import '../../widgets/default_page_transition.dart';
import 'auth_controller.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    return AnimatedBuilder(
      animation: authController,
      builder: (context, child) => const DefaultPageTransition(
        child: CategorySelectionScreen(),
        // authController.user == null
        //     ? const LoginScreen()
        //     : const NavigationScreen(),
      ),
    );
  }
}
