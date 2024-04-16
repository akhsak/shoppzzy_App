
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:olx_app_firebase/controller/bottom_provider.dart';
import 'package:olx_app_firebase/widgets/text.dart';

class ProductWidgets {
  showImagePickerBottomSheet(context, WidgetProvider value) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 200,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.camera,
                    size: 60,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        await value.pickImage(ImageSource.camera);
                      },
                      child: TextWidgets().BodyText(context,
                          text: 'Camera', color: Colors.black))
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.photo,
                    size: 60,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        await value.pickImage(ImageSource.gallery);
                      },
                      child: TextWidgets().BodyText(context,
                          text: 'Gallery', color: Color.fromARGB(255, 8, 8, 8)))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
