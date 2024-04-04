



import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:olx_app_firebase/controller/provider_home.dart';
import 'package:olx_app_firebase/model/model.dart';
import 'package:olx_app_firebase/view/home/newhome.dart';
import 'package:olx_app_firebase/widgets/button.dart';
import 'package:olx_app_firebase/widgets/snackbar_widget.dart';
import 'package:olx_app_firebase/widgets/text_file.dart';
import 'package:provider/provider.dart';

class Addpage extends StatelessWidget {
  Addpage({super.key});

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
   // final widgetProvider = Provider.of<WidgetProvider>(context, listen: false);
    final prdctProvider = Provider.of<ProductProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('add profile'),
     ),
     // appBar: AppBarWidgets().appBar(context, title: 'title'),
      body: Form(
        key: prdctProvider.productDataFormKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Consumer<ProductProvider>(
                                    builder: (context, value, child) =>
                                        GestureDetector(
                                      onTap: () {
                                        pickImage(context);
                                      },
                                      child: Container(
                                        height: size.height * .2,
                                        width: size.width * .9,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          border: Border.all(
                                              color: Colors.black, width: 2),
                                          image: value.pickedImage != null
                                              ? DecorationImage(
                                                  image: FileImage(
                                                      value.pickedImage!),
                                                  fit: BoxFit.contain,
                                                )
                                              : const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/image_add.png'),
                                                  fit: BoxFit.contain,
                                                ),
                                        ),
                                      ),
                                    ),
                                  ),
                TextFieldWidgets().textFormField(size,
                    inputFormatter:
                        FilteringTextInputFormatter.singleLineFormatter,
                    label: 'Name',
                    controller: prdctProvider.productNameController),
                TextFieldWidgets().textFormField(size,
                    keyboardType: TextInputType.emailAddress,
                    label: "category",
                    controller: prdctProvider.categoryController),
                TextFieldWidgets().textFormField(size,
                    keyboardType: TextInputType.phone,
                    label: 'Price',
                    inputFormatter: FilteringTextInputFormatter.digitsOnly,
                    prefixText: '₹',
                   // maxLine: 10,
                    controller: prdctProvider.priceController),
                TextFieldWidgets().textFormField(size,
                    keyboardType: TextInputType.streetAddress,
                    label: 'location',
                    controller: prdctProvider.locationController),
                const SizedBox(
                  height: 10,
                ),
                ButtonWidget().fullWidthElevatedButton(
                  size,
                  label: 'Submit',
                  onPressed: () async {
                    // if (formKey.currentState!.validate()) {
                    //   if (widgetProvider.file != null) {
                    //     bool value = await PopupWidgets().showConfirmationDialog(
                    //         context,
                    //         title: "Warning",
                    //         content:
                    //             """Create your profile once; you can't edit or delete your account. Please verify all data for accuracy.""",
                    //         label: 'Set Profile');

                    //     if (value) {
                    //       PopupWidgets().showLoadingIndicator(context);
                    //       await addProduct(context);
                    //       Navigator.pop(context);
                    //       Navigator.pop(context);
                    //     }
                    //   } else {
                    //     PopupWidgets().showErrorSnackbar(
                    //         context, 'Please Select a image');
                    //   }
                    // }
                      if (prdctProvider.productDataFormKey.currentState!
                                        .validate()) {
                                          
                                          log('aaaaaaaaaaaaaaa');
                                      await addData(context, prdctProvider);
                                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>HomeScreen()));
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

  // addProduct(context) async {
  //   final getProvider = Provider.of<UserProvider>(context, listen: false);
  //   final getwidgetProvider =
  //       Provider.of<WidgetProvider>(context, listen: false);
  //   PopupWidgets().showLoadingIndicator(context);
  //   await getProvider.uploadImage(File(getwidgetProvider.file!.path));

  //   final user = FirebaseAuth.instance.currentUser;
  //   final product = UserModel(
  //       email: getProvider.emailController.text,
  //       name: getProvider.nameController.text,
  //       uId: user!.uid,
  //       address: getProvider.addressController.text,
  //       phoneNumber: getProvider.phoneNumberController.text,
  //       profilePic: getProvider.downloadURL);
  //   getProvider.addProduct(product);
  //   getwidgetProvider.file = null;
  //   Navigator.pop(context);
  //   PopupWidgets().showSuccessSnackbar(context, 'Profile has been created');
  // }
    Future<void> pickImage(BuildContext context) async {
    final pro = Provider.of<ProductProvider>(context, listen: false);
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  pro.getImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  pro.getImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> addData(BuildContext context, ProductProvider prdctProvider) async {
    final pickedImage = prdctProvider.pickedImage;
    if (pickedImage != null) {
      prdctProvider.setIsAddingData(true);
      final image = await prdctProvider.uploadImage(
          File(pickedImage.path), prdctProvider.imageName);

      final products = ProductModel(
        name: prdctProvider.productNameController.text,
        description: prdctProvider.descriptionController.text,
        price: int.parse(prdctProvider.priceController.text),
        location: prdctProvider.locationController.text,
        category: prdctProvider.categoryController.text,
        image: image,
        wishList: [],
      );

      prdctProvider.addProduct(products);

      prdctProvider.clearProductControllers();

      SnackBarWidget().showSuccessSnackbar(context, 'Car Added Successfully');
    } else {
      SnackBarWidget()
          .showSuccessSnackbar(context, 'Failed to Add try once more');
      log('Error: pickedImage is null');
    }
    prdctProvider.setIsAddingData(false);
  }

}


