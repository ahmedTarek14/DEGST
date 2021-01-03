import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: DGEST(),
    debugShowCheckedModeBanner: false,
  ));
}

class DGEST extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<DGEST> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/pexels-philippe-donn-1257860.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    'DGEST',
                    style: TextStyle(
                      fontFamily: 'PressStart2P',
                      fontSize: 70.0,
                      color: Colors.red[700],
                    ),
                  ),
                  Text(
                    'Welcome ツ',
                    style: TextStyle(
                        fontFamily: 'Lobster',
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[300]),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  TextFiledsLogIn(
                    hintText: 'Username',
                    hideText: false,
                  ),
                  TextFiledsLogIn(
                    hintText: 'Password',
                    hideText: true,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ButtonLogIn.loginScreenButtons(
                    buttonText: 'Sign In',
                    buttonPadding: EdgeInsets.symmetric(horizontal: 120.0),
                  ),
                  Text(
                    'Forget Password ?',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  Text(
                    'Don\'t have an account ?',
                    style: TextStyle(color: Colors.white),
                  ),
                  ButtonLogIn.loginScreenButtons(
                    buttonText: 'Sign Up',
                    buttonPadding: EdgeInsets.symmetric(horizontal: 60.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFiledsLogIn extends StatelessWidget {
  TextFiledsLogIn({@required this.hintText, this.hideText});

  final String hintText;
  final bool hideText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
      child: TextField(
        obscureText: hideText,
        onChanged: (value) {
          print(value);
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}

class ButtonLogIn extends StatelessWidget {
  ButtonLogIn.loginScreenButtons(
      {@required this.buttonText, this.buttonPadding});

  final String buttonText;
  final EdgeInsetsGeometry buttonPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        color: Colors.grey[700],
        shape: StadiumBorder(),
        padding: buttonPadding,
        onPressed: () {},
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}

/*
void onClick(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Center(child: Text("DEGST")),
            content: Text("login is OK"),
            backgroundColor: Colors.white,
            actions: [
              RaisedButton(
                color: Colors.grey,
                onPressed: () {},
                child: Text("OK"),
              ),
              RaisedButton(
                color: Colors.red,
                onPressed: () {},
                child: Text("CANCEL"),
              ),
            ]);
      });
}
CircleAvatar(
                radius: 90.0,
                backgroundImage: AssetImage('images/logo_transparent.png'),
                backgroundColor: Colors.purple[100],
              ),
*/
