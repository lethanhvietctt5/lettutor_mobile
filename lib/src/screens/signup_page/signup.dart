import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/widgets/button_expand.dart';
import 'package:lettutor_mobile/src/widgets/text_input.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repasswordControler = TextEditingController();

  // bool? _emailError;
  // bool? _passwordError;

  @override
  Widget build(BuildContext context) {
    void handleSignUp() {
      if (_emailController.text.isEmpty || _passwordController.text.isEmpty || _repasswordControler.text.isEmpty) {
        showTopSnackBar(
          context,
          const CustomSnackBar.error(message: "Signup failed! Please enter all fields."),
        );
      } else if (_passwordController.text != _repasswordControler.text) {
        showTopSnackBar(
          context,
          const CustomSnackBar.error(message: "Signup failed! Passwords do not match."),
        );
      } else {
        Navigator.popAndPushNamed(context, '/login');
      }
    }

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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Email",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                        ),
                      ),
                      TextField(
                        style: TextStyle(fontSize: 15, color: Colors.grey[900]),
                        controller: _emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          prefixIcon: Container(
                            padding: const EdgeInsets.all(13),
                            child: SvgPicture.asset(
                              "asset/svg/ic_email.svg",
                              color: Colors.grey[600],
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          hintText: "abc@gmail.com",
                        ),
                      ),
                    ],
                  ),
                ),
                //InvalidMessage(padding: const EdgeInsets.all(8), message: "* Invalid email", isError: _emailError),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Password",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                        ),
                      ),
                      TextField(
                        style: TextStyle(fontSize: 15, color: Colors.grey[900]),
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          prefixIcon: Container(
                            padding: const EdgeInsets.all(13),
                            child: SvgPicture.asset(
                              "asset/svg/ic_password.svg",
                              color: Colors.grey[600],
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          hintText: "**************",
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Re-password",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                        ),
                      ),
                      TextField(
                        style: TextStyle(fontSize: 15, color: Colors.grey[900]),
                        controller: _repasswordControler,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          prefixIcon: Container(
                            padding: const EdgeInsets.all(13),
                            child: SvgPicture.asset(
                              "asset/svg/ic_password.svg",
                              color: Colors.grey[600],
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          hintText: "**************",
                        ),
                      ),
                    ],
                  ),
                ),
                //InvalidMessage(padding: const EdgeInsets.all(8), message: "* Invalid password", isError: _passwordError),
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
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                              Navigator.popAndPushNamed(context, '/login');
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                ButtonFullWidth(
                  padding: const EdgeInsets.all(8.0),
                  text: "Sign up",
                  backgroundColor: const Color(0xff007CFF),
                  onPress: handleSignUp,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
