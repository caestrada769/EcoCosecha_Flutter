
import 'package:flutter/material.dart';

import '../presentation/screens/filtro_tienda.dart';
import '../presentation/screens/inicio.dart';
import '../presentation/screens/tienda_home.dart';


class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
       child: ListView(
         children:[
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 77, 179, 79),
              
            ),
            child: Text('EcoCosecha', style: TextStyle(fontSize: 30),),
          ),
          ListTile(
            title: const Text('Inicio', style: TextStyle(fontSize: 20),),
            leading: const Icon(Icons.home),
            onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (contexto) => const Inicio() ,
            ),
            );
            }
          ),
          ListTile(
            title: const Text('Puntos de venta', style: TextStyle(fontSize: 20),),
            leading: const Icon(Icons.store),
            onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (contexto) => const TiendaHomeScreen() ,
            ),
            );
            }
          ),

          ListTile(
            title: const Text('Filtrar puntos', style: TextStyle(fontSize: 20),),
            leading: const Icon(Icons.tune),
            onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (contexto) => const FiltrarLugar() ,
            ),
            );
            }
          ),
          
          
         ],
       ),
    );
    
  }
}