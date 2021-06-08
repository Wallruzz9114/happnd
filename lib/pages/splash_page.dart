import 'package:flutter/material.dart';
import 'package:happnd/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

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
    await _restoreSession();
    redirectToLoginPage();
  }

  void redirectToLoginPage() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const LoginPage(),
      ),
    );
  }

  Future<void> _restoreSession() async {}
}
