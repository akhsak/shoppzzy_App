// import 'package:flutter/material.dart';

// class BuildCategoryCard {
  


// Widget _buildCategoryCard(String title, String imagePath) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: Column(
//         children: [
//           CircleAvatar(
//             radius: 30,
//             backgroundImage: AssetImage(imagePath),
//           ),
//           const SizedBox(height: 8),
//           Text(title),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

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
