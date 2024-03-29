import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:olx_app_firebase/widgets/text_style.dart';

Widget buildSettingItem(BuildContext context,
    {required IconData icon,
    required String title,
    required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildKeyFeature({required String title, required String description}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      textPoppins(name: title, fontweight: FontWeight.w500, fontsize: 17),
      const SizedBox(height: 5.0),
      textAbel(name: description, fontweight: FontWeight.w600, fontsize: 15),
      const SizedBox(height: 10.0),
    ],
  );
}

Widget settingsTextAbel({name}) {
  return Text(name,
      style: GoogleFonts.abel(fontWeight: FontWeight.w600, fontSize: 17));
}

Widget settingsTextPoppins({name}) {
  return Text(name,
      style: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: const Color(0xFF00246B)));
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const FAQItem({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        question,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
              Text(answer, style: const TextStyle(fontWeight: FontWeight.w400)),
        ),
      ],
    );
  }
}

// contactSheet(BuildContext context) {
//   return showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         title: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 textPoppins(name: 'ROADWAY', fontweight: FontWeight.w500),
//                 const SizedBox(height: 10),
//                 const Icon(Icons.phone_enabled_sharp)
//               ],
//             ),
//             const SizedBox(height: 10),
//             const Text(
//               "+91 95 676 44 901",
//               style: TextStyle(fontWeight: FontWeight.w900, fontSize: 23),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: textPoppins(
//                   name: 'Back',
//                   fontsize: 15,
//                   fontweight: FontWeight.w500,
//                   color: const Color(0xFF00246B)))
//         ],
//       );
//     },
//   );
// }

sheet(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Column(
          children: [
            textPoppins(name: 'LOG OUT', fontweight: FontWeight.w600),
            const Text(
              "CONFIRM TO LOG OUT",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          ElevatedButton(
              style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 3, 45, 79)),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: textPoppins(name: 'CANCEL', color: Colors.white)),
          ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Color.fromARGB(255, 3, 45, 79))),
              onPressed: () {},
              child: textPoppins(name: 'LOGOUT', color: Colors.white)),
        ],
      );
    },
  );
}