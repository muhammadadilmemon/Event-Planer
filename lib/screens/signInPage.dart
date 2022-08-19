import 'package:eventplaner/constant/inputfields.dart';
import 'package:eventplaner/screens/EventTypes/weddings.dart';
import 'package:eventplaner/screens/homePage.dart';
import 'package:eventplaner/screens/signupPage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../constant/TextField.dart';
import '../constant/Utils.dart';
import '../constant/constants.dart';

import '../rootwidget.dart';
import '../services/authentication_methods.dart';
import 'forgotpassPage.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);
  TextEditingController eController = TextEditingController();
  TextEditingController pController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/undraw_Login_re_4vu2.png'),
              Center(
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: inputfields(
                  hint_text: "Enter Email",
                  controller: eController,
                  field_icon: Icons.email_outlined,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: inputfields(
                  hint_text: "Enter Password",
                  controller: pController,
                  field_icon: Icons.password_outlined,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const rootPage(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Container(
                    width: 250,
                    decoration: BoxDecoration(
                      color: Constants.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: Center(
                        child: GestureDetector(
                      onTap: () async {
                        //  authentication_methods
                        // Future<String> output="something";
                        String output =
                            await authentication_methods.SignInUsers(
                          email: eController.text,
                          password: pController.text,
                        );

                        //    if (output=="SignIn Successfully") {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => rootPage()));
                        // } else {
                        //   Utils.showSnackBar(context: context, content: output.toString());
                        // }

                        if (output == "SignIn Successfully") {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => rootPage()));
                        } else {
                          Utils.showSnackBar(
                              context: context, content: output.toString());
                        }

                        // print(output);
                        //  Utils.showSnackBar(context: context, content: output.toString());
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const ForgotPassword(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'Forgot Password? ',
                        style: TextStyle(
                          color: Constants.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Reset Here',
                        style: TextStyle(
                          color: Constants.primaryColor,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('OR'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: Constants.primaryColor),
                    borderRadius: BorderRadius.circular(10)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 30,
                      child: Image.asset('assets/google.png'),
                    ),
                    Text(
                      'Sign In with Google',
                      style: TextStyle(
                        color: Constants.blackColor,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: SignUp(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'New Here ',
                        style: TextStyle(
                          color: Constants.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Register',
                        style: TextStyle(
                          color: Constants.primaryColor,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
