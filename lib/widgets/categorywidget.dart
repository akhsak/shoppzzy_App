

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:olx_app_firebase/model/product_model.dart';
import 'package:olx_app_firebase/widgets/icons.dart';
import 'package:olx_app_firebase/widgets/text.dart';

class CategoryWidgets {
  Widget buildProductItem(Size size,
      {List<ProductModel>? products, String? category}) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: size.width * 0.05,
          crossAxisSpacing: size.width * 0.015,
          childAspectRatio: size.width / (size.width * 1.5),
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          late final filteredProduct;
          if (product.category == 'Mobile') {
            filteredProduct = product;
          }
          return Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.width * 0.42,
                      width: size.width * 0.42,
                      child: Image(
                        fit: BoxFit.cover,
                        image: filteredProduct.image!.isNotEmpty
                            ? NetworkImage(filteredProduct.image.toString())
                            : Lottie.asset('assets/lottie/sellX logo.json')
                                as ImageProvider,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextWidgets()
                        .HeadingText(context, text: filteredProduct.title!),
                    TextWidgets()
                        .SubtitleText(context, text: filteredProduct.subtitile!),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidgets().titleText2(context,
                            text: "₹${filteredProduct.price.toString()}"),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                right: 2,
                bottom: 2,
                child: IconsWidgets().IconButtonWidget(
                  context,
                  size,
                  iconData: Icons.favorite_border,
                  onPressed: () {},
                ),
              )
            ],
          );
        },
        itemCount: products!.length,
      ),
    );
  }
}
