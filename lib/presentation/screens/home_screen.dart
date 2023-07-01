import 'package:app_avicola/config/menu/menu_items.dart';
import 'package:app_avicola/presentation/screens/auth/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        child: _HomeView()
      ),
      drawer: const CustomDrawer(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) => GestureDetector(
        child: Card(
          color: colors.primary,
          elevation: 10.0,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(appMenuItems[index].title, style: TextStyle(color: colors.onPrimary, fontSize: 20.0),),
                Text(appMenuItems[index].subTitle, style: TextStyle(color: colors.onPrimary, fontSize: 15.0),),
                Icon(appMenuItems[index].icon, color: colors.onPrimary, size: 50.0,)
              ],
            ),
          ),
        ),
        onTap: () {
          // context.pushNamed(appMenuItems[index].routeName);
        },
      ),
    );
  }
}
