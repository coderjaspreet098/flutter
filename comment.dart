import 'package:flutter/material.dart';
import 'package:untitled/comment_model.dart';
import 'package:dio/dio.dart';
class Commentapi extends StatefulWidget {
  const Commentapi({super.key});

  @override
  State<Commentapi> createState() => _CommentapiState();
}

class _CommentapiState extends State<Commentapi> {
  CommentModel?commentModel;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Comment Api'),
      ),
      body: Column(
        children: [
          if(commentModel?.comments!=null)
            Expanded(
              child:ListView.builder(
                itemCount: commentModel!.comments!.length,
                itemBuilder:(context, index) {
                  final comment1=  commentModel!.comments![index];
                  return ListTile(
                    title: Column(
                      children: [
                        Text(comment1.body ?? 'Body'),
                      ],
                    ),
                  );
                },
              ),
            ),

        ],
      ),
    );
  }
  void initState(){
    super.initState();
    commentproduct();
  }
  void commentproduct()async{
    final dio = Dio();
    final response3 =await dio.get('https://dummyjson.com/comments');
    setState(() {
      commentModel=CommentModel.fromJson(response3.data);
    });

}
}
