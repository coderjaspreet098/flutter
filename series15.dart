// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class PostModel {
//   final String imageUrl;
//   final String title;
//   bool islike;
//   PostModel(this.imageUrl, this.title, this.islike);
// }
//
// class GridConcept2 extends StatefulWidget {
//   const GridConcept2({Key? key}) : super(key: key);
//
//   @override
//   _GridConceptState createState() => _GridConceptState();
// }
//
// class _GridConceptState extends State<GridConcept2> {
//
//   final List<PostModel> posts = [
//     PostModel(
//         'https://cdn.pixabay.com/photo/2023/08/18/15/02/dog-8198719_640.jpg',
//         'title',
//         false),
//   ];
//
//   void likebtn(int index) {
//     setState(() {
//       posts[index].islike = !posts[index].islike;
//     });
//   }
//
//   void _openImageSelector() {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               ListTile(
//                 leading: Icon(Icons.photo_library),
//                 title: Text('Select from Gallery'),
//                 onTap: () {
//
//                   Navigator.pop(context); // Close the bottom sheet
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.camera_alt),
//                 title: Text('Take a Photo'),
//                 onTap: () {
//
//                   Navigator.pop(context); // Close the bottom sheet
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Simple Grid'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {
//               _openImageSelector();
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         color: Colors.grey,
//         child: GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 5,
//             crossAxisSpacing: 5,
//           ),
//           itemCount: posts.length,
//           itemBuilder: (BuildContext context, int index) {
//             return Stack(
//               children: [
//                 Container(
//                   color: Colors.greenAccent,
//                   child: Column(
//                     children: [
//                       Expanded(
//                         child: Image(
//                           image: NetworkImage(posts[index].imageUrl),
//                         ),
//                       ),
//                       Text(posts[index].title)
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                   top: 10,
//                   right: 70,
//                   child: IconButton(
//                     icon: Icon(
//                       posts[index].islike
//                           ? Icons.favorite
//                           : Icons.favorite_border,
//                       color: posts[index].islike ? Colors.red : Colors.black,
//                       size: 30.0,
//                     ),
//                     onPressed: () {
//                       likebtn(index);
//                     },
//                   ),
//                 )
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class PostModel {
  final String imageUrl;
  final String title;
  final String description;

  PostModel(this.imageUrl, this.title, this.description);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grid View Example',
      home: GridConcept2(),
    );
  }
}

class GridConcept2 extends StatefulWidget {
  const GridConcept2({Key? key}) : super(key: key);

  @override
  _GridConceptState createState() => _GridConceptState();
}

class _GridConceptState extends State<GridConcept2> {
  final List<PostModel> posts = [];
  File? _selectedImage;
  String title = '';
  String description = '';

  void _addPost(String imageUrl, String title, String description) {
    setState(() {
      posts.add(PostModel(imageUrl, title, description));
    });
  }

  Future<void> _openGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  void _showBottomSheet() {
    String tempTitle = '';
    String tempDescription = '';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    if (_selectedImage != null)
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(_selectedImage!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    if (_selectedImage == null)
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // Close the bottom sheet
                          _openGallery();
                        },
                        child: Text('Select Image'),
                      ),
                    SizedBox(height: 10),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          tempTitle = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Title',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          tempDescription = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Description',
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_selectedImage != null && tempTitle.isNotEmpty && tempDescription.isNotEmpty) {
                          _addPost(_selectedImage!.path, tempTitle, tempDescription);
                          Navigator.pop(context); // Close the bottom sheet
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please fill in all fields and select an image.'),
                            ),
                          );
                        }
                      },
                      child: Text('Add'),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid View Example'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _showBottomSheet();
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              children: [
                Image(
                  image: FileImage(File(posts[index].imageUrl)),
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                Text(posts[index].title),
                Text(posts[index].description),
              ],
            ),
          );
        },
      ),
    );
  }
}
