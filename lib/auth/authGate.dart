// import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
// import 'package:firebase_ui_auth/firebase_ui_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:mygebeya/screens/home/home.dart';
// import 'package:mygebeya/screens/login/login.dart';

// class AuthGate extends StatelessWidget {
//   const AuthGate({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return Login(
//             providers: [
//               EmailAuthProvider(),
//             ],
//           );
//         }

//         return const Home();
//       },
//     );
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mygebeya/screens/home/home.dart';
import 'package:mygebeya/screens/login/login.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    Stream<User?> authStateChanges = _firebaseAuth.authStateChanges();
    return StreamBuilder(
      stream: authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Home();
        } else {
          return const Login();
        }
      },
    );
  }
}
