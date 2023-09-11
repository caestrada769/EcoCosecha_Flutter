
import 'package:flutter/material.dart';

import '../presentation/screens/login.dart';

class AppbarMenu extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  const AppbarMenu({super.key, required this.title});

  @override
  State<AppbarMenu> createState() => _AppbarMenuState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50.0);
}

class _AppbarMenuState extends State<AppbarMenu> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      backgroundColor: Color.fromARGB(255, 77, 179, 79),
      actions: [
        IconButton(
  onPressed: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cerrar Sesión'),
          content: const Text('¿Estás seguro de que deseas cerrar sesión?', style: TextStyle(fontSize: 15),),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context)=> Login())); 
              },
              child: const Text('Cerrar Sesión',style: TextStyle(
                color: Colors.red, fontSize: 15
              ),),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  },
  icon: Icon(Icons.manage_accounts),
)
      ],
    );
  }
}