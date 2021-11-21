import 'package:form_field_validator/form_field_validator.dart';

class Validator {
  Validator._();

  static final MultiValidator nameValidator = MultiValidator([
    RequiredValidator(errorText: "Kolom nama wajib diisi"),
    MinLengthValidator(6, errorText: "Minimal panjang name 6 karakter"),
    MaxLengthValidator(255, errorText: "Maksimal panjang name 255 karakter"),
  ]);
  static final MultiValidator emailValidator = MultiValidator([
    RequiredValidator(errorText: "Kolom email wajib diisi"),
    EmailValidator(errorText: "Email tidak valid"),
  ]);
  static final MultiValidator passwordValidator = MultiValidator([
    RequiredValidator(errorText: "Kolom kata sandi wajib diisi"),
    MinLengthValidator(8, errorText: "Minimal panjang name 8 karakter"),
  ]);
}
