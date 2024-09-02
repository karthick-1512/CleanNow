import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:m_app_event/account/settings.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

final _formKey = GlobalKey<FormState>();
Uint8List? _image;
File? selectedIMage;

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;

  bool isValidPhoneNumber(String phoneNumber) {
    // Regular expression for basic phone number validation
    final RegExp phoneRegex = RegExp(r'^[1-9]\d{9}$');
    return phoneRegex.hasMatch(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 2, 110),
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 237, 248, 255),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 19, 2, 110),
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 237, 248, 255),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Color.fromARGB(255, 237, 248, 255),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsPage()));
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                              ))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            showImagePickerOption(context);
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Colors.black,
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Color.fromARGB(255, 237, 248, 255),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // buildTextField("Full Name", "Dor Alex", false),
                    // buildTextField("E-mail", "alexd@gmail.com", false),
                    // buildTextField("Password", "********", true),
                    // buildTextField("Location", "TLV, Israel", false),

                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.contains(RegExp(r'\d')))
                            return 'Enter only alphabets';
                          if (value.isEmpty) return 'Enter details';
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 3),
                            labelText: 'Full Name',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 237, 248, 255)),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: 'Pradeep S',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 237, 248, 255),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: TextFormField(
                        validator: (value) {
                          if (!RegExp(r'^[1-9]\d{9}$').hasMatch(value!))
                            return 'Enter a valid 10 digit mobile number';
                          if (value.isEmpty) return 'Enter details';
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 3),
                            labelText: 'Mobile Number',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 237, 248, 255)),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: '8838909289',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 237, 248, 255),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) return 'Enter details';
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 3),
                            labelText: 'Address',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 237, 248, 255)),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: '8838909289',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 237, 248, 255),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 32.0,
                  left: 32.0,
                  right: 32.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 120,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("CANCEL",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.black)),
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      child: ElevatedButton(
                        onPressed: () {
                          _formKey.currentState!.validate();
                        },
                        child: Text(
                          "SAVE",
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black,
                          ),
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

  // Widget buildTextField(
  //     String labelText, String placeholder, bool isPasswordTextField) {
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 35.0),
  //     child: TextFormField(
  //       validator: (value) {
  //         if (value!.contains(RegExp(r'\d'))) return 'Enter only alphabets';
  //       },
  //       obscureText: isPasswordTextField ? showPassword : false,
  //       decoration: InputDecoration(
  //           suffixIcon: isPasswordTextField
  //               ? IconButton(
  //                   onPressed: () {
  //                     setState(() {
  //                       showPassword = !showPassword;
  //                     });
  //                   },
  //                   icon: Icon(
  //                     Icons.remove_red_eye,
  //                     color: Colors.grey,
  //                   ),
  //                 )
  //               : null,
  //           contentPadding: EdgeInsets.only(bottom: 3),
  //           labelText: labelText,
  //           labelStyle: TextStyle(color: Color.fromARGB(255, 237, 248, 255)),
  //           floatingLabelBehavior: FloatingLabelBehavior.always,
  //           hintText: placeholder,
  //           hintStyle: TextStyle(
  //             fontSize: 16,
  //             fontWeight: FontWeight.bold,
  //             color: Color.fromARGB(255, 237, 248, 255),
  //           )),
  //     ),
  //   );

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Color.fromARGB(255, 38, 36, 36),
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 7.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            _pickImageFromGallery();
                          },
                          child: const SizedBox(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.image,
                                  color: Color.fromARGB(255, 237, 248, 255),
                                  size: 40,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Gallery",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 237, 248, 255),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            _pickImageFromCamera();
                          },
                          child: const SizedBox(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  color: Color.fromARGB(255, 237, 248, 255),
                                  size: 40,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Camera",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 237, 248, 255),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

//Gallery
  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop(); //close the model sheet
  }

//Camera
  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}
