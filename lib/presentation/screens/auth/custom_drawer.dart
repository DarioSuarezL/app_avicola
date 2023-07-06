import 'package:app_avicola/presentation/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app_avicola/config/menu/drawer_items.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return const Drawer(
      child: Column(
        children: [
          _DrawerHeader(),
          Expanded(child: _DrawerBody())
        ],
      ),
    );
  }
}

class _DrawerBody extends StatelessWidget {
  const _DrawerBody();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ListView.builder(
      itemCount: appDrawerItems.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(appDrawerItems[index].icon, color: colors.primary,),
        trailing: Icon(Icons.arrow_forward_ios, color: colors.primary),
        title: Text(appDrawerItems[index].title),
        subtitle: Text(appDrawerItems[index].subTitle),
        onTap: () {
          context.replaceNamed(appDrawerItems[index].routeName);
        },
      )
    );
  }
}


//Separate the header from the body



class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader();

  @override
  Widget build(BuildContext context) {

    final userProvider = Provider.of<UserProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 70.0, 20.0, 50.0),
      child: Column(
        children: [
          Center(
            child: Image.asset(
              'assets/default_user.png',
              width: 90.0,
              height: 90.0,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            'Usuario: ${userProvider.user!.nombreUsuario}',
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
          ),
          Text(
            'Código: ${userProvider.user!.idUser}',
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}