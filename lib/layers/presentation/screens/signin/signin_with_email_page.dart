import 'package:app/core/helpers/validators.dart';
import 'package:app/layers/presentation/blocs/auth/auth_bloc.dart';
import 'package:app/layers/presentation/blocs/auth/auth_event.dart';
import 'package:app/layers/presentation/blocs/auth/auth_state.dart';
import 'package:app/layers/presentation/screens/forgot_password_page.dart';
import 'package:app/layers/presentation/screens/initial_page.dart';
import 'package:app/layers/presentation/screens/signup/signup_page.dart';
import 'package:app/layers/presentation/widgets/button.dart';
import 'package:app/layers/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninWithEmailPage extends StatefulWidget {
  const SigninWithEmailPage({super.key});

  @override
  State<SigninWithEmailPage> createState() => _SigninWithEmailPageState();
}

class _SigninWithEmailPageState extends State<SigninWithEmailPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  bool validatorEnabled = false;
  bool isLoading = false;

  void handleSubmit() {
    if (form.currentState!.validate()) {
      context.read<AuthBloc>().add(
            AuthSignin(
              email: email.text,
              password: password.text,
            ),
          );
    } else {
      setState(() {
        validatorEnabled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Erro: ${state.error}',
                  style: const TextStyle(color: Colors.redAccent),
                ),
                backgroundColor: Colors.grey.shade200,
              ),
            );
          }
          if (state is Authenticated) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => InitialPage(),
              ),
              (Route<dynamic> route) => false,
            );
          }
          if (state is AuthLoading) {
            setState(() {
              isLoading = true;
            });
          } else if (state is! AuthLoading && isLoading) {
            setState(() {
              isLoading = false;
            });
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: form,
            child: Column(
              children: [
                const Text(
                  'Faça Login com seu E-mail',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Acesse sua conta para gerenciar suas entregas de forma rápida e segura.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomTextField(
                  controller: email,
                  label: 'Email',
                  hintText: 'Insira seu email',
                  prefixIcon: const Icon(Icons.mail_outline),
                  validator: fieldRequired,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  controller: password,
                  label: 'Senha',
                  hintText: 'Insira sua senha',
                  obscureText: true,
                  prefixIcon: const Icon(Icons.lock_outline),
                  validator: fieldRequired,
                ),
                const SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPasswordPage(),
                        )),
                    child: const Text(
                      'Esqueceu sua senha?',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Button(
                  onPressed: !isLoading ? handleSubmit : null,
                  label: 'Entrar',
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Não tem uma conta?',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupPage(),
                          )),
                      child: const Text(
                        'Criar conta',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
