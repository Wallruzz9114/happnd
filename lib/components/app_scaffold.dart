import 'package:flutter/material.dart';
import 'package:happnd/app/constants.dart';

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
                    colors: [appPurple, appBlue],
                  ),
                ),
              ),
              body
            ],
          ),
          floatingActionButton: floatingActionButton,
          bottomNavigationBar: bottomNavigationBar,
        );
}
