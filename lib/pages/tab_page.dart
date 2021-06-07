import 'package:flutter/material.dart';

class TabPage extends StatelessWidget {
  const TabPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const TabPage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
