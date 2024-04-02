// // import 'package:flutter/material.dart';

// // class AddPage extends StatelessWidget {
// //   const AddPage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(child: Text('addpage')),
// //     );
// //   }
// // }

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class AddPage extends StatefulWidget {
//   const AddPage({Key? key}) : super(key: key);

//   @override
//   _AddPageState createState() => _AddPageState();
// }

// class _AddPageState extends State<AddPage> {
//   File? _image;
//   final picker = ImagePicker();
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _categoryController = TextEditingController();
//   TextEditingController _priceController = TextEditingController();
//   TextEditingController _locationController = TextEditingController();

//   // Future getImageFromCamera() async {
//   //   final pickedFile = await picker.getImage(source: ImageSource.camera);

//   //   setState(() {
//   //     if (pickedFile != null) {
//   //       _image = File(pickedFile.path);
//   //     } else {
//   //       print('No image selected.');
//   //     }
//   //   });
//   // }

//   // Future getImageFromGallery() async {
//   //   final pickedFile = await picker.getImage(source: ImageSource.gallery);

//   //   setState(() {
//   //     if (pickedFile != null) {
//   //       _image = File(pickedFile.path);
//   //     } else {
//   //       print('No image selected.');
//   //     }
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Item'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: GestureDetector(
//                 onTap: () {
//                   // Open camera or gallery
//                 },
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundImage: _image != null ? FileImage(_image!) : null,
//                   child: _image == null
//                       ? Icon(
//                           Icons.camera_alt,
//                           size: 40,
//                         )
//                       : null,
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             TextField(
//               controller: _categoryController,
//               decoration: InputDecoration(labelText: 'Category'),
//             ),
//             TextField(
//               controller: _priceController,
//               decoration: InputDecoration(labelText: 'Price'),
//             ),
//             TextField(
//               controller: _locationController,
//               decoration: InputDecoration(labelText: 'Location'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement submit functionality
//               },
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {
//       //     // Open camera
//       //   //  getImageFromCamera();
//       //   },
//       //   tooltip: 'Take Picture',
//       //   child: Icon(Icons.camera_alt),
//       // ),
//     );
//   }
// }

import 'dart:io';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:olx_app_firebase/controller/bottom_provider.dart';
import 'package:olx_app_firebase/controller/user_provider.dart';
import 'package:olx_app_firebase/model/user_model.dart';
import 'package:olx_app_firebase/view/authontication_screen.dart/widgets/product_widget.dart';
import 'package:olx_app_firebase/widgets/button.dart';
import 'package:olx_app_firebase/widgets/button_widget.dart';
import 'package:olx_app_firebase/widgets/pop_up.dart';
import 'package:olx_app_firebase/widgets/text_file.dart';
import 'package:provider/provider.dart';

class Addpage extends StatelessWidget {
  Addpage({super.key});

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final widgetProvider = Provider.of<WidgetProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('add profile'),
     ),
     // appBar: AppBarWidgets().appBar(context, title: 'title'),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    await ProductWidgets()
                        .showImagePickerBottomSheet(context, widgetProvider);
                  },
                  child: Consumer<WidgetProvider>(
                      builder: (context, value, child) {
                    return CircleAvatar(
                      radius: 70,
                      backgroundImage: value.file == null
                          ? AssetImage(
                              'assets/icons/profile icons.png',
                            )
                          : FileImage(
                              File(value.file!.path),
                            ) as ImageProvider,
                    );
                  }),
                ),
                TextFieldWidgets().textFormField(size,
                    inputFormatter:
                        FilteringTextInputFormatter.singleLineFormatter,
                    label: 'Name',
                    controller: userProvider.nameController),
                TextFieldWidgets().textFormField(size,
                    keyboardType: TextInputType.emailAddress,
                    label: "Email",
                    controller: userProvider.emailController),
                TextFieldWidgets().textFormField(size,
                    keyboardType: TextInputType.phone,
                    label: 'Phone',
                    inputFormatter: FilteringTextInputFormatter.digitsOnly,
                    prefixText: '+91',
                    maxLine: 10,
                    controller: userProvider.phoneNumberController),
                TextFieldWidgets().textFormField(size,
                    keyboardType: TextInputType.streetAddress,
                    label: 'Address',
                    controller: userProvider.addressController),
                SizedBox(
                  height: 10,
                ),
                ButtonWidget().fullWidthElevatedButton(
                  size,
                  label: 'Submit',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      if (widgetProvider.file != null) {
                        bool value = await PopupWidgets().showConfirmationDialog(
                            context,
                            title: "Warning",
                            content:
                                """Create your profile once; you can't edit or delete your account. Please verify all data for accuracy.""",
                            label: 'Set Profile');

                        if (value) {
                          PopupWidgets().showLoadingIndicator(context);
                          await addProduct(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        }
                      } else {
                        PopupWidgets().showErrorSnackbar(
                            context, 'Please Select a image');
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  addProduct(context) async {
    final getProvider = Provider.of<UserProvider>(context, listen: false);
    final getwidgetProvider =
        Provider.of<WidgetProvider>(context, listen: false);
    PopupWidgets().showLoadingIndicator(context);
    await getProvider.uploadImage(File(getwidgetProvider.file!.path));

    final user = FirebaseAuth.instance.currentUser;
    final product = UserModel(
        email: getProvider.emailController.text,
        name: getProvider.nameController.text,
        uId: user!.uid,
        address: getProvider.addressController.text,
        phoneNumber: getProvider.phoneNumberController.text,
        profilePic: getProvider.downloadURL);
    getProvider.addProduct(product);
    getwidgetProvider.file = null;
    Navigator.pop(context);
    PopupWidgets().showSuccessSnackbar(context, 'Profile has been created');
  }
}
