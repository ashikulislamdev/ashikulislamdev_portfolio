import 'package:flutter/material.dart';

class SideMenuData {
  final menu = const <MenuModel>[
    MenuModel(icon: Icons.home, title: 'Home'),
    MenuModel(icon: Icons.person, title: 'About'),
    MenuModel(icon: Icons.settings_accessibility, title: 'Skills'),
    MenuModel(icon: Icons.design_services, title: 'Service'),
    MenuModel(icon: Icons.work_rounded, title: 'Project'),
    MenuModel(icon: Icons.contact_emergency, title: 'contact'),
  ];
}

class MenuModel {
  final IconData icon;
  final String title;

  const MenuModel({required this.icon, required this.title});
}