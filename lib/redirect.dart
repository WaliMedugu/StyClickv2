// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:provider/provider.dart';

// class Redirect extends StatefulWidget {
//   const Redirect({Key? key}) : super(key: key);

//   @override
//   State<Redirect> createState() => _RedirectState();
// }

// class _RedirectState extends State<Redirect> {
//   bool moveToHome = false;

//   String? firstName;
//   String? lastName;
//   String? emailData;

//   Future moveToHomeFunction() async {
//     String email = getStringAsync("email");
//     String password = getStringAsync("password");

//     log("email and password from main $email $password");
//     String url = Endpoint.baseUrl + Endpoint.login;

//     var loginBody = {
//       "email": email,
//       "password": password,
//     };

//     try {
//       var response = await post(Uri.parse(url),
//           headers: {
//             "Content-type": "application/json",
//             "Accept": "application/json"
//           },
//           body: json.encode(loginBody));
//       // print("response from main about autologin :::: ${response.body}");
//       if (response.statusCode == 200) {
//         setValue("access_token", json.decode(response.body)["token"]);
//         setValue('fName', json.decode(response.body)['user']["first_name"]);
//         setValue('lName', json.decode(response.body)['user']["last_name"]);
//         // setValue('email', json.decode(response.body)["email"]);
//         // setValue('data', json.decode(response.body));
//         setValue('email', email);
//         setState(() {
//           firstName = json.decode(response.body)['user']["first_name"];
//           lastName = json.decode(response.body)['user']["last_name"];
//           emailData = json.decode(response.body)['user']["email"];
//         });
//         log(json.decode(response.body));
//         moveToHome = true;
//         return true;
//       } else {
//         moveToHome = false;
//         return false;
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     moveToHomeFunction();
//     Future.delayed(const Duration(seconds: 5), () {
//       if (moveToHome) {
//         log(firstName);
//         Navigator.pushReplacement(context,
//             MaterialPageRoute(builder: (context) {
//           return BeepDashboard(
//             // firstName: getStringAsync("firstName"),
//             // lastName: getStringAsync("lastName"),
//             // email: getStringAsync("email"),
//             firstName:firstName,
//             lastName: lastName,
//             email: emailData,
//           );
//         }));
//       } else {
//         Navigator.pushReplacement(context,
//             MaterialPageRoute(builder: (context) {
//           return const Login();
//         }));
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return HomepageLoader();
    
    
//     // Container(
//     //   color: white,
//     //   child: Center(
//     //     child: Transform.scale(
//     //       scale: 0.5,
//     //       child: const CircularProgressIndicator(
//     //         color: Colors.black,
//     //       ),
//     //     ),
//     //   ),
//     // );
//   }
// }
