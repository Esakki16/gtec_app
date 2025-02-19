import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final userNameController = TextEditingController();
  final roleController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firebaseAuth = FirebaseAuth.instance;

  void signUp(String email, String password) async {
    try {
      var userCred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      print("User created Succesfully");
      print(userCred.user?.email);
      print(userCred.user?.uid);
    } catch (e) {
      print("Error Occured" + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 138, 217, 253),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 75),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      "Hello",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Text(
                    "there",
                    style: TextStyle(fontSize: 30, color: Colors.blue),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 55.0),
                height: 55,
                width: 380,
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Name",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter valid name";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                height: 55,
                width: 380,
                child: TextFormField(
                  controller: userNameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "User Name",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter valid username";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                height: 55,
                width: 380,
                child: TextFormField(
                  controller: roleController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Role",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter valid Role";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                height: 55,
                width: 380,
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Email",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter valid email";
                    } else if (!value.contains("@")) {
                      return "Please provide valid email format";
                    } else if (!value.contains(".com")) {
                      return "Please provide valid email with .com of suffix";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                height: 55,
                width: 380,
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Password",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter valid password";
                    } else if (value.length <= 8) {
                      return "Password must be 8 character lenght";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: SizedBox(
                  height: 55,
                  width: 380,
                  child: ElevatedButton(
                    onPressed: () async {
                      signUp(emailController.text, passwordController.text);

                      // await Provider.of<UserProvider>(context, listen: false)
                      //     .signUp(
                      //         nameTextController.text,
                      //         usernameTextController.text,
                      //         roleController.text,
                      //         emailTextController.text,
                      //         passwordTextController.text,
                      //         context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 22, 94, 24),
                    ),
                    child: const Text(
                      "Signup",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "Lato"),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Back",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
