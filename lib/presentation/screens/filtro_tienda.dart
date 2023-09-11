
import 'dart:io';

import 'package:agricultura_venta/widget/menu_appbar.dart';
import 'package:flutter/material.dart';

import '../../datos/tiendas_list.dart';
import '../../dominio/models/tienda.dart';

class FiltrarLugar extends StatefulWidget {
  const FiltrarLugar({super.key});

  @override
  State<FiltrarLugar> createState() => _FiltrarLugarState();
}

class _FiltrarLugarState extends State<FiltrarLugar> {
  //final TextEditingController _filtroController = TextEditingController();
  String dropdownValue =
      'Seleccionar ciudad'; // Valor predeterminado en el Dropdown
  List<Tienda> filterItems = tiendas;

  @override
  void initState() {
    super.initState();
    filterItems =
        tiendas; // Inicializa filterItems con la lista completa al principio
  }

  List<String> obtenerCiudadesUnicas() {
    // Extraer ciudades únicas de la lista de lugares
    Set<String> ciudadesUnicas = <String>{};
    for (var x in tiendas) {
      ciudadesUnicas.add(x.ubicacion);
    }
    return [
      'Seleccionar ciudad',
      ...ciudadesUnicas.toList()
    ]; // Agregar 'Todas' como opción predeterminada
  }

  void filtroPorCiudad(String ciudadSeleccionada) {
    setState(() {
      dropdownValue = ciudadSeleccionada; // Actualizar el valor seleccionado
      if (ciudadSeleccionada == 'Seleccionar ciudad') {
        filterItems =
            tiendas; // Mostrar todos los lugares si se selecciona 'Todas'
      } else {
        filterItems =
            tiendas.where((x) => x.ubicacion == ciudadSeleccionada).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarMenu(title:'Puntos mas cercanos'),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 3,
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: 165,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconEnabledColor: Colors.grey,
                    iconSize: 24,
                    elevation: 10,
                    style: const TextStyle(color: Colors.grey),
                    underline: Container(
                      height: 1,
                      color: null,
                    ),
                    onChanged: (String? newValue) {
                      filtroPorCiudad(
                          newValue!); // Llamar a la función de filtro al cambiar el valor
                    },
                    items: obtenerCiudadesUnicas()
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, //Cantidad de columnas a mostrar en el grid
                ),
                itemCount: filterItems.length, //Cantidad de elementos a mostrar
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                filterItems[index].nombre,
                                style:
                                    const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              content: Column(
                                children: [
                                  Image.file(File(filterItems[index].photo)),
                                  //Image.file
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Nombre: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(filterItems[index].nombre),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Descripción: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        filterItems[index].descripcion,
                                        overflow: TextOverflow
                                            .ellipsis, //Sirve para agregar "..." si es necesario
                                        maxLines:
                                            3, //Sirve para limitar el número de lineas que va aocupar
                                      )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Ubicación: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(filterItems[index].ubicacion),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Estado: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        filterItems[index].estado,
                                        style: TextStyle(
                                            color: filterItems[index].estado == 'Abierto'
                                                ? const Color.fromARGB(
                                                    255, 70, 204, 74)
                                                : Colors.red),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Cerrar',
                                      style: TextStyle(color: Colors.black),
                                    )
                                    )
                              ],
                            );
                          }
                          );
                    },
                    child: Card(
                      child: Column(
                        children: [
                          //Image.file(filterItems[index].photo) = Emulador movil
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                              Image.file(File(filterItems[index].photo), // Navegador
                              height: 70,
                              width: 70,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(
                            filterItems[index].nombre,
                            style: const TextStyle(color: Colors.black),
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