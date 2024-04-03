import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    if (text != null) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * .88,
        child: Center(
          child: Text(
            text!,
            style: const TextStyle(
              color: Colors.white24,
              fontSize: 10,
            ),
          ),
        ),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(strokeCap: StrokeCap.round),
      );
    }
  }
}
