// // ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';

// class ContactUsPage extends StatelessWidget {
//   const ContactUsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Contact Us'),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16.0),
//         children: [
//           const Text(
//             'Contact Us',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//           ),
//           const SizedBox(height: 10),
//           const Text(
//             'If you have any questions or suggestions, feel free to reach out to us through any of the following channels:',
//           ),
//           const SizedBox(height: 20),
//           const Text(
//             'Contact Information',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//           ),
//           const SizedBox(height: 10),
//           ListTile(
//             leading: const Icon(Icons.email),
//             title: const Text('Email: grafico706@gmail.com'),
//             onTap: () {
//               launchEmail('grafico706@gmail.com');
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.phone),
//             title: const Text('Phone: +91 9048 623 502'),
//             onTap: () {
//               launchPhone('+919048623502');
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.message),
//             title: const Text('Send a Message'),
//             onTap: () {
//               launchMessaging();
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   void launchEmail(String email) async {
//     final Uri emailLaunchUri = Uri(
//       scheme: 'mailto',
//       path: email,
//     );

//     // if (await canLaunch(emailLaunchUri.toString())) {
//     //   await launch(emailLaunchUri.toString());
//     // } else {
//     //   throw 'Could not launch $emailLaunchUri';
//     // }
//   }

//   void launchPhone(String phoneNumber) async {
//     final Uri phoneLaunchUri = Uri(
//       scheme: 'tel',
//       path: phoneNumber,
//     );

//     // if (await canLaunch(phoneLaunchUri.toString())) {
//     //   await launch(phoneLaunchUri.toString());
//     // } else {
//     //   throw 'Could not launch $phoneLaunchUri';
//     // }
//   }

//   void launchMessaging() async {
//     final Uri smsLaunchUri = Uri(
//       scheme: 'sms',
//       path: '+919048623502', // Phone number to send the message
//       queryParameters: {
//         'body': 'Hi, I have a question about your app.'
//       }, // Message body
//     );

//     // if (await canLaunch(smsLaunchUri.toString())) {
//     //   await launch(smsLaunchUri.toString());
//     // } else {
//     //   throw 'Could not launch $smsLaunchUri';
//     // }
//   }
// }
