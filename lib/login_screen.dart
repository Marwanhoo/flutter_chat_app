import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/home_screen.dart';
import 'package:flutter_chat_app/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? email;
    String? password;
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        toolbarHeight: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              spacing: 15,
              children: [
                //const LogoWidgetWithText(),
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/125823028?v=4",
                  ),
                ),
                Text(
                  "Login",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Text(
                  "Marwanhoo",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "Email Address",
                    hintStyle: const TextStyle(color: Colors.black),
                    prefixIcon: const Icon(
                      Icons.email,
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "Password",
                    hintStyle: const TextStyle(color: Colors.black),
                    prefixIcon: const Icon(
                      Icons.password,
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  onChanged: (value) {
                    password = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        // Show loading dialog
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) => const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        );
                        // Perform registration
                        UserCredential auth = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: "$email",
                          password: "$password",
                        );
                        debugPrint("=====================\n");
                        debugPrint("$auth");

                        // Show success message
                        if (context.mounted) {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (_) => HomeScreen()),
                                (Route<dynamic> route) => false, // Remove all routes
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Login Successful"),
                            ),
                          );
                        }
                      } catch (e) {
                        debugPrint("$e");
                        // Show error message
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("$e"),
                            ),
                          );
                        }
                      } finally {
                        // Hide loading dialog
                        if (Navigator.of(context).canPop()) {
                          Navigator.of(context).pop();
                        }
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please enter some text"),
                        ),
                      );
                    }
                  },
                  child: Text("Login"),
                ),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => RegisterScreen()));
                  },
                  child: Text("Register"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
