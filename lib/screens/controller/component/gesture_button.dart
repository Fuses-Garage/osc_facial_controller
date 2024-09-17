import 'package:flutter/material.dart';

class GestureButton extends StatelessWidget {
  const GestureButton(
      {super.key,
      required this.index,
      required this.direction,
      required this.defaultname,
      required this.send,
      this.namelabel});
  final String defaultname;
  final String? namelabel;
  final String direction;
  final int index;
  final void Function(String dir, int index) send;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: () => send(direction, index),
        child: Text(namelabel ?? defaultname));
  }
}
