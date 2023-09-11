import 'dart:io';
import 'package:flutter/material.dart';

import '../../datos/tiendas_list.dart';
import '../../dominio/models/tienda.dart';
import '../../widget/menu_appbar.dart';
import 'filtro_tienda.dart';
import 'registrar_tienda.dart';

class TiendaHomeScreen extends StatefulWidget {
  const TiendaHomeScreen({super.key});

  @override
  State<TiendaHomeScreen> createState() => _TiendaHomeScreenState();
}

class _TiendaHomeScreenState extends State<TiendaHomeScreen> {
  final TextEditingController _filtrarController = TextEditingController();
  List<Tienda> filterItems = tiendas;

  void searchItem(String text) {
    setState(() {
      filterItems = tiendas
          .where((i) => i.nombre.toLowerCase().contains(text.toLowerCase()))
          .toList();
    });
  }

  void _showTiendaDetails(Tienda tienda) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('${tienda.nombre} '),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.file(
                File(tienda.photo),
                height: 150,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text('Nombre:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  Text('${tienda.nombre}', style: TextStyle(fontSize: 18),)
                ],
              ),
              Row(
                children: [
                  Text('Estado:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  Text('${tienda.estado}', style: TextStyle(fontSize: 18),)
                ],
              ),
              Row(
                children: [
                  Text('Descripción:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  Text('${tienda.descripcion}', style: TextStyle(fontSize: 18),)
                ],
              ),
              Row(
                children: [
                  Text('Ubicación:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  Text('${tienda.ubicacion}', style: TextStyle(fontSize: 18),)
                ],
              ),
              
                          ],
          ),
          actions: [
           ElevatedButton(
  onPressed: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmación'),
          content: Text('¿Estás seguro de que deseas eliminar este elemento?'),
          actions: <Widget>[
            TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Cerrar',
                                      style: TextStyle(color: Colors.black),
                                    )
                                    ),
            TextButton(
              child: Text('Eliminar',style: TextStyle(
                color: Colors.red,fontSize: 15
              ),),
              onPressed: () {
                setState(() {
                  tiendas.remove(tienda);
                  filterItems = tiendas;
                });
                Navigator.push(context, MaterialPageRoute(builder: (context)=> TiendaHomeScreen())); // Cierra el cuadro de diálogo
              },
            ),
          ],
        );
      },
    );
  },
  style: ElevatedButton.styleFrom(
    primary: Colors.white,
  ),
  child: const Text(
    'Eliminar',
    style: TextStyle(
      color: Colors.red,
    ),
  ),
),

            TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Cerrar',
                                      style: TextStyle(color: Colors.black),
                                    )
                                    ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarMenu(title: 'Puntos de venta'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TiendaRegistrationScreen(),
                      ),
                    );
      
                    if (result != null) {
                      setState(() {
                        tiendas.add(result);
                        filterItems = tiendas;
                      });
                    }
                  },
                  child: const Text('Registrar puntos', style: TextStyle(fontSize: 15),),
                ),
                SizedBox(width: 85),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> FiltrarLugar()));
                  },
                  icon: Icon(Icons.tune),
                  label: Text('Filtrar', style: TextStyle(fontSize: 15),),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: searchItem,
                controller: _filtrarController,
                decoration: const InputDecoration(
                  labelText: 'Buscar',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filterItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _showTiendaDetails(filterItems[index]);
                    },
                    child: Card(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.file(
                              File(filterItems[index].photo),
                              height: 150,
                              width: 150, // Ancho de la imagen
                              fit: BoxFit.fill,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            
                            children: [
                              Text(
                                '${filterItems[index].nombre}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                                ),
                              ),
                              Text('        ${filterItems[index].estado}', style: TextStyle(fontSize: 20),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}