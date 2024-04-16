
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:olx_app_firebase/controller/provider_home.dart';
import 'package:olx_app_firebase/controller/user_provider.dart';
import 'package:olx_app_firebase/model/product_model.dart';
import 'package:olx_app_firebase/model/user_model.dart';
import 'package:olx_app_firebase/view/productpage/sell_product.dart';
import 'package:olx_app_firebase/view/productpage/sold_product.dart';
import 'package:olx_app_firebase/view/productpage/upcoming_page.dart';
import 'package:olx_app_firebase/view/screens/creatuser.dart';
import 'package:olx_app_firebase/widgets/icons.dart';
import 'package:olx_app_firebase/widgets/navigator.dart';
import 'package:olx_app_firebase/widgets/pop_up.dart';
import 'package:olx_app_firebase/widgets/text_style.dart';
import 'package:provider/provider.dart';

class MyProductTab extends StatefulWidget {
  const MyProductTab({super.key});

  @override
  State<MyProductTab> createState() => _MyProductTabState();
}

class _MyProductTabState extends State<MyProductTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: textPoppins(name:' My Products',fontweight: FontWeight.w600
          ),
          bottom: const TabBar(
            labelColor: Color.fromARGB(255, 1, 0, 2),
            unselectedLabelColor: Colors.green,
            tabs: [
              Tab(
                text: 'Active Ads',
              ),
              Tab(
                text: 'Inactive Ads',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            UpComingPage(),
            SoldProductPage(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.green,
          onPressed: () async {
            final currentUser = FirebaseAuth.instance.currentUser;
            final uId = currentUser?.uid;

            if (uId != null) {
              UserModel? userData =
                  Provider.of<UserProvider>(context, listen: false)
                      .getCurrentUserData(uId);

              if (userData == null || userData.name!.isEmpty) {
                bool value = await PopupWidgets().showConfirmationDialog(
                    context,
                    content:
                        '"You do not have a profile. If you wish to sell any products, please complete your profile."',
                    label: 'Go To Profile');

                if (value) {
                  NavigatorWidget().push(context, CreateUserDetails());
                }
              } else {
                Provider.of<ProductProvider>(context, listen: false).isEdit =
                    false;
                NavigatorWidget().push(
                  context,
                  //Addpage(),
                 SellProductPage(
                   products: ProductModel(
                 ),
                 ),
                );
              }
            }
          },
          child: IconsWidgets().IconButtonWidget(
            context,
            MediaQuery.of(context).size,
            color: Colors.white,
            iconData: Icons.add_outlined,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
