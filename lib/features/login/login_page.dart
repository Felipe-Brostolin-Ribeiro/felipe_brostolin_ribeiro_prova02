import 'package:flutter/material.dart';
import 'package:worldskills/core/local_storage/store.dart';
import 'package:worldskills/features/disiciplinas/disciplina_page.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _senhaController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void initState() {
    final Store store = Store();

    if (store.getObject('usuario') != null) {}

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/Logo.png',
          ),
          const SizedBox(
            height: 48,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      label: Text("Email"),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe seu email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _senhaController,
                    decoration: const InputDecoration(
                      label: Text("Senha"),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe sua senha';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final aluno = await LoginController.login(
                            _emailController.text, _senhaController.text);

                        if (aluno != null) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const DisciplinaPage(),
                            ),
                          );
                        }
                      }
                    },
                    child: Text("Entrar"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
