import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(PostModelApp());
}

class Post {
  final String id;
  final ImageProvider<Object> imageUrl;
  final String title;
  final String description;
  bool isLiked;

  Post({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
    this.isLiked = false,
  });
}

class PostModelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PostModel(),
    );
  }
}

class PostModel extends StatefulWidget {
  @override
  _PostModelState createState() => _PostModelState();
}

class _PostModelState extends State<PostModel> {
  final List<Post> posts = [];

  ImagePicker _imagePicker = ImagePicker();
  XFile? selectedImage;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void _openImagePicker() async {
    final XFile? image =
    await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImage = image;
      });
    }
  }

  void _addPost() {
    if (selectedImage != null &&
        titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty) {
      setState(() {
        final newPost = Post(
          id: DateTime.now().toString(),
          imageUrl: FileImage(File(selectedImage!.path)),
          title: titleController.text,
          description: descriptionController.text,
        );
        posts.add(newPost);
        // Clear input fields and selected image
        titleController.clear();
        descriptionController.clear();
        selectedImage = null;
        Navigator.pop(context); // Close the bottom sheet
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Posts'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                context: context,

                builder: (BuildContext context) {
                  final mediaQuery = MediaQuery.of(context);
                  return Container(
                    // padding: EdgeInsets.only(
                    //   bottom: keyboardHeight,
                    // ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Image selection button
                        ElevatedButton(
                          onPressed: _openImagePicker,
                          child: Text('Select Image'),
                        ),
                        // Display selected image
                        selectedImage != null
                            ? SizedBox(
                          width: 300, // Adjust the width as needed
                          height: 200, // Set the desired height
                          child: Image.file(File(selectedImage!.path)),
                        )
                            : SizedBox.shrink(),
                        // Title input field
                        TextField(
                          controller: titleController,
                          decoration: InputDecoration(
                            labelText: 'Title',
                          ),
                        ),
                        // Description input field
                        TextField(
                          controller: descriptionController,
                          decoration: InputDecoration(
                            labelText: 'Description',
                          ),
                        ),
                        // Add post button
                        ElevatedButton(
                          onPressed: _addPost,
                          child: Text('Add Post'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: posts.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, index) {
              return buildPostCard(posts[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget buildPostCard(Post post) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            child: Image(
              image: post.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              post.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(post.description),
          ),
          IconButton(
            icon: Icon(
              post.isLiked ? Icons.favorite : Icons.favorite_border,
              color: post.isLiked ? Colors.pinkAccent : null,
            ),
            onPressed: () {
              setState(() {
                post.isLiked = !post.isLiked;
              });
            },
          ),
        ],
      ),
    );
  }
}
