import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterForm(),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(labelText: 'Password'),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              // Tambahkan logika untuk tombol registrasi di sini
            },
            child: Text('Registrasi'),
          ),
        ],
      ),
    );
  }
}
