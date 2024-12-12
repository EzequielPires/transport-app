import 'package:app/injections/auth_injection.dart';
import 'package:app/layers/presentation/blocs/auth/auth_bloc.dart';
import 'package:app/layers/presentation/blocs/auth/auth_event.dart';
import 'package:app/layers/presentation/screens/initial_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  authInit();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => authInjec<AuthBloc>()
            ..add(
              AuthLoad(),
            ),
        )
      ],
      child: MaterialApp(
        title: 'Transporte',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
          useMaterial3: true,
        ),
        home: InitialPage(),
      ),
    );
  }
}
