import 'package:flutter/material.dart';

class RolItem{
  final String title;
  final String description;
  final int id;

  const RolItem({
    required this.title,
    required this.description,
    required this.id,
  });
}

const appRolItems = <RolItem>[
  RolItem(title: 'Administrador', description: 'encargado de administrar, tiene todos los permisos', id: 1),
  RolItem(title: 'Trabajador', description: 'encargado de la supervisión de los distintos galpones', id: 2),
  RolItem(title: 'Veterinario', description: 'encargado de la salud de las aves', id: 3),
];