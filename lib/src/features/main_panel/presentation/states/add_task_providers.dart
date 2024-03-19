import 'package:flutter_riverpod/flutter_riverpod.dart';

final deadlineSwitcherProvider = StateProvider<bool>((ref) => false);
final deadlineTimeProvider = StateProvider<DateTime?>((ref) => null);
final deadlineTimeErrorProvider = StateProvider<String?>((ref) => null);
