import 'package:app_avicola/presentation/screens/auth/custom_drawer.dart';
import 'package:flutter/material.dart';

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
    );

  }
}

class _UsuariosView extends StatelessWidget {
  const _UsuariosView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: (){}, 
          child: const Text('+ Añadir usuario'),
        ),
        SingleChildScrollView(),

      ],
    );
  }
}