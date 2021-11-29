import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/screens/login_page/login_with.dart';
import 'package:lettutor_mobile/src/widgets/button_expand.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:lettutor_mobile/src/routes/route.dart' as routes;

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
    // final user = Provider.of<UserProvider>(context);
    void handleLogin() {
      if (_emailController.text == 'admin' && _passwordController.text == '12345678') {
        Navigator.popAndPushNamed(context, routes.homePage);
      } else {
        showTopSnackBar(
          context,
          const CustomSnackBar.error(message: "Login failed! Email or password is wrong."),
          showOutAnimationDuration: const Duration(milliseconds: 1000),
          displayDuration: const Duration(microseconds: 1000),
        );
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
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Text(
                          "Email",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: Text("*default: admin", style: TextStyle(fontSize: 12, color: Colors.grey[400])),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Text(
                          "Password",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: Text(
                          "*default: 12345678",
                          style: TextStyle(fontSize: 12, color: Colors.grey[400]),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            const Text(
                              "Not a member yet? ",
                              style: TextStyle(fontSize: 12),
                            ),
                            InkWell(
                              child: const Text("Sign up", style: TextStyle(color: Colors.blue, fontSize: 12)),
                              onTap: () {
                                Navigator.popAndPushNamed(context, routes.registerPage);
                              },
                            )
                          ],
                        ),
                        const Text("Forgot password?", style: TextStyle(color: Colors.blue, fontSize: 12))
                      ],
                    )),
                ButtonFullWidth(
                    padding: const EdgeInsets.all(8.0),
                    text: "Sign in",
                    backgroundColor: const Color(0xff007CFF),
                    onPress: handleLogin),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [Text("Or continue with")],
                  ),
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
