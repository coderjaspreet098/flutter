   import 'package:flutter/material.dart';
import 'package:untitled/deletemodel.dart';
import 'package:untitled/first.dart';
import 'package:untitled/rest.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> Flutterapi())),
                child: Text('First')
            ),
            // ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> Lights())),
            //     child: Text('Api')
            // ),
            ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> GetResponse())),
                child: Text('Response')
            ),
            ElevatedButton(
                child: Text('Delete'),
                onPressed: (){
                  Get.to(()=>MyApp9());
                }

            ),

          ],
        ),
      ),
    );
  }
}
