import 'package:flutter/material.dart';
import 'package:olx_app_firebase/view/screens/category.dart';
import 'package:olx_app_firebase/widgets/navigator.dart';

class BuildCategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const BuildCategoryCard({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(height: 8),
          Text(title),
        ],
      ),
    );
  }
}
Widget searchTextFormField({controller, onChanged}) {
  return TextFormField(
    onChanged: onChanged,
    controller: controller,
    style: const TextStyle(color: Color.fromARGB(255, 9, 9, 9)),
    decoration: const InputDecoration(
      hintText: 'Search...',
      hintStyle: TextStyle(color: Color.fromARGB(255, 2, 2, 2)),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 2, 2, 3)),
        // borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 10, 10, 10)),
        // borderRadius: BorderRadius.circular(10),
      ),
      border: OutlineInputBorder(
          // borderRadius: BorderRadius.circular(10),
          ),
      prefixIcon: Icon(
        Icons.search,
        color: Color.fromARGB(255, 6, 6, 6),
      ),
    ),
  );
}

SliverGridDelegateWithFixedCrossAxisCount gridDelegate(childAspectRatio) {
  return SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
    childAspectRatio: childAspectRatio,
  );
}

Widget categoryItems(context, Size size,
      {category, required String imagePath}) {
    return GestureDetector(
      onTap: () => NavigatorWidget().push(
          context,
          CategoryPage(
            category: category,
          )),
      child: Container(
        width: size.width * .2,
        height: size.width * .2,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(imagePath), fit: BoxFit.cover),
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(size.width * .05)),
        ),
      ),
    );
  }