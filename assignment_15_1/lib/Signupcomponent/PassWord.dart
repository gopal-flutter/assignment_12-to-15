// import 'package:flutter/material.dart';

// import 'TextFieldConteiner.dart';

// class PassWord extends StatefulWidget {
//   const PassWord({
//     Key key,
//   }) : super(key: key);

//   @override
//   _PassWordState createState() => _PassWordState();
// }

// class _PassWordState extends State<PassWord> {
//   TextEditingController _signUpEmail = TextEditingController();
//   var password;
//   @override
//   Widget build(BuildContext context) {
//     return TextFieldContainer(
//       child: TextFormField(
//         controller: _signUpEmail,
//         obscureText: true,
//         validator: (val) {
//           if (val == null || val.isEmpty) {
//             return "Enter Your PassWord .";
//           } else {
//             return null;
//           }
//         },
//         onSaved: (val) {
//           setState(() {
//             password = val;
//           });
//         },
//         decoration: InputDecoration(
//           icon: Icon(
//             Icons.lock,
//             color: Colors.pink,
//           ),
//           border: InputBorder.none,
//           hintText: 'PassWord',
//         ),
//       ),
//     );
//   }
// }
