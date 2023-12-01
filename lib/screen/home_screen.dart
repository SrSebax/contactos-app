import 'package:contactos_app/screen/edit_contact.dart';
import 'package:contactos_app/screen/message_response.dart';
import 'package:contactos_app/screen/register_contact.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String _title;
  const MyHomePage(this._title, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  List<Contacto> contactos = [
    Contacto(name: 'Sebas', surname: 'Londoño', phone: '302 4247369'),
    Contacto(name: 'Andres', surname: 'Londoño', phone: '302 4247369'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
        backgroundColor: Colors.white70,
      ),
      body: ListView.builder(
        itemCount: contactos.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              onTap: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => EditContact(contactos[index])))
                    .then((newContact) {
                  if (newContact != null) {
                    setState(() {
                      contactos.removeAt(index);
                      contactos.insert(index, newContact);
                      messageResponse(
                          context, newContact.name + " a sido actualizado");
                    });
                  }
                });
              },
              onLongPress: () {
                removeContact(context, contactos[index]);
              },
              title: Text(
                '${contactos[index].name} ${contactos[index].surname}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(contactos[index].phone),
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  contactos[index].name.substring(0, 1),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              trailing: const Icon(
                Icons.call,
                color: Colors.blue,
              ),
            ),
          );
        },
      ),
      // * TABS
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.perm_contact_cal_rounded), label: 'Contactos'),
            BottomNavigationBarItem(
                icon: Icon(Icons.message_rounded), label: 'Mensajes'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_rounded), label: 'Configuración'),
          ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const RegisterContact()))
                .then((newContact) {
              if (newContact != null) {
                setState(() {
                  contactos.add(newContact);
                  messageResponse(
                      context, newContact.name + " a sido guardado");
                });
              }
            });
          },
          tooltip: "Agregar Contacto",
          backgroundColor: const Color.fromARGB(255, 185, 225, 246),
          child: const Icon(Icons.add)),
    );
  }

  removeContact(BuildContext context, Contacto contacto) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Eliminar Contacto"),
        content:
            Text("¿Está seguro de que desea eliminar a " + contacto.name + "?"),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                contactos.remove(contacto);
              });
              Navigator.pop(context);
            },
            child: const Text(
              "Eliminar",
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancelar", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}

class Contacto {
  var name;
  var surname;
  var phone;

  Contacto({this.name, this.surname, this.phone});
}
