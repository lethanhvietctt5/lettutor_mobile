import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_mobile/src/navigation.dart';
import 'package:lettutor_mobile/src/screens/signup.dart';
import 'package:lettutor_mobile/src/screens/login/login_with.dart';
import 'package:lettutor_mobile/src/widgets/button_expand.dart';
import 'package:lettutor_mobile/src/widgets/text_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                  prefixIconPath: "asset/svg/ic_email.svg",
                ),
                //InvalidMessage(padding: const EdgeInsets.all(8), message: "* Invalid email", isError: _emailError),
                InputTextWithTitle(
                  title: "Password",
                  hintText: "**************",
                  secured: true,
                  padding: const EdgeInsets.all(8.0),
                  controller: _passwordController,
                  prefixIconPath: "asset/svg/ic_password.svg",
                ),
                //InvalidMessage(padding: const EdgeInsets.all(8), message: "* Invalid password", isError: _passwordError),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            const Text("Not a member yet? "),
                            InkWell(
                              child: const Text("Sign up",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  )),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
                              },
                            )
                          ],
                        ),
                        const Text("Forgot password?",
                            style: TextStyle(
                              color: Colors.blue,
                            ))
                      ],
                    )),
                ButtonFullWidth(
                    padding: const EdgeInsets.all(8.0),
                    text: "Sign in",
                    backgroundColor: const Color(0xff007CFF),
                    onPress: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const NavigationBar()));
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Text("Or continue with")],
                ),
                const LoginWithFacebookAndGoogle()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
