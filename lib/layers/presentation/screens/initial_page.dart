import 'package:app/layers/presentation/blocs/auth/auth_bloc.dart';
import 'package:app/layers/presentation/blocs/auth/auth_state.dart';
import 'package:app/layers/presentation/screens/navigation_page.dart';
import 'package:app/layers/presentation/screens/signin/signin_page.dart';
import 'package:app/layers/presentation/screens/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return NavigationPage();
        } else if (state is Unauthenticated) {
          return SigninPage();
        }

        return SplashPage();
      },
    );
  }
}
