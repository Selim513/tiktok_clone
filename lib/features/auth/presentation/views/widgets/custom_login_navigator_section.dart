import 'package:flutter/material.dart';

class CustomLoginNavigatorSection extends StatelessWidget {
  const CustomLoginNavigatorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Log in',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
