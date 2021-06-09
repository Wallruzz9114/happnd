import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:happnd/components/app_scaffold.dart';
import 'package:happnd/components/login_button.dart';
import 'package:happnd/pages/tab_page.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> with TickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  );

  late final _curvedAnimation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutCubic,
  );

  late final _delayedController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  );

  late final _delayedCurvedAnimation = CurvedAnimation(
    parent: _delayedController,
    curve: Curves.easeOutCubic,
  );

  late final _moreDelayedController = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );

  late final _moreDdelayedCurvedAnimation = CurvedAnimation(
    parent: _moreDelayedController,
    curve: Curves.easeOutCubic,
  );

  Future<void> _playDelayedAnimation() async {
    await Future.delayed(const Duration(milliseconds: 700));
    await _delayedController.forward();
    await Future.delayed(const Duration(milliseconds: 400));
    await _moreDelayedController.forward();
  }

  @override
  void initState() {
    _playDelayedAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _delayedController.dispose();
    _moreDelayedController.dispose();
    super.dispose();
  }

  @override
  AppScaffold build(BuildContext context) {
    return AppScaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: -53,
            right: -47,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(opacity: _controller.value, child: child);
              },
              child: Image.asset('assets/images/purple-fog.png', height: 228),
            ),
          ),
          Positioned(
            top: 201,
            left: 0,
            child: AnimatedBuilder(
              animation: _curvedAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(-200 + 200 * _curvedAnimation.value, 0),
                  child: child,
                );
              },
              child: Image.asset('assets/images/blue-ellipse.png', height: 168),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 37,
            child: AnimatedBuilder(
              animation: _curvedAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                    200 - 200 * _curvedAnimation.value,
                    400 - 400 * _curvedAnimation.value,
                  ),
                  child: child,
                );
              },
              child: Image.asset('assets/images/blue-blob.png'),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 46,
            child: AnimatedBuilder(
              animation: _delayedCurvedAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                    -300 + 300 * _delayedCurvedAnimation.value,
                    400 - 400 * _curvedAnimation.value,
                  ),
                  child: child,
                );
              },
              child: Image.asset('assets/images/yellow-blob.png'),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: _moreDdelayedCurvedAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                    0,
                    300 - 300 * _moreDdelayedCurvedAnimation.value,
                  ),
                  child: child,
                );
              },
              child: Image.asset('assets/images/red-blob.png'),
            ),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 280),
                  child: DecoratedBox(
                    decoration: const BoxDecoration(color: Color(0x26000000)),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Sign in', style: TextStyle(fontSize: 18)),
                          const SizedBox(height: 24.5),
                          LoginButton(
                            onPressed: () {
                              Navigator.of(context).push(TabPage.route());
                            },
                            label: 'Sign in with Google',
                            icon: Image.asset(
                              'assets/images/google.png',
                              width: 16,
                              height: 16,
                            ),
                          ),
                          const SizedBox(height: 24.5),
                          LoginButton(
                            onPressed: () {
                              Navigator.of(context).push(TabPage.route());
                            },
                            label: 'Sign in with Apple',
                            icon: Image.asset(
                              'assets/images/apple.png',
                              width: 16,
                              height: 16,
                            ),
                          ),
                          const SizedBox(height: 24.5),
                          const Text(
                            'By signing in, you agree to the '
                            'Terms of Service and Privacy Policy',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
