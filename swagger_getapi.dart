// import 'package:untitled/getreq_model.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart'as http;
// import 'dart:convert';
//
// class Lights extends StatefulWidget {
//   const Lights({super.key});
//
//   @override
//   State<Lights> createState() => _LightsState();
// }
//
// class _LightsState extends State<Lights> {
//   List<Data> datalist=[];
//
//   Future<GetreqstModel> getuser()async{
//     final response3 = await http.get(Uri.parse('https://reqres.in/api/users'));
//     if(response3.statusCode==200){
//       return GetreqstModel.fromJson(jsonDecode(response3.body));
//     }
//     else{
//       throw Exception('Fail');
//     }
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Swagger Get Api'),
//       ),
//       body: Column(
//         children: [
//           Expanded(child: FutureBuilder<GetreqstModel>(
//             future: getuser(),
//             builder: (BuildContext context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const CircularProgressIndicator();
//               } else if (snapshot.hasError) {
//                 return Text('Error: ${snapshot.error}');
//               } else if (snapshot.hasData) {
//                 final userModel = snapshot.data!;
//                 return ListView(
//                   children: [
//                     ListTile(
//                       title: Text('Page: ${userModel.page}'),
//                     ),
//                     ListTile(
//                       title: Text('PerPage: ${userModel.perPage}'),
//                     ),
//                     ListTile(
//                       title: Text('Total: ${userModel.total}'),
//                     ),
//                     ListTile(
//                       title: Text('Total Pages: ${userModel.totalPages}'),
//                     ),
//                     FutureBuilder<Data>(future: getuser(),
//                         builder:(context,AsyncSnapshot<Data>snapshot1){
//                       if(snapshot1.hasData){
//                         return ListTile(
//
//                         );
//                       }else{
//                         return
//                       }
//                         })
//                   ],
//                 );
//               } else {
//                 return Text('No data available');
//               }
//             },
//           ),
//     )
//         ],
//       ),
//     );
//   }
// }
