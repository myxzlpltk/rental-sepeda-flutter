import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/commons/utils.dart';
import 'package:rental_sepeda_flutter/commons/validators.dart';
import 'package:rental_sepeda_flutter/components/screen_template.dart';
import 'package:rental_sepeda_flutter/components/text_form_field.dart';
import 'package:rental_sepeda_flutter/providers/app_provider.dart';
import 'package:rental_sepeda_flutter/providers/dashboard/profile_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    ScrollController scroll = ScrollController();
    FocusNode focus1 = FocusNode();
    focus1.addListener(() {
      if (focus1.hasFocus) {
        scroll.jumpTo(20);
      } else {
        scroll.jumpTo(0);
      }
    });
    FocusNode focus2 = FocusNode();
    focus2.addListener(() {
      if (focus2.hasFocus) {
        scroll.jumpTo(100);
      } else {
        scroll.jumpTo(0);
      }
    });
    FocusNode focus3 = FocusNode();
    focus3.addListener(() {
      if (focus3.hasFocus) {
        scroll.jumpTo(180);
      } else {
        scroll.jumpTo(0);
      }
    });

    return ChangeNotifierProvider<ProfileProvider>(
      create: (context) => ProfileProvider(
        context,
        Provider.of<AppProvider>(context, listen: false).user!,
      ),
      builder: (context, _) => ScreenTemplate(
        controller: scroll,
        title: "Profil Saya",
        children: <Widget>[
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Consumer<ProfileProvider>(
                      builder: (context, state, _) => CircleAvatar(
                        radius: 45,
                        backgroundImage: state.image != null
                            ? FileImage(state.image!)
                            : state.user.photoURL.isNotEmpty
                                ? NetworkImage(state.user.photoURL)
                                : AssetImage("assets/image/profile_pict.jpg")
                                    as ImageProvider,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        padding: EdgeInsets.all(4),
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: greenColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: whiteColor, width: 3),
                        ),
                        child: Icon(Icons.edit, size: 16),
                      ),
                      onTap: () => pickImage(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Form(
            key: formKey,
            child: Column(
              children: [
                Consumer<ProfileProvider>(
                  builder: (context, state, _) => CustomTextFormField2(
                    focusNode: focus1,
                    labelText: "Nama Lengkap",
                    hintText: "Ahmad Budiman",
                    initialValue: state.user.name,
                    enabled: true,
                    textInputAction: TextInputAction.next,
                    validator: Validator.name,
                    onChanged: (value) => state.name = value,
                  ),
                ),
                Consumer<ProfileProvider>(
                  builder: (context, state, _) => CustomTextFormField2(
                    focusNode: focus2,
                    labelText: "Nomor HP",
                    hintText: "+62",
                    initialValue: phoneNumberMask.maskText(
                      state.user.phoneNumber,
                    ),
                    enabled: true,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [phoneNumberMask],
                    onChanged: (value) =>
                        state.phoneNumber = phoneNumberMask.unmaskText(value),
                  ),
                ),
                Consumer<ProfileProvider>(
                  builder: (context, state, _) => CustomTextFormField2(
                    focusNode: focus3,
                    labelText: "Asal Kota",
                    hintText: "Malang",
                    enabled: true,
                    initialValue: state.user.city,
                    onChanged: (value) => state.city = value,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 200),
        ],
      ),
    );
  }

  void getImage(BuildContext context, ImageSource media) async {
    final xImg = await ImagePicker().pickImage(source: media);

    if (xImg != null) {
      final img = await ImageCropper.cropImage(
        sourcePath: xImg.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        maxWidth: 500,
        maxHeight: 500,
      );

      if (img != null) {
        Provider.of<ProfileProvider>(context, listen: false).image =
            File(img.path);
      }
    }
  }

  void pickImage(BuildContext originalContext) {
    showDialog(
      context: originalContext,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Text("Silahkan pilih media"),
        content: SizedBox(
          height: MediaQuery.of(context).size.height / 6,
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  getImage(originalContext, ImageSource.gallery);
                },
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
                child: Row(
                  children: const [
                    Icon(Icons.image),
                    SizedBox(width: 5),
                    Text("Galeri"),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  getImage(originalContext, ImageSource.camera);
                },
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
                child: Row(
                  children: const [
                    Icon(Icons.camera),
                    SizedBox(width: 5),
                    Text("Kamera"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
