import "package:flutter/material.dart";

import "../models/users.dart";
import "../widgets/custom_app_bar.dart";
import "TasksPage.dart";
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool showPassword = false;
  IconData icon = Icons.visibility_off;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: CustomAppBar(
          title: "Sign Up",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Your Email';
                    }
                    return null;
                  },
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.5))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.black, width: 2)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Your Password';
                    }
                    return null;
                  },
                  controller: passwordController,
                  obscureText: !showPassword,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                          if (showPassword) {
                            icon = Icons.visibility;
                          } else {
                            icon = Icons.visibility_off;
                          }
                        });
                      },
                      icon: Icon(icon),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.5))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.black, width: 2)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (!checkUser(
                          emailController.text, passwordController.text)) {
                        users.add(UsersData(email: emailController.text, password: passwordController.text));
                        SnackBar snackBar = const SnackBar(
                          content: Text('User Register Successfully'),
                          backgroundColor: Colors.green,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const TasksPage(), // Pass the email to home screen
                          ),
                        );
                      } else {
                        SnackBar snackBar = const SnackBar(
                          content: Text('Registeration Failed'),
                          backgroundColor: Colors.red,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }

                      print('Email is valid');
                    } else {
                      print('Email is invalid');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(width, height * 0.06),
                    backgroundColor: Colors.black.withOpacity(0.5),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Login'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account ?"),
                    TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      }, child: Text("Login", style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontWeight: FontWeight.bold
                    ),),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
