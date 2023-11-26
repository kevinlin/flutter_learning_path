import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(BuildContext context, String label) {
  return InputDecoration(
    labelStyle: Theme.of(context).textTheme.labelMedium,
    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
    isCollapsed: true,
    labelText: label,
    border: OutlineInputBorder(),
  );
}
