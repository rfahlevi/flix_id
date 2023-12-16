import 'dart:io';

import 'package:flix_id/methods.dart';
import 'package:flix_id/presentation/extensions/build_context_extension.dart';
import 'package:flix_id/presentation/providers/router/router_provider.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flix_id/presentation/widgets/flix_textfield.dart';
import 'package:flix_id/presentation/widgets/loading_circullar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final TextEditingController emailC = TextEditingController();
  final TextEditingController nameC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  final TextEditingController retypePasswordC = TextEditingController();

  XFile? xfile;

  @override
  void dispose() {
    emailC.dispose();
    nameC.dispose();
    passwordC.dispose();
    retypePasswordC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(userDataProvider, (previous, next) {
      if (next is AsyncData && next.value != null) {
        ref.read(routerProvider).goNamed('main', extra: xfile != null ? File(xfile!.path) : null);
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
            GestureDetector(
              onTap: () async {
                xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
                setState(() {});
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage: xfile != null ? FileImage(File(xfile!.path)) : null,
                child: xfile != null
                    ? null
                    : const Icon(
                        Icons.add_a_photo_rounded,
                        size: 50,
                        color: Colors.white,
                      ),
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
