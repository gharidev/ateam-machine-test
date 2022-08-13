import 'package:flutter/material.dart';

import 'neumorphic_switch.dart';

class SwitchWithTitle extends StatelessWidget {
  const SwitchWithTitle({
    Key? key,
    required this.title,
    required this.onChanged,
    required this.isSub,
    required this.value,
  }) : super(key: key);

  final String title;
  final void Function(bool value) onChanged;
  final bool value;
  final bool isSub;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: isSub ? 20.0 : 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          CustomNeumorphicSwitch(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
