import 'package:app_avicola/config/menu/usuario_menu_items.dart';
import 'package:go_router/go_router.dart';
import 'package:app_avicola/presentation/screens/auth/custom_drawer.dart';
import 'package:flutter/material.dart';

class UsuarioScreen extends StatelessWidget {

  static const String routeName = 'usuario_screen';
  const UsuarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opciones de usuario'),
      ),
      body: _UsuarioView(),
      drawer: const CustomDrawer(),
    );
  }
}

class _UsuarioView extends StatelessWidget {
  const _UsuarioView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appUsuarioMenuItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(appUsuarioMenuItems[index].title),
          subtitle: Text(appUsuarioMenuItems[index].subTitle),
          leading: Icon(appUsuarioMenuItems[index].icon),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            context.pushNamed(appUsuarioMenuItems[index].routeName);
          },
        );
      }
    );
  }
}