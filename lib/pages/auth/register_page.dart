import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/commons/routes.dart';
import 'package:rental_sepeda_flutter/commons/validators.dart';
import 'package:rental_sepeda_flutter/components/custom_gradient_button.dart';
import 'package:rental_sepeda_flutter/components/text_form_field.dart';
import 'package:rental_sepeda_flutter/providers/app_provider.dart';
import 'package:rental_sepeda_flutter/services/auth_services.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier(false);
  final ValueNotifier<bool> _isProcessing = ValueNotifier(false);
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  String _email = "";
  String _password = "";

  void signUp() async {
    if (_formKey.currentState!.validate()) {
      _isProcessing.value = true;
      SignInSignUpResult result =
          await AuthServices.signUp(_name, _email, _password);

      if (result.user == null) {
        _isProcessing.value = false;
        Fluttertoast.showToast(msg: result.message!);
      } else {
        _isProcessing.value = true;
        Provider.of<AppProvider>(context, listen: false).user = result.user;

        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacementNamed(context, Routes.dashboard);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/login.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0x99000000), Color(0x33FFFFFF)],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Text(
                        "Sudah punya akun?",
                        style: TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, Routes.login);
                        },
                        child: Text(
                          "Masuk",
                          style: TextStyle(
                            color: greenColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Form(
                    key: _formKey,
                    child: AutofillGroup(
                      child: Column(
                        children: <Widget>[
                          CustomTextFormField(
                            hintText: "Masukkan nama lengkap",
                            labelText: "Nama lengkap",
                            textInputAction: TextInputAction.next,
                            autofillHints: const [AutofillHints.name],
                            validator: Validator.nameValidator,
                            onChanged: (value) => _name = value,
                          ),
                          SizedBox(height: 16),
                          CustomTextFormField(
                            hintText: "Masukkan alamat email",
                            labelText: "Email",
                            textInputAction: TextInputAction.next,
                            autofillHints: const [AutofillHints.email],
                            validator: Validator.emailValidator,
                            onChanged: (value) => _email = value,
                          ),
                          SizedBox(height: 16),
                          ValueListenableBuilder<bool>(
                            valueListenable: _isPasswordVisible,
                            builder: (context, value, _) => CustomTextFormField(
                              hintText: "Masukkan kata sandi",
                              labelText: "Kata sandi",
                              obscureText: !value,
                              keyboardType: TextInputType.visiblePassword,
                              autofillHints: const [AutofillHints.password],
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  _isPasswordVisible.value = !value;
                                },
                                child: value
                                    ? Icon(Icons.visibility_off, size: 19)
                                    : Icon(Icons.visibility, size: 19),
                              ),
                              validator: Validator.passwordValidator,
                              onChanged: (value) => _password = value,
                            ),
                          ),
                          SizedBox(height: 20),
                          ValueListenableBuilder<bool>(
                            valueListenable: _isProcessing,
                            builder: (context, value, _) =>
                                CustomGradientButton(
                              text: Text(
                                "Mendaftar",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              width: MediaQuery.of(context).size.width - 48,
                              height: 30,
                              onPressed: value ? null : signUp,
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
