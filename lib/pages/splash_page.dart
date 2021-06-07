import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  static Route<void> route() =>
      MaterialPageRoute(builder: (_) => const SplashPage());

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Scaffold build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void initState() {
    redirect();
    super.initState();
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(milliseconds: 100));
    await _restoreSession();
  }

  Future<void> _restoreSession() async {}
}
