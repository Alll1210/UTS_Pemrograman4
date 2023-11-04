import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ForgotPasswordForm(),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Masukkan alamat email Anda untuk mereset sandi.'),
          SizedBox(height: 20.0),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              // Tambahkan logika untuk mengirim email reset sandi di sini
            },
            child: Text('Kirim Email Reset Sandi'),
          ),
        ],
      ),
    );
  }
}
