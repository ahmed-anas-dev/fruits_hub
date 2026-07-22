 import 'package:flutter/material.dart';

void BeuildErrorBar( context,String message) {
     ScaffoldMessenger.of(
      context
    ).showSnackBar(
      
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(milliseconds: 600),
        content: Text(message)));
  }

