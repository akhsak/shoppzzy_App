
import 'package:flutter/material.dart';
import 'package:olx_app_firebase/controller/provider_home.dart';
import 'package:olx_app_firebase/model/product_model.dart';
import 'package:olx_app_firebase/widgets/text_style.dart';

class HomeContainer extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final ProductModel product;
  final ProductProvider value;

  const HomeContainer({
    super.key,
    required this.value,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
   
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.width * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(product.image!),
                ),
              ),
            ),
            SizedBox(height: size.height * .01),
            textPoppins(
                name: product.name,
                fontweight: FontWeight.bold,
                fontsize: 16),
            SizedBox(height: size.height * .01),
            textPoppins(
                name: '${product.location}',
                fontweight: FontWeight.w500,
                fontsize: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₹ ${product.price.toString()} ',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
             
                     IconButton(
                        onPressed: () {
                          final wish = value.wishListCheck(product);
                          value.wishlistClicked(product.id!, wish);
                        },
                        icon: value.wishListCheck(product)
                            ? const Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.black,
                              )
                            : const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                      )
              ],
            )
          ],
        ),
      ),
    );
  }
}
