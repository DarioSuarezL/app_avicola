import 'package:app_avicola/presentation/models/user_data.dart';
import 'package:app_avicola/presentation/providers/user_provider.dart';
import 'package:app_avicola/presentation/providers/users_provider.dart';
import 'package:app_avicola/presentation/screens/auth/custom_drawer.dart';
import 'package:go_router/go_router.dart ';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsuariosScreen extends StatelessWidget {

  static const routeName = 'usuarios_screen';
  const UsuariosScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de usuarios'),
      ),
      body: const Center(
        child: _UsuariosView()
      ),
      drawer: const CustomDrawer(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => context.pushNamed('register_screen'),
      )
    );

  }
}

class _UsuariosView extends StatelessWidget {
  const _UsuariosView();

  @override
  Widget build(BuildContext context) {

    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    // final userProvider = Provider.of<UserProvider>(context, listen: false);

    List<UserData>? listUsers = usersProvider.users;

    return ListView.builder(
      itemCount: listUsers!.length,
      itemBuilder: (context, index) {

        return ListTile(
          title: Text('Nombre: ${listUsers[index].nombreUsuario }', style: const TextStyle(fontSize: 20)),
          subtitle: Text('Rol: ${listUsers[index].rol.nombre }'),
          // trailing: IconButton(
          //   icon: const Icon(Icons.delete),
          //   onPressed: (){

          //   },
          // ),
        );
      },
    );
  }
}