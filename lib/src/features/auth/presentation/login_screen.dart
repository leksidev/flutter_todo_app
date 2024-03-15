import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_text_field.dart';
import 'auth_button.dart';

@RoutePage(name: 'LoginScreenRoute')
class LoginScreen extends ConsumerWidget {
  const LoginScreen({
    super.key,
  });

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
              const SizedBox(height: 20),
              AuthButton(
                onPressed: () {},
                label: const Text('Войти'),
              ),
              AuthButton(
                onPressed: () {
                  AutoRouter.of(context).pushNamed('/register');
                },
                label: const Text('Регистрация'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
