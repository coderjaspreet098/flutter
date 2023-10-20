import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:untitled/getreq_model.dart';
Future<GetreqstModel> fetchGetUserModel() async {
  final response = await http.get(Uri.parse('https://reqres.in/api/users'));

  if (response.statusCode == 200) {
    return GetreqstModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

class SwagerUser extends StatefulWidget {
  const SwagerUser({Key? key}) : super(key: key);

  @override
  State<SwagerUser> createState() => _SwagerUserState();
}

class _SwagerUserState extends State<SwagerUser> {
  late Future<GetreqstModel> futureGetUserModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    futureGetUserModel = fetchGetUserModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: FutureBuilder<GetreqstModel>(
          future: futureGetUserModel,
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final userModel = snapshot.data!;
              return ListView(
                children: [
                  ListTile(
                    title: Text('Page: ${userModel.page}'),
                  ),
                  ListTile(
                    title: Text('PerPage: ${userModel.perPage}'),
                  ),
                  ListTile(
                    title: Text('Total: ${userModel.total}'),
                  ),
                  ListTile(
                    title: Text('Total Pages: ${userModel.totalPages}'),
                  ),
                  if (userModel.data != null)
                      ...userModel.data!.map((userData) { 
                      return ListTile(
                        title: ElevatedButton(child: Text('ID: ${userData.id}'),
                        onPressed: (){},),
                        subtitle: Text('Email: ${userData.email}'),
                        trailing: Text('${userData.firstName} ${userData.lastName}'),
                        leading: Image.network('${userData.avatar}'),

                      );
                    }).toList(),
                ],
              );
            } else {
              return Text('No data available');
            }
          },
        ),
      ),
    );
  }
}