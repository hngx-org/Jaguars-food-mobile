import 'package:flutter/material.dart';

import 'app_color.dart';

class LoadingScreen extends StatelessWidget {
  final String? message;

  const LoadingScreen({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(
              color: AppColor.appBrandColor,
              strokeWidth: 4.0,
            ),
            if (message != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  message!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
