import 'package:flutter/material.dart';

class  UsuarioMenuItem{
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;
  final String routeName;

  const UsuarioMenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
    required this.routeName,
  });
}

const appUsuarioMenuItems = <UsuarioMenuItem>[
  UsuarioMenuItem(
    title: 'Cambiar contraseña',
    subTitle: 'Editar contraseña actual',
    link: '/changepwd',
    icon: Icons.lock_person,
    routeName: 'change_pwd_screen'
  ),
];