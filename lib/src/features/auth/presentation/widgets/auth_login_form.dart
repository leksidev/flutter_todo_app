import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/generated/l10n.dart';
import 'package:flutter_todo_app/src/common_widgets/gap.dart';
import 'package:flutter_todo_app/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_todo_app/src/common_widgets/colored_button.dart';
import 'package:flutter_todo_app/src/features/auth/presentation/widgets/auth_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuthTextField(
              labelText: S.of(context).login,
              controller: emailController,
            ),
            const Gap(size: 20),
            AuthTextField(
              labelText: S.of(context).password,
              controller: passwordController,
            ),
            const Gap(size: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).create_account),
                Text(S.of(context).forgot_password),
              ],
            ),
            const Gap(size: 20),
            ColoredButton(
              onPressed: () {
                context.read<AuthBloc>().add(
                      AuthDataRequested(
                        login: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      ),
                    );
              },
              label: Text(S.of(context).login),
            ),
            ColoredButton(
              onPressed: () {
                AutoRouter.of(context).pushNamed('/register');
              },
              label: Text(S.of(context).register),
            )
          ],
        ),
      ),
    );
  }
}
