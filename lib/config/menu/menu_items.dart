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
  // MenuItem(
  //   title: 'Lotes',
  //   subTitle: 'Gestionar lotes',
  //   link: '/lotes',
  //   icon: Icons.add_home_work,
  //   routeName: 'lotes_screen'
  // ),
  MenuItem(
    title: 'Alertas',
    subTitle: 'Alertas de estado de los distintos galpones',
    link: '/alertas',
    icon: Icons.campaign,
    routeName: 'alertas_screen'
  ), 
  MenuItem(
    title: 'Usuarios',
    subTitle: 'Gestionar usuarios',
    link: '/usuarios',
    icon: Icons.person,
    routeName: 'usuarios_screen'
  ),
  MenuItem(
    title: 'Vacunas',
    subTitle: 'Gestionar vacunas',
    link: '/vacunas',
    icon: Icons.medical_services,
    routeName: 'vacunas_screen'
  ),
  MenuItem(
    title: 'Incubadoras',
    subTitle: 'Gestionar incubadoras',
    link: '/incubadoras',
    icon: Icons.egg,
    routeName: 'incubadoras_screen'
  ),

  
];