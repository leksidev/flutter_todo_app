import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/auth_text_field.dart';
import '../../../common_widgets/colored_button.dart';

@RoutePage(name: 'RegisterScreenRoute')
class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          height: 400,
          child: Column(
            children: [
              AuthTextField(
                labelText: 'Логин',
                controller: TextEditingController(),
              ),
              AuthTextField(
                labelText: 'Пароль',
                controller: TextEditingController(),
              ),
              AuthTextField(
                labelText: 'Повторите пароль',
                controller: TextEditingController(),
              ),
              const SizedBox(height: 20),
              ColoredButton(
                onPressed: () {
                  AutoRouter.of(context).removeLast();
                },
                label: const Text('Создать аккаунт'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
