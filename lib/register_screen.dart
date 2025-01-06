import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? email;
    String? password;
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              spacing: 15,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/125823028?v=4",
                  ),
                ),
                Text(
                  "Register",
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
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Login"),
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
                            .createUserWithEmailAndPassword(
                          email: "$email",
                          password: "$password",
                        );
                        debugPrint("=====================\n");
                        debugPrint("$auth");

                        // Show success message
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Registration Successful"),
                            ),
                          );
                          Navigator.of(context).pop();
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
                      }finally{
                        // Hide loading dialog
                        if (context.mounted) {
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
