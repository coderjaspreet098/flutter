import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Grocerystore1 extends StatelessWidget {
  const Grocerystore1({Key? key});

  @override
  Widget build(BuildContext context) {
    return Grocerystore2();
  }
}

class Grocerystore2 extends StatefulWidget {
  const Grocerystore2({Key? key});

  @override
  State<Grocerystore2> createState() => _Grocerystore2State();
}

class _Grocerystore2State extends State<Grocerystore2> {
  final List<Itemdata> itemlist = [
    Itemdata(text: 'Kings Strret 20', color: Colors.orangeAccent),
    Itemdata(text: 'Ludhiana', color: Colors.blue),
    Itemdata(text: 'Chandigarh', color: Colors.green),
  ];
  final double itemWidth = 200.0;
  final double itemHeight = 10.0;
  final List<Itemdata1> itemlist1 = [
    Itemdata1(
        icon1: Icons.time_to_leave_outlined,
        text1: '  Delivered order 20 ',
        color1: Colors.greenAccent),
    Itemdata1(
        icon1:Icons.timelapse,
        text1: '  Delivered order 30',
        color1: Colors.teal),
    Itemdata1(
        icon1: Icons.time_to_leave,
        text1: '  Delivered order 40',
        color1: Colors.cyanAccent),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      floatingActionButton: FloatingActionButton(onPressed: (){loadProducts();}),
      body: Stack(clipBehavior: Clip.none, children: [
        SingleChildScrollView(
            child: Container(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              SizedBox(
                height: kToolbarHeight,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "Welcome to,\n",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.black)),
                              TextSpan(
                                  text: "Laundry store",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.black)),
                            ],
                          ),
                        ),
                        // Image.asset(
                        //   "assets/images/user.png",
                        //   height: 80,
                        //   width: 80,
                        // )
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRms4SSvT_4IGE0kKkrS1oMdBLjREB9wJCNQA&usqp=CAU'),
                                  fit: BoxFit.cover)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height - 200.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 24.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                        ),
                        child: Text(
                          "New Locations",
                          style: TextStyle(
                            color: Color.fromRGBO(19, 22, 33, 1),
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          itemCount: itemlist.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final item = itemlist[index];
                            return Container(
                              height: itemHeight,
                              width: itemWidth,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: item.color),
                              margin: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              padding: EdgeInsets.all(16.0),
                              child: Center(
                                child: Text(
                                  item.text,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Latest Order",
                              style: TextStyle(
                                color: Color.fromRGBO(19, 22, 33, 1),
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              "View All",
                              style: TextStyle(
                                color: Color.fromRGBO(19, 22, 33, 1),
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 175,
                        child: ListView.builder(
                          itemCount: itemlist1.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            final item1 = itemlist1[index];
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: item1.color1,
                              ),
                              child: Row(
                                children: [
                                  Icon(item1.icon1),
                                  Text(
                                    item1.text1,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ))
            ]))),
      ]),
    );
  }
  
  
  void loadProducts() async
  {
    print('here');
    final dio=Dio();
 final response= await  dio.get('https://dummyjson.com/products');

  }
}

class Itemdata {
  final String text;
  final Color color;

  Itemdata({required this.text, required this.color});
}

class Itemdata1 {
  final IconData icon1;
  final String text1;
  final Color color1;

  Itemdata1({required this.icon1, required this.text1, required this.color1});
}
