import 'package:flutter/material.dart';

class DrawerItem{
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;
  final String routeName;

  const DrawerItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
    required this.routeName,
  });
}

const appDrawerItems = <DrawerItem>[
  DrawerItem(
    title: 'Inicio',
    subTitle: 'Gestión general',
    link: '/home',
    icon: Icons.manage_accounts,
    routeName: 'home_screen'
  ),
  DrawerItem(
    title: 'Cerrar sesión',
    subTitle: 'Para iniciar sesión con otro usuario',
    link: '/login',
    icon: Icons.logout,
    routeName: 'login_screen'
  ),  
];