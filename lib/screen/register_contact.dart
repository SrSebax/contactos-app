import 'package:contactos_app/screen/home_screen.dart';
import 'package:contactos_app/screen/text_box.dart';
import 'package:flutter/material.dart';

class RegisterContact extends StatefulWidget {
  const RegisterContact({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterContact();
}

class _RegisterContact extends State<RegisterContact> {
  late TextEditingController controllerName;
  late TextEditingController controllerSurname;
  late TextEditingController controllerPhone;

  @override
  void initState() {
    controllerName = TextEditingController();
    controllerSurname = TextEditingController();
    controllerPhone = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrar Contactos"),
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
