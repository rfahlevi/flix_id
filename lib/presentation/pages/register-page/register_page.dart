import 'package:flix_id/methods.dart';
import 'package:flix_id/presentation/extensions/build_context_extension.dart';
import 'package:flix_id/presentation/providers/router/router_provider.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flix_id/presentation/widgets/flix_textfield.dart';
import 'package:flix_id/presentation/widgets/loading_circullar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterPage extends ConsumerWidget {
  final TextEditingController emailC = TextEditingController();
  final TextEditingController nameC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  final TextEditingController retypePasswordC = TextEditingController();
  RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(userDataProvider, (previous, next) {
      if (next is AsyncData && next.value != null) {
        ref.read(routerProvider).goNamed('main');
      } else if (next is AsyncError) {
        context.showSnackbar(next.error.toString());
      }
    });
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: SafeArea(
            child: ListView(
          children: [
            verticalSpace(40),
            Image.asset(
              'assets/flix_logo.png',
              height: 70,
            ),
            verticalSpace(40),
            const CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.add_a_photo_rounded,
                size: 50,
                color: Colors.white,
              ),
            ),
            verticalSpace(40),
            FlixTextfield(controller: emailC, label: 'Email'),
            verticalSpace(24),
            FlixTextfield(controller: nameC, label: 'Name'),
            verticalSpace(24),
            FlixTextfield(controller: passwordC, label: 'Password', obscureText: true),
            verticalSpace(24),
            FlixTextfield(controller: retypePasswordC, label: 'Retype Password', obscureText: true),
            verticalSpace(40),
            ElevatedButton(
              onPressed: () {
                if (passwordC.text == retypePasswordC.text) {
                  ref.read(userDataProvider.notifier).register(
                        name: nameC.text,
                        email: emailC.text,
                        password: passwordC.text,
                      );
                } else {
                  context.showSnackbar('Password and retype password doesn\'t match');
                }
              },
              child: ref.watch(userDataProvider).whenOrNull(
                    data: (data) => const Text('Register'),
                    loading: () => const LoadingCircullarButton(),
                  ),
            ),
            verticalSpace(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Alread have an account?'),
                TextButton(
                  onPressed: () => ref.read(routerProvider).goNamed('login'),
                  child: const Text(
                    'Login Here',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
