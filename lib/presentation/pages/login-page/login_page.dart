import 'package:flix_id/methods.dart';
import 'package:flix_id/presentation/extensions/build_context_extension.dart';
import 'package:flix_id/presentation/providers/router/router_provider.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flix_id/presentation/widgets/flix_textfield.dart';
import 'package:flix_id/presentation/widgets/loading_circullar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(userDataProvider, (previous, next) {
      if (next is AsyncData) {
        if (next.value != null) {
          ref.read(routerProvider).goNamed('main');
        }
      } else if (next is AsyncError) {
        context.showSnackbar(next.error.toString());
      }
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: [
            verticalSpace(100),
            Image.asset(
              'assets/flix_logo.png',
              height: 70,
            ),
            verticalSpace(100),
            FlixTextfield(controller: emailC, label: 'Email'),
            verticalSpace(24),
            FlixTextfield(controller: passwordC, label: 'Password', obscureText: true),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text('Forgot Password'),
              ),
            ),
            verticalSpace(40),
            ElevatedButton(
              onPressed: () {
                ref.read(userDataProvider.notifier).login(
                      email: emailC.text,
                      password: passwordC.text,
                    );
              },
              child: ref.watch(userDataProvider).whenOrNull(
                    loading: () => const LoadingCircullarButton(),
                    data: (data) => const Text('Login'),
                  ),
            ),
            verticalSpace(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?'),
                TextButton(
                    onPressed: () {
                      ref.read(routerProvider).goNamed('register');
                    },
                    child: const Text(
                      'Register Here!',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
