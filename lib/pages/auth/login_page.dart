import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/commons/routes.dart';
import 'package:rental_sepeda_flutter/components/custom_gradient_button.dart';
import 'package:rental_sepeda_flutter/components/text_field.dart';
import 'package:rental_sepeda_flutter/services/user_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ValueNotifier<bool> _isSavePassword = ValueNotifier(false);
  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier(false);
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _usernameValidator = MultiValidator([
    RequiredValidator(errorText: "Kolom username wajib diisi"),
    MinLengthValidator(6, errorText: "Minimal panjang username 6 karakter"),
    MaxLengthValidator(25, errorText: "Maksimal panjang username 25 karakter"),
  ]);
  final _passwordValidator = MultiValidator([
    RequiredValidator(errorText: "Kolom username wajib diisi"),
    MinLengthValidator(8, errorText: "Minimal panjang username 8 karakter"),
  ]);

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
                        "New user ?",
                        style: TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.register);
                        },
                        child: Text(
                          "Sign up",
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
                            controller: _usernameController,
                            hintText: "Enter your username",
                            labelText: "Username",
                            textInputAction: TextInputAction.next,
                            autofillHints: const [AutofillHints.username],
                            validator: _usernameValidator,
                          ),
                          SizedBox(height: 16),
                          ValueListenableBuilder<bool>(
                            valueListenable: _isPasswordVisible,
                            builder: (context, value, _) => CustomTextFormField(
                              controller: _passwordController,
                              hintText: "Enter your password",
                              labelText: "Password",
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
                              validator: _passwordValidator,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 35,
                                child: ValueListenableBuilder<bool>(
                                  valueListenable: _isSavePassword,
                                  builder: (context, value, _) => Checkbox(
                                    value: value,
                                    shape: CircleBorder(),
                                    activeColor: greenColor,
                                    checkColor: whiteColor,
                                    side:
                                        BorderSide(color: whiteColor, width: 2),
                                    onChanged: (bool? value) {
                                      _isSavePassword.value = value!;
                                    },
                                  ),
                                ),
                              ),
                              Text(
                                "Save Password?",
                                style: TextStyle(
                                  color: whiteColor,
                                  fontSize: 12,
                                ),
                              ),
                              Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Forgot password",
                                  style: TextStyle(
                                    color: greenColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          CustomGradientButton(
                            text: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            width: MediaQuery.of(context).size.width - 48,
                            height: 30,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                UserServices.login(
                                  _usernameController.text,
                                  _passwordController.text,
                                ).then((value) {
                                  if (value) {
                                    Navigator.popUntil(
                                        context, (route) => route.isFirst);
                                    Navigator.pushReplacementNamed(
                                        context, Routes.main);
                                  }
                                });
                              }
                            },
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
