import 'dart:io';

import 'package:flutter/material.dart';
import '../widgets/loading_modal_widget.dart';
import 'package:image_picker/image_picker.dart';

final TextEditingController _nombreController = TextEditingController();
final TextEditingController _txtemailController = TextEditingController();
final TextEditingController _txtpassController = TextEditingController();
final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isLoading = false;
  File? _image;

  Future<void> _showPickImageDialog() async {
    final ImagePicker _picker = ImagePicker();
    final List<Widget> actions = [];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Seleccionar imagen'),
          children: actions,
        );
      },
    );
    actions.add(
      ListTile(
        leading: const Icon(Icons.photo_camera),
        title: const Text('Tomar foto'),
        onTap: () async {
          final XFile? image = await _picker.pickImage(
            source: ImageSource.camera,
            imageQuality: 50,
          );
          Navigator.pop(context);
          if (image != null) {
            setState(() {
              _image = File(image.path);
            });
          }
        },
      ),
    );

    actions.add(
      ListTile(
        leading: const Icon(Icons.photo_library),
        title: const Text('Seleccionar de galería'),
        onTap: () async {
          final XFile? image = await _picker.pickImage(
            source: ImageSource.gallery,
            imageQuality: 50,
          );
          Navigator.pop(context);
          if (image != null) {
            setState(() {
              _image = File(image.path);
            });
          }
        },
      ),
    );
  }

  final spaceHorizontal = const SizedBox(
    height: 10,
  );
  final txtEmail = TextFormField(
    controller: _txtemailController,
    decoration: const InputDecoration(
        label: Text('Email User'), border: OutlineInputBorder()),
  );
  final txtNombre = TextFormField(
    controller: _nombreController,
    decoration: const InputDecoration(
        label: Text('Full Name'), border: OutlineInputBorder()),
  );
  final txtPass = TextFormField(
    controller: _txtpassController,
    obscureText: true,
    decoration: const InputDecoration(
        label: Text('Password User'), border: OutlineInputBorder()),
  );

  AlertDialog createAlertDialog(String message) {
    return AlertDialog(
      title: const Text('Alert'),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }

  bool validateData() {
    bool valid = true;
    if (_nombreController.text == '' ||
        _txtemailController.text == '' ||
        _txtpassController.text == '') {
      valid = false;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return createAlertDialog('Missing data');
        },
      );
    }
    if (!(emailRegex.hasMatch(_txtemailController.text))) {
      valid = false;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return createAlertDialog('Email is wrong');
        },
      );
    }
    return valid;
  }

  @override
  Widget build(BuildContext context) {
    final imgUser = Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              width: 2, color: Theme.of(context).colorScheme.primary)),
      child: GestureDetector(
        onTap: _showPickImageDialog,
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: _image != null
                  ? FileImage(File(_image!.path.toString()))
                      as ImageProvider<Object>
                  : const AssetImage('assets/user.jpg'),
            ),
          ),
          child:
              _image == null ? const Icon(Icons.add_a_photo, size: 50) : null,
        ),
      ),
    );

    final lblRegister = Text(
      'Registro',
      style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary),
    );
    
    final btnSignUp = SizedBox(
      width: 200,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: ElevatedButton(
            onPressed: () {
              if (validateData()) Navigator.pushNamed(context, '/dash');
            },
            child: const Text(
              'Sign Up',
              style: TextStyle(fontSize: 20),
            )),
      ),
    );

    final txtLogin = Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          child: const Text(
            'Log in',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          )),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  opacity: .5,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/fondo.jpg'))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Stack(alignment: Alignment.topCenter, children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                imgUser,
                spaceHorizontal,
                lblRegister,
                spaceHorizontal,
                txtNombre,
                spaceHorizontal,
                txtEmail,
                spaceHorizontal,
                txtPass,
                spaceHorizontal,
                btnSignUp,
                spaceHorizontal,
                txtLogin
              ])
            ]),
          ),
        ),
        isLoading ? const LoadingModalWidget() : Container()
      ]),
    );
  }
}
