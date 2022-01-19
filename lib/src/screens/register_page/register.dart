import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/global_state/app_provider.dart';
import 'package:lettutor_mobile/src/services/auth_service.dart';
import 'package:lettutor_mobile/src/widgets/button_expand.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:lettutor_mobile/src/routes/route.dart' as routes;

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repasswordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final lang = appProvider.language;

    void handleSignUp() async {
      if (_emailController.text.isEmpty || _passwordController.text.isEmpty || _repasswordControler.text.isEmpty) {
        showTopSnackBar(
          context,
          CustomSnackBar.error(message: lang.errEnterAllFields),
          showOutAnimationDuration: const Duration(milliseconds: 1000),
          displayDuration: const Duration(microseconds: 3000),
        );
      } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailController.text)) {
        showTopSnackBar(
          context,
          CustomSnackBar.error(message: lang.invalidEmail),
          showOutAnimationDuration: const Duration(milliseconds: 1000),
          displayDuration: const Duration(microseconds: 3000),
        );
      } else if (_passwordController.text.length < 6) {
        showTopSnackBar(
          context,
          CustomSnackBar.error(message: lang.passwordTooShort),
          showOutAnimationDuration: const Duration(milliseconds: 1000),
          displayDuration: const Duration(microseconds: 3000),
        );
      } else if (_passwordController.text != _repasswordControler.text) {
        showTopSnackBar(
          context,
          CustomSnackBar.error(message: lang.errPasswordMismatch),
          showOutAnimationDuration: const Duration(milliseconds: 1000),
          displayDuration: const Duration(microseconds: 3000),
        );
      } else {
        try {
          await AuthService.registerWithEmailAndPassword(
            _emailController.text,
            _passwordController.text,
            () {
              Navigator.pushNamedAndRemoveUntil(context, routes.loginPage, (Route<dynamic> route) => false);
            },
          );
        } catch (e) {
          showTopSnackBar(
            context,
            CustomSnackBar.error(message: "Signup failed!. ${e.toString()}"),
            showOutAnimationDuration: const Duration(milliseconds: 1000),
            displayDuration: const Duration(microseconds: 4000),
          );
        }
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          lang.password,
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
                          lang.confirmPassword,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: <Widget>[
                          Text(lang.loginQuestion),
                          GestureDetector(
                            child: Text(
                              lang.signIn,
                              style: const TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                            onTap: () {
                              Navigator.popAndPushNamed(context, routes.loginPage);
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                ButtonFullWidth(
                  padding: const EdgeInsets.all(8.0),
                  text: lang.signUp,
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
