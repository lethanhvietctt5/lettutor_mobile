import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          "Email",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),
                        ),
                      ),
                      TextField(
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              hintText: "abc@gmail.com")),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),
                        ),
                      ),
                      TextField(
                          obscureText: true,
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              hintText: "****************")),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          "Sign in",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xff007CFF)),
                      onPressed: () {},
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Text("Or continue with")],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
