// // ignore_for_file: use_build_context_synchronously
// import 'dart:developer';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:olx_app_firebase/controller/provider_home.dart';
// import 'package:olx_app_firebase/model/product_model.dart';
// import 'package:olx_app_firebase/widgets/bottom_screen.dart';
// import 'package:olx_app_firebase/widgets/button.dart';
// import 'package:olx_app_firebase/widgets/snackbar_widget.dart';
// import 'package:olx_app_firebase/widgets/text_file.dart';
// import 'package:provider/provider.dart';

// class Addpage extends StatelessWidget {
//   Addpage({super.key});

//   final formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     final prdctProvider = Provider.of<ProductProvider>(context, listen: false);
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(title: const Text('Add items'),
//      ),
//       body: Form(
//         key: prdctProvider.productDataFormKey,
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Consumer<ProductProvider>(
//                                     builder: (context, value, child) =>
//                                         GestureDetector(
//                                       onTap: () {
//                                         pickImage(context);
//                                       },
//                                       child: Container(
//                                         height: size.height * .2,
//                                         width: size.width * .9,
//                                         decoration: BoxDecoration(
//                                           borderRadius: const BorderRadius.all(
//                                               Radius.circular(10)),
//                                           border: Border.all(
//                                               color: Colors.black, width: 2),
//                                           image: value.pickedImage != null
//                                               ? DecorationImage(
//                                                   image: FileImage(
//                                                       value.pickedImage!),
//                                                   fit: BoxFit.contain,
//                                                 )
//                                               : const DecorationImage(
//                                                   image: AssetImage(
//                                                       'assets/phone otp.jpg'),
//                                                   fit: BoxFit.contain,
//                                                 ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                 TextFieldWidgets().textFormField(size,
//                     inputFormatter:
//                         FilteringTextInputFormatter.singleLineFormatter,
//                     label: 'Name',
//                     controller: prdctProvider.productNameController),
//                 TextFieldWidgets().textFormField(size,
//                     keyboardType: TextInputType.emailAddress,
//                     label: "category",
//                     controller: prdctProvider.categoryController),
//                 TextFieldWidgets().textFormField(size,
//                     keyboardType: TextInputType.phone,
//                     label: 'Price',
//                     inputFormatter: FilteringTextInputFormatter.digitsOnly,
//                     prefixText: '₹',
//                    // maxLine: 10,
//                     controller: prdctProvider.priceController),
//                 TextFieldWidgets().textFormField(size,
//                     keyboardType: TextInputType.streetAddress,
//                     label: 'location',
//                     controller: prdctProvider.locationController),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 ButtonWidget().fullWidthElevatedButton(
//                   size,
//                   label: 'Submit',
//                   onPressed: () async {
//                     // if (formKey.currentState!.validate()) {
//                     //   if (widgetProvider.file != null) {
//                     //     bool value = await PopupWidgets().showConfirmationDialog(
//                     //         context,
//                     //         title: "Warning",
//                     //         content:
//                     //             """Create your profile once; you can't edit or delete your account. Please verify all data for accuracy.""",
//                     //         label: 'Set Profile');

//                     //     if (value) {
//                     //       PopupWidgets().showLoadingIndicator(context);
//                     //       await addProduct(context);
//                     //       Navigator.pop(context);
//                     //       Navigator.pop(context);
//                     //     }
//                     //   } else {
//                     //     PopupWidgets().showErrorSnackbar(
//                     //         context, 'Please Select a image');
//                     //   }
//                     // }
//                       if (prdctProvider.productDataFormKey.currentState!
//                                         .validate()) {
                                          
//                                           log('aaaaaaaaaaaaaaa');
//                                       await addData(context, prdctProvider);
                                      
//                                     // Navigator.push(context, MaterialPageRoute(builder: (context) => bot,));
//                                   Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>BottomScreen()));
//                                     }
//                   },
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // addProduct(context) async {
//   //   final getProvider = Provider.of<UserProvider>(context, listen: false);
//   //   final getwidgetProvider =
//   //       Provider.of<WidgetProvider>(context, listen: false);
//   //   PopupWidgets().showLoadingIndicator(context);
//   //   await getProvider.uploadImage(File(getwidgetProvider.file!.path));

//   //   final user = FirebaseAuth.instance.currentUser;
//   //   final product = UserModel(
//   //       email: getProvider.emailController.text,
//   //       name: getProvider.nameController.text,
//   //       uId: user!.uid,
//   //       address: getProvider.addressController.text,
//   //       phoneNumber: getProvider.phoneNumberController.text,
//   //       profilePic: getProvider.downloadURL);
//   //   getProvider.addProduct(product);
//   //   getwidgetProvider.file = null;
//   //   Navigator.pop(context);
//   //   PopupWidgets().showSuccessSnackbar(context, 'Profile has been created');
//   // }
//     Future<void> pickImage(BuildContext context) async {
//     final pro = Provider.of<ProductProvider>(context, listen: false);
//     await showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return SizedBox(
//           height: 150,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               ListTile(
//                 leading: const Icon(Icons.camera_alt),
//                 title: const Text('Camera'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   pro.getImage(ImageSource.camera);
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.image),
//                 title: const Text('Gallery'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   pro.getImage(ImageSource.gallery);
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Future<void> addData(BuildContext context, ProductProvider prdctProvider) async {
//     final pickedImage = prdctProvider.pickedImage;
//     if (pickedImage != null) {
//       prdctProvider.setIsAddingData(true);
//       final image = await prdctProvider.uploadImage(
//           File(pickedImage.path));

//       final products = ProductModel(
//         name: prdctProvider.productNameController.text,
//         description: prdctProvider.descriptionController.text,
//         price: int.parse(prdctProvider.priceController.text),
//         location: prdctProvider.locationController.text,
//         category: prdctProvider.categoryController.text,
//         image: image,
//         wishList: [], brand:prdctProvider.brandController.text,
//         title: prdctProvider.titleController.text,
//       );

//       prdctProvider.addProduct(products);

//       prdctProvider.clearProductControllers();

//       SnackBarWidget().showSuccessSnackbar(context, 'Car Added Successfully');
//     } else {
//       SnackBarWidget()
//           .showSuccessSnackbar(context, 'Failed to Add try once more');
//       log('Error: pickedImage is null');
//     }
//     prdctProvider.setIsAddingData(false);
//   }

// }

// // import 'dart:io';

// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:olx_app_firebase/controller/bottom_provider.dart';
// // import 'package:olx_app_firebase/controller/provider_home.dart';
// // import 'package:olx_app_firebase/model/product_model.dart';
// // import 'package:olx_app_firebase/view/authontication_screen.dart/widgets/product_widget.dart';
// // import 'package:olx_app_firebase/widgets/button.dart';
// // import 'package:olx_app_firebase/widgets/button_widget.dart';
// // import 'package:olx_app_firebase/widgets/pop_up.dart';
// // import 'package:olx_app_firebase/widgets/text_file.dart';
// // import 'package:provider/provider.dart';

// // // ignore: must_be_immutable
// // class SellProductPage extends StatefulWidget {
// //   ProductModel? products;
// //   SellProductPage({Key? key, this.products}) : super(key: key);

// //   @override
// //   State<SellProductPage> createState() => _SellProductPageState();
// // }

// // class _SellProductPageState extends State<SellProductPage> {
// //   @override
// //   void initState() {
// //     Provider.of<ProductProvider>(context, listen: false)
// //         .loadDatasForEdit(widget.products!);
// //     selectedCategory = widget.products!.category;
// //     super.initState();
// //   }

// //   final formKey = GlobalKey<FormState>();

// //   final List<String> categories = [
// //      'T-Shirt',
// //     'Pants',
// //     'Dress',  
// //     'Jackets', 
// //      'Shoes', 'Bag'
// //   ];

// //   String? selectedCategory;

// //   @override
// //   Widget build(BuildContext context) {
// //     final getProvider = Provider.of<ProductProvider>(context, listen: false);
// //     final widgetProvider = Provider.of<WidgetProvider>(context, listen: false);
// //     Size size = MediaQuery.of(context).size;
// //     return Scaffold(
// //       appBar: AppBar(
        
// //         title: Text(getProvider.isEdit! ? 'Update Product' : 'Sell Product'),
// //       ),
// //       body: Form(
// //         key: formKey,
// //         child: Padding(
// //           padding: const EdgeInsets.all(15.0),
// //           child: SingleChildScrollView(
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 Padding(
// //                   padding: const EdgeInsets.all(12.0),
// //                   child: GestureDetector(
// //                     onTap: () async {
// //                       getProvider.isEdit == false
// //                           ? await ProductWidgets().showImagePickerBottomSheet(
// //                               context, widgetProvider)
// //                           : PopupWidgets().showErrorSnackbar(
// //                               context, 'The image can never be edited');
// //                     },
// //                     child: Row(
// //                       children: [
// //                         Consumer<WidgetProvider>(
// //                             builder: (context, value, child) {
// //                           return Container(
// //                             width: size.width * .3,
// //                             height: size.width * .3,
// //                             decoration: BoxDecoration(
// //                               boxShadow: [
// //                                 // BoxShadow(
// //                                 //   color: Colors.grey.withOpacity(0.3),
// //                                 //   spreadRadius: 1,
// //                                 //   blurRadius: 5,
// //                                 //   offset: const Offset(0, 3),
// //                                 // ),
// //                               ],
// //                               image: DecorationImage(
// //                                   fit: BoxFit.cover,
// //                                   scale: size.width * .07,
// //                                   image: value.file == null
// //                                       ? AssetImage(
// //                                           'assets/icons/upload image.png',
// //                                         )
// //                                       : FileImage(
// //                                           File(value.file!.path),
// //                                         ) as ImageProvider),
// //                               borderRadius: BorderRadius.circular(15),
// //                               // color: Color.fromARGB(255, 255, 255, 255)
// //                             ),
// //                           );
// //                         }),
// //                         Expanded(
// //                           child: Padding(
// //                             padding: const EdgeInsets.all(8.0),
// //                             child: Column(
// //                               mainAxisAlignment: MainAxisAlignment.center,
// //                               children: [
// //                                 TextFieldWidgets().textFormField(size,
// //                                     label: "Title",
// //                                     controller: getProvider.titleController),
// //                                 TextFieldWidgets().textFormField(size,
// //                                     label: "Brand",
// //                                     controller: getProvider.brandController),
// //                               ],
// //                             ),
// //                           ),
// //                         )
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.all(20.0),
// //                   child: Column(
// //                     children: [
// //                       Padding(
// //                         padding:
// //                             EdgeInsets.symmetric(horizontal: size.width * .01),
// //                         child: DropdownButtonFormField<String>(
// //                           value: selectedCategory,
// //                           decoration: InputDecoration(
// //                             labelText: 'Category',
// //                           ),
// //                           onChanged: (value) {
// //                             selectedCategory = value;
// //                           },
// //                           items: categories.map((category) {
// //                             return DropdownMenuItem(
// //                               value: category,
// //                               child: Text(category),
// //                             );
// //                           }).toList(),
// //                           validator: (value) {
// //                             if (value == null || value.isEmpty) {
// //                               return 'Please select category';
// //                             }
// //                             return null;
// //                           },
// //                         ),
// //                       ),
// //                       TextFieldWidgets().textFormField(
// //                         size,
// //                         label: "Description",
// //                         // maxLines: 2,
// //                         controller: getProvider.descriptionController,
// //                       ),
// //                       Row(
// //                         children: [
// //                           Expanded(
// //                             child: TextFieldWidgets().textFormField(size,
// //                                 label: "Location",
// //                                 keyboardType: TextInputType.text,
// //                                 hitText: 'City,State',
// //                                 // inputFormatter:
// //                                 //     FilteringTextInputFormatter.t,
// //                                 controller: getProvider.locationController),
// //                           ),
// //                           Expanded(
// //                             child: TextFieldWidgets().textFormField(size,
// //                                 label: "Price",
// //                                 prefixText: '₹',
// //                                 keyboardType: TextInputType.number,
// //                                 inputFormatter:
// //                                     FilteringTextInputFormatter.digitsOnly,
// //                                 controller: getProvider.priceController),
// //                           ),
// //                         ],
// //                       ),
// //                       SizedBox(height: size.width * 0.05),
// //                       Consumer<ProductProvider>(
// //                           builder: (context, value, child) {
// //                         return ButtonWidget().fullWidthElevatedButton(
// //                           size,
// //                           label:
// //                               value.isEdit == false ? 'Sell Product' : 'Update',
// //                           onPressed: () async {
// //                             if (formKey.currentState!.validate()) {
// //                               if (value.isEdit == false) {
// //                                 if (widgetProvider.file != null) {
// //                                   await addProduct(context);
// //                                   Navigator.pop(context);
// //                                 } else {
// //                                   PopupWidgets().showErrorSnackbar(
// //                                       context, 'Please Select a image');
// //                                 }
// //                               } else {
// //                                 await updateProduct(context, widget.products!);
// //                               }
// //                             }
// //                           },
// //                         );
// //                       }),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   addProduct(context) async {
// //     final getProvider = Provider.of<ProductProvider>(context, listen: false);
// //     final getwidgetProvider =
// //         Provider.of<WidgetProvider>(context, listen: false);
// //     PopupWidgets().showLoadingIndicator(context);
// //     await getProvider.uploadImage(File(getwidgetProvider.file!.path));

// //     final user = FirebaseAuth.instance.currentUser;
// //     final product = ProductModel(
// //       name: user!.email ?? user.phoneNumber,
// //       uId: user.uid,
// //       title: getProvider.titleController.text,
// //       location: getProvider.locationController.text,
// //       brand: getProvider.brandController.text,
// //       description: getProvider.descriptionController.text,
// //       price: int.parse(getProvider.priceController.text),
// //       image: getProvider.downloadUrl,
// //       wishList: [],
// //       isSold: false,
// //       category: selectedCategory,
// //       timeStamp: DateTime.now(),
// //     );
// //     getProvider.addProduct(product);
// //     getwidgetProvider.file = null;
// //     Navigator.pop(context);
// //     PopupWidgets()
// //         .showSuccessSnackbar(context, 'Product uploaded successfully');
// //   }

// //   updateProduct(context, ProductModel product) async {
// //     final getProvider = Provider.of<ProductProvider>(context, listen: false);
// //     PopupWidgets().showLoadingIndicator(context);
// //     product.title = getProvider.titleController.text;
// //     product.brand = getProvider.brandController.text;
// //     product.description = getProvider.descriptionController.text;
// //     product.price = int.parse(getProvider.priceController.text);
// //     product.category = selectedCategory;
// //     product.timeStamp = DateTime.now();

// //    await getProvider.updateMyProduct(product.id, product);

// //     Navigator.pop(context);
// //     Navigator.pop(context);
// //     PopupWidgets().showSuccessSnackbar(context, 'Product updated successfully');
// //   }
// // }

