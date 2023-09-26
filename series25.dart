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
  final List<String> itemList = List.generate(50, (index) => 'Number $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Stack(clipBehavior: Clip.none, children: [
        Positioned(
            child: Opacity(
              opacity: 0.3,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1657064575960-efefbe831c2e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bGF1bmRhcnl8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60'))),
              ),
            )),
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
                                          style: TextStyle(fontSize: 30,color: Colors.black)),
                                      TextSpan(
                                          text: "Laundry store",
                                          style: TextStyle(fontSize: 30,color: Colors.black)),
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
                                              'https://media.istockphoto.com/id/1134696879/photo/laundry-room-with-a-washing-machine.jpg?s=2048x2048&w=is&k=20&c=7sCJmezXwRdI2zr_Zd25D5SAhYpVkVMHdFXHztvCoyI='),
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
                                height: 150,

                                child: ListView.builder(
                                  itemCount: itemList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                                      padding: EdgeInsets.all(16.0),
                                      color: Colors.blueGrey,
                                      child: Text(
                                        itemList[index],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  },
                                ),

                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24.0,
                                ),
                                child: Text(
                                  "Latest Order",
                                  style: TextStyle(
                                    color: Color.fromRGBO(19, 22, 33, 1),
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 175,

                                child: ListView.builder(
                                  itemCount: itemList.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                                      padding: EdgeInsets.all(16.0),
                                      color: Colors.blueGrey,
                                      child: Text(
                                        itemList[index],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  },
                                ),

                              ),
                            ],
                          )
                      )
                    ]))),
      ]),
    );
  }
}
