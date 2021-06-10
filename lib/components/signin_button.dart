import 'package:flutter/material.dart';
import 'package:happnd/app/constants.dart';
import 'package:happnd/components/gradient_border.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key? key,
    required void Function() onPressed,
    required String label,
    required Widget icon,
  })  : _onPressed = onPressed,
        _label = label,
        _icon = icon,
        super(key: key);

  final void Function() _onPressed;
  final String _label;
  final Widget _icon;

  @override
  GradientBorder build(BuildContext context) {
    return GradientBorder(
      strokeWidth: 1,
      borderRadius: 4,
      gradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [appRed, appYellow],
      ),
      child: Material(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(4),
        color: appBlack.withOpacity(0.2),
        child: InkWell(
          onTap: _onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 16,
            ),
            child: Row(
              children: [
                _icon,
                const SizedBox(width: 10),
                Expanded(child: Text(_label))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
