import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/commons/routes.dart';
import 'package:rental_sepeda_flutter/commons/validators.dart';
import 'package:rental_sepeda_flutter/components/custom_gradient_button.dart';
import 'package:rental_sepeda_flutter/components/text_form_field.dart';
import 'package:rental_sepeda_flutter/providers/auth/register_provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterProvider>(
      create: (context) => RegisterProvider(),
      builder: (context, _) => Scaffold(
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
                            Navigator.pushReplacementNamed(
                                context, Routes.login);
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
                      key: Provider.of<RegisterProvider>(context, listen: false)
                          .formKey,
                      child: AutofillGroup(
                        child: Column(
                          children: <Widget>[
                            CustomTextFormField(
                              hintText: "Masukkan nama lengkap",
                              labelText: "Nama lengkap",
                              textInputAction: TextInputAction.next,
                              autofillHints: const [AutofillHints.name],
                              validator: Validator.nameValidator,
                              onChanged: (value) =>
                                  Provider.of<RegisterProvider>(context,
                                          listen: false)
                                      .name = value,
                            ),
                            SizedBox(height: 16),
                            CustomTextFormField(
                              hintText: "Masukkan alamat email",
                              labelText: "Email",
                              textInputAction: TextInputAction.next,
                              autofillHints: const [AutofillHints.email],
                              validator: Validator.emailValidator,
                              onChanged: (value) =>
                                  Provider.of<RegisterProvider>(context,
                                          listen: false)
                                      .email = value,
                            ),
                            SizedBox(height: 16),
                            Consumer<RegisterProvider>(
                              builder: (context, state, _) =>
                                  CustomTextFormField(
                                hintText: "Masukkan kata sandi",
                                labelText: "Kata sandi",
                                obscureText: !state.isPasswordVisible,
                                keyboardType: TextInputType.visiblePassword,
                                autofillHints: const [AutofillHints.password],
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    state.isPasswordVisible =
                                        !state.isPasswordVisible;
                                  },
                                  child: state.isPasswordVisible
                                      ? Icon(Icons.visibility_off, size: 19)
                                      : Icon(Icons.visibility, size: 19),
                                ),
                                validator: Validator.passwordValidator,
                                onChanged: (value) => state.password = value,
                              ),
                            ),
                            SizedBox(height: 20),
                            Consumer<RegisterProvider>(
                              builder: (context, state, _) =>
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
                                onPressed: state.isProcessing
                                    ? null
                                    : () {
                                        if (state.formKey.currentState!
                                            .validate()) {
                                          state.signUp(context);
                                        }
                                      },
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
      ),
    );
  }
}
