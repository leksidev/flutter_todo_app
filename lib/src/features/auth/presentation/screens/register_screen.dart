import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/auth_text_field.dart';
import '../widgets/auth_button.dart';

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
              const AuthTextField(
                labelText: 'Логин',
              ),
              const AuthTextField(labelText: 'Пароль'),
              const AuthTextField(labelText: 'Повторите пароль'),
              const SizedBox(height: 20),
              AuthButton(
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
