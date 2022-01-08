import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/models/user_model/tokens_model.dart';
import 'package:lettutor_mobile/src/models/user_model/user_model.dart';
import 'package:lettutor_mobile/src/provider/app_provider.dart';
import 'package:lettutor_mobile/src/provider/auth_provider.dart';
import 'package:lettutor_mobile/src/screens/login_page/login_with.dart';
import 'package:lettutor_mobile/src/services/auth_service.dart';
import 'package:lettutor_mobile/src/services/user_service.dart';
import 'package:lettutor_mobile/src/widgets/button_expand.dart';
import 'package:provider/provider.dart';
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
    final authProvider = Provider.of<AuthProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);

    _emailController.text = "student@lettutor.com";
    _passwordController.text = "123456";

    callback(User user, Tokens tokens) async {
      authProvider.logIn(user, tokens);
      final allTopics = await UserService.fetchAllLearningTopic(authProvider.tokens!.access.token);
      final allTestPreparation = await UserService.fetchAllTestPreparation(authProvider.tokens!.access.token);
      appProvider.load(allTopics, allTestPreparation);
      Navigator.pushNamedAndRemoveUntil(context, routes.homePage, (Route<dynamic> route) => false);
    }

    void handleLogin() async {
      try {
        await AuthService.loginByEmailAndPassword(_emailController.text, _passwordController.text, callback);
      } catch (e) {
        showTopSnackBar(context, CustomSnackBar.error(message: "Login failed! ${e.toString()}"),
            showOutAnimationDuration: const Duration(milliseconds: 1000),
            displayDuration: const Duration(microseconds: 4000));
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
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
                    child: SizedBox(width: 250, child: Image.asset("asset/img/logo.png"))),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                      TextField(
                        style: TextStyle(fontSize: 15, color: Colors.grey[900]),
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            prefixIcon: Container(
                              padding: const EdgeInsets.all(13),
                              child: SvgPicture.asset("asset/svg/ic_email.svg", color: Colors.grey[600]),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            hintText: "abc@gmail.com"),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
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
                              child: SvgPicture.asset("asset/svg/ic_password.svg", color: Colors.grey[600]),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            hintText: "**************"),
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
                            const Text("Not a member yet? ", style: TextStyle(fontSize: 12)),
                            GestureDetector(
                                child: const Text("Sign up", style: TextStyle(color: Colors.blue, fontSize: 12)),
                                onTap: () {
                                  Navigator.popAndPushNamed(context, routes.registerPage);
                                })
                          ],
                        ),
                        GestureDetector(
                            child: const Text("Forgot password?", style: TextStyle(color: Colors.blue, fontSize: 12)),
                            onTap: () {
                              Navigator.popAndPushNamed(context, routes.forgotPasswordPage);
                            })
                      ],
                    )),
                ButtonFullWidth(
                    padding: const EdgeInsets.all(8.0),
                    text: "Sign in",
                    backgroundColor: const Color(0xff007CFF),
                    onPress: handleLogin),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [Text("Or continue with")]),
                ),
                LoginWith(callback: callback),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
