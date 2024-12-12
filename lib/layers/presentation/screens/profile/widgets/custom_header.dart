import 'package:app/layers/presentation/blocs/auth/auth_bloc.dart';
import 'package:app/layers/presentation/blocs/auth/auth_event.dart';
import 'package:app/layers/presentation/blocs/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomHeader extends StatefulWidget {
  final String title;
  final String subtitle;

  const CustomHeader({super.key, required this.subtitle, required this.title});

  @override
  State<CustomHeader> createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return SliverPadding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: MediaQuery.of(context).padding.top + 20,
          ),
          sliver: SliverToBoxAdapter(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        widget.subtitle,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => context.read<AuthBloc>().add(AuthLogout()),
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
