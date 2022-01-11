import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/global_state/app_provider.dart';
import 'package:lettutor_mobile/src/global_state/auth_provider.dart';
import 'package:lettutor_mobile/src/screens/setting_page/change_password/input_password.dart';
import 'package:lettutor_mobile/src/services/user_service.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:lettutor_mobile/src/routes/route.dart' as routes;

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChagePasswordPageState createState() => _ChagePasswordPageState();
}

class _ChagePasswordPageState extends State<ChangePasswordPage> {
  final passwordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final lang = Provider.of<AppProvider>(context).language;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 20,
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey[800]),
        title: Container(
          margin: const EdgeInsets.only(left: 10),
          child: Text(
            lang.changePassword,
            style: TextStyle(color: Colors.grey[800]),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InputPassword(controller: passwordController, title: lang.password),
              InputPassword(controller: newPasswordController, title: lang.newPassword),
              InputPassword(controller: confirmPasswordController, title: lang.confirmNewPassword),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: SvgPicture.asset(
                            "asset/svg/ic_password2.svg",
                            color: Colors.white,
                            width: 20,
                          ),
                        ),
                        Text(lang.changePassword, style: const TextStyle(fontSize: 17)),
                      ],
                    ),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                  onPressed: () async {
                    if (passwordController.text.length < 6 ||
                        newPasswordController.text.length < 6 ||
                        confirmPasswordController.text.length < 6) {
                      showTopSnackBar(
                        context,
                        CustomSnackBar.error(message: lang.passwordAtLeast),
                        showOutAnimationDuration: const Duration(milliseconds: 1000),
                        displayDuration: const Duration(microseconds: 4000),
                      );
                    } else if (newPasswordController.text != confirmPasswordController.text) {
                      showTopSnackBar(
                        context,
                        CustomSnackBar.error(message: lang.errPasswordMismatch),
                        showOutAnimationDuration: const Duration(milliseconds: 1000),
                        displayDuration: const Duration(microseconds: 4000),
                      );
                    } else {
                      try {
                        final res = await UserService.changePassword(
                            authProvider.tokens!.access.token, passwordController.text, newPasswordController.text);
                        if (res) {
                          showTopSnackBar(
                            context,
                            CustomSnackBar.success(
                              message: lang.changePasswordSuccess,
                              backgroundColor: Colors.green,
                            ),
                            showOutAnimationDuration: const Duration(milliseconds: 1000),
                            displayDuration: const Duration(microseconds: 4000),
                          );
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            routes.loginPage,
                            (Route<dynamic> route) => false,
                          );
                        }
                      } catch (e) {
                        showTopSnackBar(
                          context,
                          CustomSnackBar.error(message: e.toString()),
                          showOutAnimationDuration: const Duration(milliseconds: 1000),
                          displayDuration: const Duration(microseconds: 4000),
                        );
                      }
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
