import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

class MenuItem{
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;
  final String routeName;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
    required this.routeName,
  });

}

const MenuItems = <MenuItem>[
  MenuItem(
    title: 'Inicio',
    subTitle: 'Gestión general',
    link: '/home',
    icon: Icons.manage_accounts,
    routeName: 'home_screen'
  ),
  MenuItem(
    title: 'Cerrar sesión',
    subTitle: '',
    link: '/login',
    icon: Icons.manage_accounts,
    routeName: 'login_screen'
  ),  
];