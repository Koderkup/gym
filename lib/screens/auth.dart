import 'package:flutter/material.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({Key? key}) : super(key: key);

  @override
  State<AuthorizationPage> createState() => AuthorizationPageState();
}

class AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _email = '';
  String _password = '';
  bool showLogin = true;
  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Padding(
        padding: EdgeInsets.only(top: 100),
        child: Container(
          child: Align(
            child: Text(
              "GYM APPLICATION",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      );
    }

    Widget _input(Icon icon, String hint, TextEditingController controller,
        bool obsecure) {
      return Container(
        padding: EdgeInsets.only(bottom: 20, top: 10),
        child: TextField(
          controller: controller,
          obscureText: obsecure,
          style: TextStyle(color: Colors.white, fontSize: 20),
          decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.white30, fontSize: 20),
              hintText: hint,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 3)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54, width: 1)),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: IconTheme(
                  data: IconThemeData(color: Colors.white),
                  child: icon,
                ),
              )),
        ),
      );
    }

    Widget _button(String text, void func()) {
      return ElevatedButton(
        onPressed: () => func(),
        style: ButtonStyle(
          overlayColor:
              MaterialStateProperty.all(Theme.of(context).primaryColor),
          backgroundColor: MaterialStateProperty.all(Colors.green),
          foregroundColor:
              MaterialStateProperty.all(Theme.of(context).primaryColor),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
        ),
      );
    }

    Widget _form(String label, void func()) {
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: _input(
                    Icon(Icons.email), 'EMAIL', _emailController, false)),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: _input(
                    Icon(Icons.lock), 'PASSWORD', _passwordController, true)),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _button(label, func),
              ),
            ),
          ],
        ),
      );
    }

    void _buttonAction() {
      _email = _emailController.text;
      _password = _passwordController.text;

      _emailController.clear();
      _passwordController.clear();
    }

    Widget _bottomWave() {
      return Expanded(
        child: Align(
          child: ClipPath(
            child: Container(
              color: Colors.white,
              height: 300,
            ),
            clipper: BottomWaveClipper(),
          ),
          alignment: Alignment.bottomCenter,
        ),
      );
    }

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: <Widget>[

            _logo(),
            SizedBox(height: 100,),
            (showLogin
                ? Column(children: <Widget>[
                    _form("LOGIN", _buttonAction),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: GestureDetector(
                          child: Text('Не зарегистрировались? Регистрация',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                          onTap: () {
                            setState(() {
                              showLogin = !showLogin;
                            });
                          }),
                    )
                  ])
                : Column(
                    children: <Widget>[
                      _form("REGISTER", _buttonAction),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: GestureDetector(
                            child: Text('Уже зарегистрировались?  Login',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                            onTap: () {
                              setState(() {
                                showLogin = !showLogin;
                              });
                            }),
                      )
                    ],
                  )),
            _bottomWave()
          ],
        ));
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height + 5);

    var secondControlPoint = Offset(size.width - (size.width / 6), size.height);
    var secondEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
