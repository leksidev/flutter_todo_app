import 'package:flutter/material.dart';

/// A widget that creates a gap with a specified size.
/// size in pixels
class Gap extends SizedBox {
  final double size;
  const Gap({super.key, required this.size}) : super(width: size, height: size);
  const Gap.vertical({super.key, required this.size}) : super(height: size);
  const Gap.horizontal({super.key, required this.size}) : super(width: size);
}
