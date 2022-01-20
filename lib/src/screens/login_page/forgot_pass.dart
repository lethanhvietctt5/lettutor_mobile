import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/global_state/app_provider.dart';
import 'package:lettutor_mobile/src/services/auth_service.dart';
import 'package:lettutor_mobile/src/widgets/button_expand.dart';
import 'package:lettutor_mobile/src/routes/route.dart' as routes;
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final lang = appProvider.language;

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
                        child: Text("Email", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[800])),
                      ),
                      TextField(
                        style: TextStyle(fontSize: 15, color: Colors.grey[900]),
                        controller: _emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          prefixIcon: Container(
                            padding: const EdgeInsets.all(13),
                            child: SvgPicture.asset("asset/svg/ic_email.svg", color: Colors.grey[600]),
                          ),
                          border: const OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(10))),
                          hintText: "abc@gmail.com",
                        ),
                      ),
                    ],
                  ),
                ),
                ButtonFullWidth(
                  padding: const EdgeInsets.all(8.0),
                  text: lang.resetPassword,
                  backgroundColor: const Color(0xff007CFF),
                  onPress: () async {
                    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailController.text)) {
                      showTopSnackBar(context, CustomSnackBar.error(message: lang.invalidEmail),
                          showOutAnimationDuration: const Duration(milliseconds: 1000), displayDuration: const Duration(microseconds: 4000));
                    } else if (_emailController.text.isNotEmpty) {
                      final bool res = await AuthService.forgotPassword(_emailController.text);
                      if (res) {
                        showTopSnackBar(
                            context,
                            CustomSnackBar.success(
                              message: lang.forgotPasswordSuccess,
                              backgroundColor: Colors.green,
                            ),
                            showOutAnimationDuration: const Duration(milliseconds: 1000),
                            displayDuration: const Duration(microseconds: 4000));
                        Navigator.popAndPushNamed(context, routes.loginPage);
                      } else {
                        showTopSnackBar(context, CustomSnackBar.error(message: lang.forgotPasswordFail),
                            showOutAnimationDuration: const Duration(milliseconds: 1000), displayDuration: const Duration(microseconds: 4000));
                      }
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Text(lang.gobackLogin, style: const TextStyle(color: Colors.blue)),
                    onTap: () {
                      Navigator.popAndPushNamed(context, routes.loginPage);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
