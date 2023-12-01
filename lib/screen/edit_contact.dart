import 'package:contactos_app/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:contactos_app/screen/text_box.dart';

class EditContact extends StatefulWidget {
  final Contacto _contacto;
  const EditContact(this._contacto, {super.key});
  @override
  State<StatefulWidget> createState() => _EditContact();
}

class _EditContact extends State<EditContact> {
  late TextEditingController controllerName;
  late TextEditingController controllerSurname;
  late TextEditingController controllerPhone;

  @override
  void initState() {
    Contacto c = widget._contacto;
    controllerName = TextEditingController(text: c.name);
    controllerSurname = TextEditingController(text: c.surname);
    controllerPhone = TextEditingController(text: c.phone);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Contacto"),
      ),
      body: ListView(
        children: [
          TextBox(controllerName, "Nombre"),
          TextBox(controllerSurname, "Apellido"),
          TextBox(controllerPhone, "Celular"),
          ElevatedButton(
              onPressed: () {
                String name = controllerName.text;
                String surname = controllerSurname.text;
                String phone = controllerPhone.text;

                if (name.isNotEmpty && surname.isNotEmpty && phone.isNotEmpty) {
                  Navigator.pop(context,
                      Contacto(name: name, surname: surname, phone: phone));
                }
              },
              child: const Text("Guardar Contacto"))
        ],
      ),
    );
  }
}
