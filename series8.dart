import 'package:flutter/material.dart';
import 'package:newproject/series10.dart';

class bmicalculator extends StatefulWidget {
  const bmicalculator({super.key});

  @override
  State<bmicalculator> createState() => _bmicalculatorState();
}

class _bmicalculatorState extends State<bmicalculator> {
  final TextEditingController _weightcontrol = TextEditingController();
  final TextEditingController _heightcontrol = TextEditingController();
  double? _result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),  
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10,30,10,10),
        child: Column(
          children:<Widget> [
            TextField(
              controller: _weightcontrol,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'Weight in Kg',
                icon: Icon(Icons.line_weight),

              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _heightcontrol,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'Height in cm',
                icon: Icon(Icons.trending_up),
              ),
            ),
            SizedBox(height: 20,),
            OutlinedButton(
              child: Text('Calculate',style: TextStyle(color: Colors.white,fontSize: 20),),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed:() {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => calculatorbm(bmiresult:_result)),);
                Calulatebmi();


              }
            ),

          ],
        ),
      ),
    );
  }
  void Calulatebmi(){
    double weight = double.parse(_weightcontrol.text);
    double height = double.parse(_heightcontrol.text)/100;
    double heightsq = height * height;
    double result = weight/heightsq;

    setState((){
      _result = result;
    });

  }
}


