// import 'package:flutter/material.dart';
// import 'TextFieldConteiner.dart';

// class Email extends StatefulWidget {
//   const Email({
//     Key key,
//   }) : super(key: key);

//   @override
//   _EmailState createState() => _EmailState();
// }

// class _EmailState extends State<Email> {
//   TextEditingController _signUpEmail = TextEditingController();
//   var email;

//   @override
//   Widget build(BuildContext context) {
//     return TextFieldContainer(
//       child: TextFormField(
//         controller: _signUpEmail,
//         validator: (val) {
//           if (val == null || val.isEmpty) {
//             return "Enter Your Email Address.";
//           } else {
//             return null;
//           }
//         },
//         onSaved: (val) {
//           setState(() {
//             email = val;
//           });
//         },
//         decoration: InputDecoration(
//           icon: Icon(
//             Icons.email,
//             color: Colors.pink,
//           ),
//           hintText: 'Email',
//           border: InputBorder.none,
//         ),
//       ),
//     );
//   }
// }
