import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  static const routeName = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('¡Bienvenido! Usuario'),
      ),
      body: const Center(
        child: Text('Home Screen')
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20.0, 70.0, 20.0, 50.0),
          children: const [
            _DrawerHeader()
          ],
        ),
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset(
            'assets/default_user.png',
            width: 90.0,
            height: 90.0,
          ),
        ),
        const SizedBox(height: 10.0),
        const Text(
          'Usuario',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
        ),
        const Text(
          'Código: 0',
          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}