import 'package:flutter/material.dart';

class PostModel {
  final String imageUrl;
  final String title;
  bool islike;
  PostModel(this.imageUrl,this.title,this.islike);
}

class GridConcept extends StatefulWidget {
  const GridConcept({Key? key}) : super(key: key);

  @override
  _GridConceptState createState() => _GridConceptState();
}

class _GridConceptState extends State<GridConcept> {
  final List<PostModel> posts = [
    PostModel('https://cdn.pixabay.com/photo/2023/08/18/15/02/dog-8198719_640.jpg', 'title',false),

  ];
  void likebtn(int index){
    setState((){
        posts[index].islike =!posts[index].islike;}
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Grid'),

      ),
      body: Container(
        color: Colors.grey,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2 ,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: posts.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: [Container(
                color: Colors.greenAccent,
                child: Column(
                  children: [
                    Expanded(
                      child: Image(
                        image: NetworkImage(posts[index].imageUrl),
                      ),
                    ),
                    Text(posts[index].title)
                  ],
                ),

              ),
              Positioned( top: 10,
                right: 70,
                child: IconButton(
                  icon: Icon(
                    posts[index].islike? Icons.favorite : Icons.favorite_border,
                    color: posts[index].islike ? Colors.red : Colors.black,
                    size: 30.0,
                  ),
                  onPressed: () {
                    likebtn(index);
                  },
                ),)
            ]
            );
          },
        ),
      ),

    );
  }
}

void main() {
  runApp(MaterialApp(
    home: GridConcept(),
  ));
}
