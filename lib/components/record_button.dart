import 'package:flutter/material.dart';
import 'package:happnd/app/constants.dart';
import 'package:happnd/components/gradient_border.dart';
import 'package:happnd/pages/record_page.dart';

class RecordButton extends StatelessWidget {
  const RecordButton({
    Key? key,
  }) : super(key: key);

  @override
  Expanded build(BuildContext context) {
    return Expanded(
      child: Center(
        heightFactor: 1,
        child: GradientBorder(
          strokeWidth: 2,
          borderRadius: 12,
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [appBlue, appLightBlue],
          ),
          child: Material(
            borderRadius: BorderRadius.circular(10),
            clipBehavior: Clip.hardEdge,
            child: Ink(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [appRed, appOrange],
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(RecordPage.route());
                },
                child: const Padding(
                  padding: EdgeInsets.all(9),
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
