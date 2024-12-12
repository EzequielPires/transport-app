import 'package:app/layers/presentation/blocs/auth/auth_bloc.dart';
import 'package:app/layers/presentation/blocs/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) => Container(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 64,
          top: MediaQuery.of(context).padding.top > 0
              ? MediaQuery.of(context).padding.top + 16
              : 32,
        ),
        decoration: BoxDecoration(
          color: Colors.redAccent.shade200,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.redAccent.shade100,
              minRadius: 32,
              child: ClipOval(
                child: Image.network(
                  state.user!.avatar!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.person,
                      size: 32,
                      color: Colors.white,
                    );
                  },
                  width: 64,
                  height: 64,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Olá, ${state.user!.name} 👋',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Catalão, GO',
                    style: TextStyle(color: Colors.white.withOpacity(.9)),
                  ),
                ],
              ),
            ),
            IconButton.filledTonal(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.redAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
