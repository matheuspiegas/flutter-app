import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  login() {
    if (formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Image.asset(
                  width: MediaQuery.sizeOf(context).width,
                  "/logo-pb-vertical.png"),
              //email
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email obrigatório!";
                  }
                  return null;
                },
                maxLength: 70,
                keyboardType: TextInputType.emailAddress,
                decoration:
                    const InputDecoration(label: Text("Digite seu email")),
              ),
              const SizedBox(
                height: 50,
              ),
              //senha
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Senha obrigatória!";
                  }
                  return null;
                },
                maxLength: 20,
                decoration:
                    const InputDecoration(label: Text("Digite sua senha")),
              ),
              const SizedBox(
                height: 50,
              ),
              //botão entrar
              SizedBox(
                  height: 50,
                  width: MediaQuery.sizeOf(context).width,
                  child: ElevatedButton(
                      onPressed: login, child: const Text('Entrar')))
            ],
          ),
        ),
      ),
    );
  }
}
