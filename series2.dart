import 'package:flutter/material.dart';

class LoginApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isPasswordVisible = false;

  final TextEditingController firstNameController=TextEditingController();
  final TextEditingController secondNameController= TextEditingController();
  final TextEditingController thirdNameController=TextEditingController();
  final TextEditingController fourthNameController=TextEditingController();
  final TextEditingController fifthNameController=TextEditingController();
  String firstName = '';
  String lastName = '';
  String contact = '';
  String email = '';
  String password='';





  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Log In ',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Center(child: Icon(Icons.login)),
                ],
              ),
              SizedBox(height: 16),
              TextField(
                controller: firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  hintText: 'Enter your first name',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: secondNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  hintText: 'Enter Your last name',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: thirdNameController,
                decoration: InputDecoration(
                  labelText: 'Contact',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  hintText: 'Enter Your Contact number',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: fourthNameController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  hintText: 'Enter your Email Address',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: fifthNameController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  hintText: 'Enter Your Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      firstName=firstNameController.text;
                      lastName=secondNameController.text;
                      contact= thirdNameController.text;
                      email=fourthNameController.text;
                      password=fifthNameController.text;

                    }); // Perform login action here
                  },
                  child: Text('Login', style: TextStyle(fontSize: 20)),
                ),
              ),
              SizedBox(height: 16,),
              Text(
                "First Name :$firstName",
                style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500) ,

              ),
              Text(
                "Last Name :$lastName",
                style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500) ,

              ),
              Text(
                "Contact :$contact",
                style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500) ,

              ),
              Text(
                "Email :$email",
                style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500) ,

              ),
              Text(
                "Password :$password",
                style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500) ,

              )
            ],
            ),
        );
    }
}
