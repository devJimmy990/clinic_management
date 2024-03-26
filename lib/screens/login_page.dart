import 'package:flutter/material.dart';
import 'package:hospital/screens/main.dart';
import 'package:hospital/constants/strings.dart';
import 'package:hospital/models/patient.dart';
import 'package:hospital/.widgets/auth_bg.dart';
import 'package:hospital/.widgets/snakbar.dart';
import 'package:hospital/.widgets/my_text_form.dart';
import 'package:hospital/constants/auth_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Icon passwordIcon = const Icon(Icons.visibility);
  bool isPasswordHide = true;
  late Patient patient;
  showSnackBar({required String label}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(mySnakbar(label: label, context: context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: myAuthBg(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              myTextForm(
                label: kAuthEmailLabel,
                controller: kAuthEmailController,
              ),
              const SizedBox(height: 10),
              myTextForm(
                label: kAuthPasswordLabel,
                isPassword: true,
                isHide: isPasswordHide,
                passwordIcon: passwordIcon,
                controller: kAuthPasswordController,
                onIconPressed: () => setState(() {
                  isPasswordHide
                      ? passwordIcon = const Icon(Icons.visibility_off)
                      : passwordIcon = const Icon(Icons.visibility);
                  isPasswordHide = !isPasswordHide;
                }),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (isFieldsInputValid()) {
                        patient = Patient.def();
                        patient.setPersonEmail =
                            kAuthEmailController.text.trim();
                        patient.setPersonPassword =
                            kAuthPasswordController.text.trim();
                        var res = await patient.loginAccount();
                        res
                            ? goHome()
                            : showSnackBar(label: "No User With This Email");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                    ),
                    child: const Text(kAuthLoginLabel),
                  ),
                  InkWell(
                    onTap: () => Navigator.pushReplacementNamed(
                        context, kPagesNavSignup),
                    child: Text(
                      kAuthNotHaveAccountLabel,
                      style: TextStyle(
                          color: Colors.blue.shade700,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  isFieldsInputValid() {
    if (kAuthEmailController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          mySnakbar(context: context, label: kRequiredEmailLabel));
    } else if (kAuthPasswordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          mySnakbar(context: context, label: kRequiredPasswordLabel));
    } else {
      return true;
    }
    return false;
  }

  void goHome() => Navigator.pushReplacementNamed(context, kPagesNavBaseHome);
}
