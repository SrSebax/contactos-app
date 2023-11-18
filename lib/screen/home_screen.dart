import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String _title;
  const MyHomePage(this._title, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  List<Contacto> contactos = [
    Contacto(name: 'Sebas', lastname: 'Londoño', phone: '302 4247369'),
    Contacto(name: 'Andres', lastname: 'Londoño', phone: '302 4247369'),
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
                // Manejar el evento de toque
              },
              onLongPress: () {
                // Manejar el evento de presión larga
              },
              title: Text(
                '${contactos[index].name} ${contactos[index].lastname}',
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
        onPressed: () {},
        tooltip: "Agregar Contacto",
        backgroundColor: const Color.fromARGB(255, 185, 225, 246),
        child: const Icon(Icons.add)     ),
    );
  }
}

class Contacto {
  var name;
  var lastname;
  var phone;

  Contacto({this.name, this.lastname, this.phone});
}
