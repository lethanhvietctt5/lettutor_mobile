import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_mobile/src/screens/home.dart';
import 'package:lettutor_mobile/src/widgets/button_expand.dart';
import 'package:lettutor_mobile/src/widgets/text_input.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool? _emailError;
  bool? _passwordError;

  @override
  Widget build(BuildContext context) {
    print(_emailError);
    return Scaffold(
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
                Container(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        _emailError != null && _emailError == true
                            ? "* Invalid email"
                            : "",
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                InputTextWithTitle(
                  title: "Password",
                  hintText: "**************",
                  secured: true,
                  padding: const EdgeInsets.all(8.0),
                  controller: _passwordController,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        _passwordError != null && _passwordError == true
                            ? "* Invalid password"
                            : "",
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const <Widget>[
                            Text("Not a member yet? "),
                            Text("Sign up",
                                style: TextStyle(
                                  color: Colors.blue,
                                ))
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
                      if (_emailController.text.length < 8) {
                        setState(() {
                          _emailError = true;
                        });
                        if (_passwordController.text.length < 8) {
                          setState(() {
                            _passwordError = true;
                          });
                        }
                      } else if (_passwordController.text.length < 8) {
                        setState(() {
                          _passwordError = true;
                        });
                      } else {
                        setState(() {
                          _emailError = null;
                          _passwordError = null;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      }
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Text("Or continue with")],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: SvgPicture.asset(
                          "asset/svg/ic_facebook.svg",
                          width: 30,
                          height: 30,
                          color: const Color(0xff007CFF),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(
                                side: BorderSide(
                                    width: 1, color: Color(0xff007CFF))),
                            padding: const EdgeInsets.all(5),
                            primary: Colors.white),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: SvgPicture.asset(
                          "asset/svg/ic_google.svg",
                          width: 30,
                          height: 30,
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(
                                side: BorderSide(
                                    width: 1, color: Color(0xff007CFF))),
                            padding: const EdgeInsets.all(5),
                            primary: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
