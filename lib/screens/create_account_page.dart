import 'package:flutter/material.dart';
import 'package:hospital/screens/main.dart';
import 'package:hospital/models/patient.dart';
import 'package:hospital/.widgets/auth_bg.dart';
import 'package:hospital/.widgets/snakbar.dart';
import 'package:hospital/constants/strings.dart';
import 'package:hospital/.widgets/my_text_form.dart';
import 'package:hospital/constants/auth_controller.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  Icon passwordIcon = const Icon(Icons.visibility);
  bool isPasswordHide = true;
  late Patient patient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: myAuthBg(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 10,
                        child: myTextForm(
                          label: kAuthFirstNameLabel,
                          controller: kAuthFirstNameController,
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 10,
                        child: myTextForm(
                          label: kAuthLastNameLabel,
                          controller: kAuthLastNameController,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  myTextForm(
                    isNumber: true,
                    label: kAuthMobileLabel,
                    controller: kAuthMobileController,
                  ),
                  const SizedBox(height: 10),
                  myTextForm(
                    label: kAuthEmailLabel,
                    controller: kAuthEmailController,
                  ),
                  const SizedBox(height: 10),
                  myTextForm(
                    isPassword: true,
                    label: kAuthPasswordLabel,
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
                              patient = Patient.add(
                                  name:
                                      "${kAuthFirstNameController.text.trim()} ${kAuthLastNameController.text.trim()}",
                                  mobile: kAuthMobileController.text.trim(),
                                  email: kAuthEmailController.text.trim(),
                                  password:
                                      kAuthPasswordController.text.trim());
                              await patient.createNewAccount();
                            }
                            if (patientSharedPrefs
                                    .getBool(kPatientPrefrsIsLogged) ==
                                true) {
                              goHome();
                            }
                          },
                          child: const Text(kAuthSignupLabel)),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () => Navigator.pushReplacementNamed(
                            context, kPagesNavLogin),
                        child: Text(
                          kAuthHaveAccountLabel,
                          style: TextStyle(
                              color: Colors.blue.shade700,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  goHome() => Navigator.pushReplacementNamed(context, kPagesNavBaseHome);

  isFieldsInputValid() {
    if (kAuthFirstNameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          mySnakbar(context: context, label: kRequiredFirstNameLabel));
    } else if (kAuthLastNameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          mySnakbar(context: context, label: kRequiredLastNameLabel));
    } else if (kAuthEmailController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          mySnakbar(context: context, label: kRequiredEmailLabel));
    } else if (kAuthPasswordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          mySnakbar(context: context, label: kRequiredPasswordLabel));
    } else if (kAuthMobileController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          mySnakbar(context: context, label: kRequiredMobileLabel));
    } else {
      return true;
    }
    return false;
  }
}
