import 'package:app/layers/domain/entities/user.dart';
import 'package:app/layers/presentation/blocs/auth/auth_bloc.dart';
import 'package:app/layers/presentation/blocs/auth/auth_event.dart';
import 'package:app/layers/presentation/blocs/auth/auth_state.dart';
import 'package:app/layers/presentation/screens/profile/widgets/custom_header.dart';
import 'package:app/layers/presentation/widgets/button.dart';
import 'package:app/layers/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: CustomScrollView(
        slivers: [
          const CustomHeader(
            title: 'Perfil Pessoal',
            subtitle:
                'Gerencie suas configurações e personalize sua experiência.',
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  final User user = state.user!;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: 'Nome',
                        value: user.name,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomText(
                        title: 'E-mail',
                        value: user.email,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomText(
                        title: 'Telefone',
                        value: user.phone,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Atualizar informações'),
                        leading: Icon(Icons.edit_outlined),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Atualizar senha'),
                        leading: Icon(Icons.password_outlined),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Atualizar endereço'),
                        leading: Icon(Icons.map_outlined),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Atualizar veículo'),
                        leading: Icon(Icons.local_shipping_outlined),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Sobre o App'),
                        leading: Icon(Icons.info_outline),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Ajuda'),
                        leading: Icon(Icons.help_outline),
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
