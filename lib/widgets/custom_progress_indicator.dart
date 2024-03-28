import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: text != null
            ? Text(
                text!,
                style: const TextStyle(
                  color: Colors.white24,
                  fontSize: 10,
                ),
              )
            : const CircularProgressIndicator(strokeCap: StrokeCap.round),
      ),
    );
  }
}
