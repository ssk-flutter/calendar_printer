import 'package:flutter/material.dart';

class NumberWidget extends StatelessWidget {
  const NumberWidget(
    this.number, {
    Key? key,
  }) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$number',
      textAlign: TextAlign.center,
    );
  }
}
