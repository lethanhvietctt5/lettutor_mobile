import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lettutor_mobile/src/models/user_model/tokens_model.dart';
import 'package:lettutor_mobile/src/models/user_model/user_model.dart';
import 'package:lettutor_mobile/src/services/auth_service.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginWith extends StatefulWidget {
  const LoginWith({Key? key, required this.callback}) : super(key: key);
  final Function(User, Tokens) callback;

  @override
  _LoginWithState createState() => _LoginWithState();
}

class _LoginWithState extends State<LoginWith> {
  late GoogleSignIn _googleSignIn;

  @override
  Widget build(BuildContext context) {
    handleSignInGoogle() async {
      try {
        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
        final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

        final String? accessToken = googleAuth?.accessToken;

        if (accessToken != null) {
          try {
            await AuthService.loginWithGoogle(accessToken, widget.callback);
          } catch (e) {
            showTopSnackBar(context, CustomSnackBar.error(message: "Login failed! ${e.toString()}"),
                showOutAnimationDuration: const Duration(milliseconds: 1000),
                displayDuration: const Duration(microseconds: 4000));
          }
        }
      } catch (e) {
        //print(e);
      }
    }

    handleSingInFacebook() async {
      final LoginResult result = await FacebookAuth.instance.login();
      final credential = firebase_auth.FacebookAuthProvider.credential(result.accessToken!.token);
      await firebase_auth.FirebaseAuth.instance.signInWithCredential(credential);

      if (result.status == LoginStatus.success) {
        final String? accessToken = result.accessToken!.token;
        if (accessToken != null) {
          try {
            await AuthService.loginWithFacebook(accessToken, widget.callback);
          } catch (e) {
            showTopSnackBar(context, CustomSnackBar.error(message: "Login failed! ${e.toString()}"),
                showOutAnimationDuration: const Duration(milliseconds: 1000),
                displayDuration: const Duration(microseconds: 4000));
          }
        }
      } else {
        print(result.status);
      }
    }

    _googleSignIn = GoogleSignIn();
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                handleSingInFacebook();
              },
              child:
                  SvgPicture.asset("asset/svg/ic_facebook.svg", width: 30, height: 30, color: const Color(0xff007CFF)),
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(side: BorderSide(width: 1, color: Color(0xff007CFF))),
                  padding: const EdgeInsets.all(5),
                  primary: Colors.white)),
          ElevatedButton(
              onPressed: () {
                handleSignInGoogle();
              },
              child: SvgPicture.asset("asset/svg/ic_google.svg", width: 30, height: 30),
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(side: BorderSide(width: 1, color: Color(0xff007CFF))),
                  padding: const EdgeInsets.all(5),
                  primary: Colors.white)),
        ],
      ),
    );
  }
}
