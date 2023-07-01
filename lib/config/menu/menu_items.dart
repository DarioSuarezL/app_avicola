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

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Galpones',
    subTitle: 'Gestionar galpones',
    link: '/galpones',
    icon: Icons.home_filled,
    routeName: 'galpones_screen'
  ),
  MenuItem(
    title: 'Alertas',
    subTitle: 'Alertas de estado de los distintos galpones',
    link: '/alertas',
    icon: Icons.campaign,
    routeName: 'alertas_screen'
  ), 
  
];