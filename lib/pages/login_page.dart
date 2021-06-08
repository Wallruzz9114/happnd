import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:happnd/components/app_scaffold.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  AppScaffold build(BuildContext context) {
    return AppScaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Sign in'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
