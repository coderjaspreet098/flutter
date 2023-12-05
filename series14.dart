// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
//
// void main() {
//   runApp(MyApp());
// }
//
// class PostModel {
//   final String imageUrl;
//   final String title;
//   final String description;
//
//   PostModel(this.imageUrl, this.title, this.description);
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Grid View Example',
//       home: GridConcept2(),
//     );
//   }
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
//   final List<PostModel> posts = [];
//
//   void _addPost(String imageUrl, String title, String description) {
//     setState(() {
//       posts.add(PostModel(imageUrl, title, description));
//     });
//   }
//    File? _selectedImage;
//    void _selectImage(File image) {
//   setState(() {
//     _selectedImage = image;
//   });
//  }
//
//   Future<void> _openGallery() async {
//
//     String imageUrl = '';
//     String title = '';
//     String description = '';
//
//     await showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState) {
//             return Padding(
//               padding: EdgeInsets.only(
//                 bottom: MediaQuery
//                     .of(context)
//                     .viewInsets
//                     .bottom,
//               ),
//               child: Container(
//                 padding: EdgeInsets.all(16.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     Container(
//                       height: 150,
//                       width: 150,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: FileImage(File(imageUrl)),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     FloatingActionButton(
//                       onPressed: () {
//                         Navigator.pop(context); // Close the bottom sheet
//                         openGallerySheet();
//                       },
//                       child: Icon(Icons.add),
//                     ),
//                     SizedBox(height: 10),
//                     TextFormField(
//                       onChanged: (value) {
//                         setState(() {
//                           title = value;
//                         });
//                       },
//                       decoration: InputDecoration(
//                         hintText: 'Enter Title',
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     TextFormField(
//                       onChanged: (value) {
//                         setState(() {
//                           description = value;
//                         });
//                       },
//                       decoration: InputDecoration(
//                         hintText: 'Enter Description',
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         if (title.isNotEmpty && description.isNotEmpty) {
//                           _addPost(imageUrl, title, description);
//                           Navigator.pop(context); // Close the bottom sheet
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text('Please fill in all fields.'),
//                             ),
//                           );
//                         }
//                       },
//                       child: Text('Add'),
//                     ),
//                     SizedBox(height: 20),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//     // }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Grid View Example'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {
//               _openGallery();
//             },
//           ),
//         ],
//       ),
//       body: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisSpacing: 5,
//           crossAxisSpacing: 5,
//         ),
//         itemCount: posts.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Card(
//             child: Column(
//               children: [
//                 Image(
//                   image: FileImage(File(posts[index].imageUrl)),
//                   height: 100,
//                   width: 100,
//                   fit: BoxFit.cover,
//                 ),
//                 Text(posts[index].title),
//                 Text(posts[index].description),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//
//   void openGallerySheet() async {
//     final picker = ImagePicker();
//     final pickedImage = await picker.pickImage(source: ImageSource.gallery);
//
//     if (pickedImage != null) {
//       _selectImage(File(pickedImage.path));
//     }
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

      await showModalBottomSheet(
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
                      SizedBox(height: 10),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            title = value;
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
                            description = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter Description',
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (title.isNotEmpty && description.isNotEmpty) {
                            _addPost(_selectedImage!.path, title, description);
                            Navigator.pop(context); // Close the bottom sheet
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Please fill in all fields.'),
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
              _openGallery();
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
