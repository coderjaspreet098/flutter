import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/getreq_model.dart';
import 'package:untitled/rest1.dart';

class GetResponse extends StatefulWidget {

  const GetResponse({Key? key}) : super(key: key);


  @override
  _GetResponseState createState() => _GetResponseState();
}

class _GetResponseState extends State<GetResponse> {
  List<Data> userList = [];
  bool isLoading = false;
  int page = 1;

  Future<List<Data>> getUserApi() async {
    print(page);
    final response = await http.get(Uri.parse('https://reqres.in/api/users?page=$page'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('data') && responseData['data'] is List) {
        final List<dynamic> userListData = responseData['data'];
        userList.addAll(userListData.map((userData) => Data.fromJson(userData)));
        page++;
        return userList;
      } else {
        throw Exception('Invalid data format from the API');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent == _scrollController.position.pixels && !isLoading) {
        isLoading = true;

        getUserApi().then((newData) {
          setState(() {
            isLoading = false;
          });
        });
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch data using API with Pagination'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(),
              builder: (context, AsyncSnapshot<List<Data>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return ListView.builder(
                    controller: _scrollController,
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.tealAccent),
                          height: 150,
                          child: Card(
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  child: Image.network(userList[index].avatar),
                                ),
                                Text(userList[index].firstName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
                                  child: Text(userList[index].id.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Restapi(restdata: userList[index])));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
