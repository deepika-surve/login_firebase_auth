import 'package:flutter/material.dart';

import 'helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Service service = Service();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String email = '', password = '';

  final emailformkey = GlobalKey<FormState>();
  final passformkey = GlobalKey<FormState>();

  // validateData() {
  //     if (emailformkey.currentState!.validate()) {
  //       emailformkey.currentState!.save();
  //     }
  //     if (passformkey.currentState!.validate()) {
  //       passformkey.currentState!.save();
  //     }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Form"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding:
              EdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blueGrey,
                backgroundImage: AssetImage("assets/images/image1.png"),
              ),
            ),

            Form(
              key: emailformkey,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: emailController,
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(Icons.email),
                    hintText: 'Enter Email',
                    labelText: 'Email',
                  ),
                  // validator: (email) => email!.isEmpty ? "Please Enter Email" : null,
                  //
                  // onSaved: (email1) =>email = email1!,
                ),
              ),
            ),
            Form(
              key: passformkey,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  autofocus: false,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(Icons.lock_open),
                    hintText: 'Enter Password',
                    labelText: 'Password',
                  ),
                  // validator: (password) => password!.isEmpty ? "Please Enter Password" : null,
                  //
                  // onSaved: (pass) =>password = pass!,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: 300,
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          onPressed: () {
            //validateData();
            if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty)
            {
              service.loginUser(emailController.text, passwordController.text, context);
            }
            else{
              service.error(context, "This Field is Required");
            }
          },
          child: const Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}