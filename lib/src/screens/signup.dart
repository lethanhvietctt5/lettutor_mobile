import 'package:flutter/material.dart';
import 'package:lettutor_mobile/src/screens/login/login.dart';
import 'package:lettutor_mobile/src/widgets/button_expand.dart';
import 'package:lettutor_mobile/src/widgets/invalid_message.dart';
import 'package:lettutor_mobile/src/widgets/text_input.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool? _emailError;
  bool? _passwordError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 80),
                  child: SizedBox(
                    width: 250,
                    child: Image.asset("asset/img/logo.png"),
                  ),
                ),
                InputTextWithTitle(
                  title: "Email",
                  hintText: "abc@gmail.com",
                  secured: false,
                  padding: const EdgeInsets.all(8.0),
                  controller: _emailController,
                ),
                InvalidMessage(padding: const EdgeInsets.all(8), message: "* Invalid email", isError: _emailError),
                InputTextWithTitle(
                  title: "Password",
                  hintText: "**************",
                  secured: true,
                  padding: const EdgeInsets.all(8.0),
                  controller: _passwordController,
                ),
                InvalidMessage(padding: const EdgeInsets.all(8), message: "* Invalid password", isError: _passwordError),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            const Text("Already have an account? "),
                            InkWell(
                              child: const Text("Login",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  )),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                              },
                            )
                          ],
                        ),
                      ],
                    )),
                ButtonFullWidth(
                    padding: const EdgeInsets.all(8.0),
                    text: "Sign up",
                    backgroundColor: const Color(0xff007CFF),
                    onPress: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
