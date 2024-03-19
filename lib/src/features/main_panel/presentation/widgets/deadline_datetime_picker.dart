import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/src/features/main_panel/presentation/states/add_task_providers.dart';
import 'package:flutter_todo_app/src/utils/talker_provider.dart';

class DeadlineDateTimePicker extends ConsumerWidget {
  const DeadlineDateTimePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final switchValue = ref.watch(deadlineSwitcherProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Установить дедлайн'),
            trailing: Switch.adaptive(
              value: switchValue,
              onChanged: (newValue) async {
                ref.read(deadlineSwitcherProvider.notifier).state = newValue;
                if (newValue) {
                  // Сохраняем контекст
                  BuildContext dialogContext = context;
                  DateTime today = DateTime.now();

                  try {
                    // Отображаем диалог выбора даты

                    DateTime? selectedDate = await showDatePicker(
                      context: dialogContext,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(today.year, today.month, today.day),
                      lastDate: DateTime(2100),
                    );
                    if (selectedDate == null) {
                      ref.watch(deadlineSwitcherProvider.notifier).state =
                          false;
                      throw 'Не выбрана дата';
                    }
                    // Обновляем состояние с выбранной датой
                    ref.watch(deadlineTimeProvider.notifier).state = DateTime(
                      selectedDate.year,
                      selectedDate.month,
                      selectedDate.day,
                    );
                    // Отображаем диалог выбора времени
                    TimeOfDay? selectedTime = await showTimePicker(
                      // ignore: use_build_context_synchronously
                      context: dialogContext,
                      initialTime: TimeOfDay.now(),
                    );

                    if (selectedTime == null) {
                      ref.watch(deadlineSwitcherProvider.notifier).state =
                          false;
                      ref.watch(deadlineTimeProvider.notifier).state = null;
                      throw 'Не выбрано время';
                    }

                    ref.watch(deadlineTimeProvider.notifier).state = DateTime(
                      selectedDate.year,
                      selectedDate.month,
                      selectedDate.day,
                      selectedTime.hour,
                      selectedTime.minute,
                    );
                  } catch (e) {
                    ref.watch(deadlineSwitcherProvider.notifier).state = false;
                    ref.watch(deadlineTimeProvider.notifier).state = null;
                    talker.error(e.toString());
                  }
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
