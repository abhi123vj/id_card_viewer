import 'package:flutter/material.dart';
import 'package:id_card_maker/constants/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Container(
          color: AppColors.white,
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}