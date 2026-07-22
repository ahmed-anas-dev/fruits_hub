import 'package:flutter/material.dart';

class ErrorBuilder extends StatelessWidget {
  const ErrorBuilder({super.key,required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text),);
  }
}