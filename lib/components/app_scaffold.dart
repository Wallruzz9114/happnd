import 'package:flutter/material.dart';

class AppScaffold extends Scaffold {
  AppScaffold({
    Key? key,
    PreferredSizeWidget? appBar,
    required Widget body,
    Widget? floatingActionButton,
    Widget? bottomNavigationBar,
  }) : super(
          key: key,
          appBar: appBar,
          body: Stack(
            fit: StackFit.expand,
            children: [
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF4B3199),
                      Color(0xFF2284A9),
                    ],
                  ),
                ),
              ),
              body,
            ],
          ),
          floatingActionButton: floatingActionButton,
          bottomNavigationBar: bottomNavigationBar,
        );
}
