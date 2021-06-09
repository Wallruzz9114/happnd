import 'package:flutter/material.dart';
import 'package:happnd/components/gradient_border.dart';
import 'package:happnd/pages/record_page.dart';

class RecordButton extends StatelessWidget {
  const RecordButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientBorder(
      strokeWidth: 2,
      borderRadius: 12,
      gradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xFF3790E3),
          Color(0xFF43CBE9),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.hardEdge,
        child: Ink(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFFD73763), Color(0xFFF6935C)],
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
    );
  }
}
