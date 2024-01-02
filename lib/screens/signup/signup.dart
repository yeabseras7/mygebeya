import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mygebeya/screens/login/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final String google = 'assets/icons/google.svg';
  final String facebook = 'assets/icons/facebook.svg';
  bool isLoading = false;
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Sign up",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Name",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextField(
                controller: userNameController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(132, 181, 215, 243),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Enter your name",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Email",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(132, 181, 215, 243),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Enter your email",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Password",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(132, 181, 215, 243),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Enter your password",
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 40,
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(double.infinity, 50),
                      shape: const ContinuousRectangleBorder(),
                      elevation: 10,
                      shadowColor: Colors.blue,
                      padding: const EdgeInsets.all(10),
                    ),
                    onPressed: () {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      )
                          .then((value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ),
                        );
                      }).onError((error, stackTrace) {
                        Fluttertoast.showToast(
                          msg: error.toString(),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      });
                    },
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : const Text("SIGN UP"),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Login(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.blue),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  const Text(
                    "Or signup with social account",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 233, 233, 233),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SvgPicture.asset(
                          google,
                          height: 30,
                          width: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 233, 233, 233),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SvgPicture.asset(
                          facebook,
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
